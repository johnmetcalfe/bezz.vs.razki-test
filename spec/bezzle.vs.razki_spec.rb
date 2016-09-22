describe "Bezzle.vs.Razki" do

  before(:all) do
    @driver = Selenium::WebDriver.for :chrome
    @email = "john.metcalfe@skybettingandgaming.com"
    @password = "password"
 end

  # it "Valid creating new book" do
  #
  #   book1 = HTTParty.post("http://localhost:8085/books", query:{title: "Test Book 1", body:"Awesome test book", rating: 5})
  #   expect(book1.code).to eq 201
  #   expect(book1.message).to eq "Created"
  #   expect(book1['title']).to eq "Test Book 1"
  #   expect(book1['body']).to eq "Awesome test book"
  #   expect(book1['rating']).to eq 5
  #
  #
  # end

  it "login and add a new voucher" do
    @title = "Test Voucher"
    @body = "Test Body"
    @rating = 5
    login
    #click New Voucher in Nav
    @driver.find_element(css: "body > nav > a:nth-child(3)").click
    #Enter Data
    @driver.find_element(css: "body > form > input[type='text']:nth-child(1)").send_keys @title
    @driver.find_element(css: "body > form > textarea").send_keys @body
    @driver.find_element(css: "body > form > input[type='text']:nth-child(3)").send_keys @rating
    #Submit Data
    @driver.find_element(css: "body > form > input[type='submit']:nth-child(4)").click
    #Check voucher Exists
    page = @driver.page_source
    expect(page.to_s).to include @title, @body, @rating.to_s
    #Delete Voucher
    @driver.find_element(css: "body > fieldset > h3 > a").click
    @driver.find_element(css: "body > form > button").click
    #@driver.quit

  end

  it "login and add a new book" do
    # @title = "Test Book"
    # @body = "Test Body"
    # @rating = 5
    # login
    # #click New Voucher in Nav
    # @driver.find_element(css: "body > nav > a:nth-child(3)").click
    # #Enter Data
    # @driver.find_element(css: "body > form > input[type='text']:nth-child(1)").send_keys @title
    # @driver.find_element(css: "body > form > textarea").send_keys @body
    # @driver.find_element(css: "body > form > input[type='text']:nth-child(3)").send_keys @rating
    # #Submit Data
    # @driver.find_element(css: "body > form > input[type='submit']:nth-child(4)").click
    # #Check voucher Exists
    # page = @driver.page_source
    # expect(page.to_s).to include @title, @body, @rating.to_s
    # #Delete Voucher
    # @driver.find_element(css: "body > fieldset > h3 > a").click
    # @driver.find_element(css: "body > form > button").click
    #@driver.quit

  end

  it "try logging in with incorrect details"

end
