Given("I have a user with email address {string}") do |email|
  user = User.new
  user.email = email
  user.password = 'password'
  user.save!
end

Given("I am on the {string} page") do |page|
  visit path_to(page)
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

Then("I should see the {string}") do |content|
  assert page.has_content?(content)
end

Then("I should see {string} button") do |content|
  page.has_button?(content)
end

Then("I should not see the {string}") do |content|
  assert_not page.has_content?(content)
end

# Check the current page
Then("open the page") do
  save_and_open_page
end

Given("I am the user {string}") do |user|
  sign_in users(user.to_sym)
end

Given("I am on the {string} {string} page") do |page, id|
  visit model_page(page, id)
end

Then("I should be on the {string} page of {string}") do |page, id|
  assert_equal model_page(page, id), current_url
end

When("I select {string} from {string}") do |option, selection|
  select option, :from => selection
end

Given("I am on the {string} page of {string}") do |page, id|
  visit model_page(page, id)
end
