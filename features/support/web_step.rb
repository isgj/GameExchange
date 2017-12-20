module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /home/
      root_url
    when /sign in/
      new_user_session_url
    when /sign up/
      new_user_registration_url
    when /gamers/
      gamers_url
    when /edit account/
      edit_user_registration_url
    when /^queries$/
      queries_url
    when /^new query$/
      new_query_url
    when /^last query$/
      query_url(Query.last)
    when /titles/
      titles_url
    when /games/
      games_url
    when /^new game$/
      new_game_url(params: {game_info: game_infos(:one).id})
    when /^last game$/
      game_url(Game.last)
    when /^requests$/
      desires_url
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end

  def model_page(page, model)
    case page
    when /^gamer$/
      gamer_url(users(model.to_sym))
    when /edit gamer/
      edit_gamer_url(users(model.to_sym))
    when /friends/
      friends_gamer_url(users(model.to_sym))
    when /blocks/
      blocks_gamer_url(users(model.to_sym))
    when /query/
      query_url(queries(model.to_sym))
    when /^game$/
      game_url(games(model.to_sym))
    when /^title$/
      title_url(game_infos(model.to_sym))
    when /^platform$/
      platform_url(platforms(model.to_sym))
    when /^edit platform$/
      edit_platform_url(platforms(model.to_sym))
    when /^edit title$/
      edit_title_url(game_infos(model.to_sym))
    when /^desire$/
      desire_url(desires(model.to_sym))
    end
  end

  # Test OmniAuth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
    :provider => 'google',
    :uid => '123545',
    :info => {
      :email => 'example@example.com'
    }
    # etc.
  })

  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    :provider => 'facebook',
    :uid => '123545',
    :info => {
      :email => 'example@example.com'
    }
    # etc.
  })

  # Testing API with mock-response
  require 'webmock/cucumber'
end

World(NavigationHelpers)
