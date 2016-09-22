RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end


require 'rspec'
require 'httparty'
require 'selenium-webdriver'
require 'yaml'

def url(path)
  ('http://localhost:8085/' + path)
end

def login
  @url = "http://localhost:8085/sessions/new"
  @driver.get @url
  @driver.find_element(name: "email").send_keys @email
  @driver.find_element(name: "password").send_keys @password
  @driver.find_element(css: "body > form > input[type='submit']").click
end
