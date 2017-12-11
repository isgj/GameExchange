module QueryHelper
  require 'httparty'

  # IGDB key to make api calls
  @@api_key = ENV['IGDB_KEY']

  def search_query(query)
    fields = 'id,name,url,summary,first_release_date,cover,platforms'
    uri = "https://api-2445582011268.apicast.io/games/?search=#{query.query}&fields=#{fields}"
    begin
      resp = HTTParty.get(uri, headers: {"Accept" => "application/json", "user-key" => @@api_key})
      resp.inspect

      (new_games, all_games) = filter_existing_games(resp)
      save_platforms_of new_games.select{ |p| !p.nil? }
      query.games = all_games

      new_games.each do |g|
        game_info = GameInfo.new(
          api_id: g["id"],
          name: g["name"],
          summary: g["summary"],
          url: g["url"],
          platforms: g["platforms"]
        )
        game_info.release_date = Time.at(g["first_release_date"]/1000) if g["first_release_date"]
        game_info.cover = g["cover"]["url"] if g["cover"]

        if !game_info.save
          game_info.errors.full_messages.each {|m| query.errors.add(:games, "==> #{m}")}
        end
      end
    rescue => e
      logger.error "Rescued from #{e.inspect}, searching query"
      query.errors.add(:query, "Internal error parsing API response")
    end

    query
  end

  private
  def save_platforms_of(g_i)
    platforms = g_i.map {|g| g["platforms"]}.flatten.uniq
    found = Platform.where("api_id IN (?)", platforms).select(:api_id).map {|p| p.api_id}
    missing = platforms - found

    missing.each do |p|
      new_platform = Platform.new
      new_platform = search_platform(new_platform, p)

      if !new_platform.save
        logger.error "Cannot save platform: #{p}"
      end
    end
  end

  def search_platform(platform, id)
    fields = "id,name,logo,url,generation"
    uri = "https://api-2445582011268.apicast.io/platforms/#{id}/?fields=#{fields}"
    resp = HTTParty.get(uri, headers: {"Accept" => "application/json", "user-key" => @@api_key})
    begin
      resp.inspect
      platform.api_id = resp[0]["id"]
      platform.name = resp[0]["name"]
      platform.photo = resp[0]["logo"]["url"] if resp[0]["logo"]
      platform.url = resp[0]["url"]
      platform.generation = resp[0]["generation"]
    rescue => e
      logger.error "Rescued from #{e.inspect}, searching platform"
    end

    platform
  end

  def filter_existing_games(resp)
    ids = resp.map {|game|  game["id"]}
    found = GameInfo.where("api_id IN (?)", ids).select(:api_id).map {|g| g.api_id}
    missing = ids - found
    return resp.select {|g| missing.include?(g["id"])}, ids
  end
end
