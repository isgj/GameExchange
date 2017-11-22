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

  def model_page(page, user)
    case page
    when /^gamer/
      gamer_url(user)
    when /edit gamer/
      edit_gamer_url(user)
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

end

World(NavigationHelpers)