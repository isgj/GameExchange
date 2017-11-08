Given("I have a user with email address {string}") do |email|
  user = User.new
  user.email = email
  user.password = 'password'
  user.save!
end

Given("I am on the homepage") do
  visit root_path
end

When("I click the {string} {string}") do |link, type|
  case type
  when "button"
    find_button(link).click
  when "link"
    first(:link, link).click
  end
end

Then("I should be on the {string} page") do |page|
  assert_equal path_to(page), current_url
end

When("I fill in {string} with {string}") do |field, value|
  fill_in field, :with => value
end

Then("I should see the {string} button") do |content|
  assert page.has_content?(content)
end
