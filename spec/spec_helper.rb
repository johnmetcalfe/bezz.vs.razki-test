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

def create_book(title, body, rating)
  @title = title
  @body = body
  @rating = rating
  login
  #click New Book in Nav
  @driver.find_element(css: "body > nav > a:nth-child(5)").click
  #Enter Data
  @driver.find_element(css: "body > form > input[type='text']:nth-child(1)").send_keys @title
  @driver.find_element(css: "body > form > textarea").send_keys @body
  @driver.find_element(css: "body > form > input[type='text']:nth-child(3)").send_keys @rating
  #Submit Data
  @driver.find_element(css: "body > form > input[type='submit']:nth-child(4)").click

end

def create_voucher(title, body, rating)
  @title = title
  @body = body
  @rating = rating
  login
  #click New Voucher in Nav
  @driver.find_element(css: "body > nav > a:nth-child(3)").click
  #Enter Data
  @driver.find_element(css: "body > form > input[type='text']:nth-child(1)").send_keys @title
  @driver.find_element(css: "body > form > textarea").send_keys @body
  @driver.find_element(css: "body > form > input[type='text']:nth-child(3)").send_keys @rating
  #Submit Data
  @driver.find_element(css: "body > form > input[type='submit']:nth-child(4)").click
end
