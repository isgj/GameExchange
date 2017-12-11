Given("I have the API mock for query") do
  fields = "id,name,url,summary,first_release_date,cover,platforms"

  stub_request(:get, "https://api-2445582011268.apicast.io/games/?search=new_query&fields=#{fields}").
    with(headers:{"Accept" => "application/json", "user-key" => ENV['IGDB_KEY']}).
    to_return(body: '[{"id":1,"platforms":[1]}]',
              headers: { 'Content-Type' => 'application/json' })
end

Given("I have the API mock for query-game") do
  fields = "id,name,url,summary,first_release_date,cover,platforms"

  stub_request(:get, "https://api-2445582011268.apicast.io/games/?search=new_query&fields=#{fields}").
    with(headers:{"Accept" => "application/json", "user-key" => ENV['IGDB_KEY']}).
    to_return(body: '[{"id":1000,"name":"New game from query","platforms":[1]}]',
              headers: { 'Content-Type' => 'application/json' })
end

Given("I have the API mock for query-game-platform") do
  fields = "id,name,url,summary,first_release_date,cover,platforms"
  platform_fields = "id,name,logo,url,generation"
  base_uri = "https://api-2445582011268.apicast.io"

  # Query response mock
  stub_request(:get, "#{base_uri}/games/?search=new_query&fields=#{fields}").
    with(headers:{"Accept" => "application/json", "user-key" => ENV['IGDB_KEY']}).
    to_return(body: '[{"id":1000,"name":"Another game","platforms":[6000]}]',
              headers: { 'Content-Type' => 'application/json' })

  # Platform response mock
  stub_request(:get, "#{base_uri}/platforms/6000/?fields=#{platform_fields}").
    with(headers:{"Accept" => "application/json", "user-key" => ENV['IGDB_KEY']}).
    to_return(body: '[{"id":6000,"name":"my-box"}]',
              headers: { 'Content-Type' => 'application/json' })
end

Then("the platform {string} should be saved") do |platform|
  assert_equal platform, Platform.last.name
end
