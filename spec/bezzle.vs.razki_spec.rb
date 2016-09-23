describe "Bezzle.vs.Razki" do

  before(:all) do
    @driver = Selenium::WebDriver.for :chrome
    @email = "john.metcalfe@skybettingandgaming.com"
    @password = "password"
 end

  # it "Valid creating new book" do
  #
  #   login
  #   book1 = HTTParty.post("http://localhost:8085/books", query:{title: "Test Book 1", body:"Awesome test book", rating: 5})
  #   expect(book1.code).to eq 201
  #   expect(book1.message).to eq "Created"
  #   expect(book1['title']).to eq "Test Book 1"
  #   expect(book1['body']).to eq "Awesome test book"
  #   expect(book1['rating']).to eq 5
  #
  # end

  it "login and add a new voucher check it exists and delete it" do
    create_voucher("Test Voucher", "Test Body", 5)
    #Check voucher Exists
    page = @driver.page_source
    expect(page.to_s).to include @title, @body, @rating.to_s
    #Delete Voucher
    @driver.find_element(css: "body > fieldset > h3 > a").click
    @driver.find_element(css: "body > form > button").click

  end

  it "login and add a new book check it exists and delete it" do
    create_book("Test Book", "Test Body", 5)
    #Check Book Exists
    page = @driver.page_source
    expect(page.to_s).to include @title, @body, @rating.to_s
    #Delete Book
    @driver.find_element(css: "body > fieldset > h3 > a").click
    @driver.find_element(css: "body > form > button").click

  end

  it "Login create a new voucher and check it exists then edit and check the edit is update, then delete the voucher" do
    create_voucher("Test Voucher", "Test Body", 5)
    #Check Voucher exists
    page = @driver.page_source
    expect(page.to_s).to include @title, @body, @rating.to_s
    #Edit the voucher
    @driver.find_element(css: "body > fieldset > a").click
    @driver.find_element(css: "body > form > input[type='text']:nth-child(2)").send_keys " Updated"
    @driver.find_element(css: "body > form > input[type='submit']:nth-child(5)").click
    #Check updated exists
    page_updated = @driver.page_source
    expect(page_updated.to_s).to include "#{@title} Updated", @body, @rating.to_s
    #Delete Updated Voucher
    @driver.find_element(css: "body > fieldset > h3 > a").click
    @driver.find_element(css: "body > form > button").click

  end

  it "Login create a new voucher and check it exists then edit and check the edit is update, then delete the voucher" do
    create_book("Test Book", "Test Body", 5)
    #Check Book exists
    page = @driver.page_source
    expect(page.to_s).to include @title, @body, @rating.to_s
    #Edit the Book
    @driver.find_element(css: "body > fieldset > a").click
    @driver.find_element(css: "body > form > input[type='text']:nth-child(2)").send_keys " Updated"
    @driver.find_element(css: "body > form > input[type='submit']:nth-child(5)").click
    #Check updated exists
    page_updated = @driver.page_source
    expect(page_updated.to_s).to include "#{@title} Updated", @body, @rating.to_s
    #Delete Updated Book
    @driver.find_element(css: "body > fieldset > h3 > a").click
    @driver.find_element(css: "body > form > button").click

  end

  it "login and add a new voucher check it exists and delete it" do
    create_voucher("g", "g", 5)
    #Check voucher Exists
    page = @driver.page_source
    expect(page.to_s).to include "Voucher validation failed"

  end

  it "login and add a invalid book check error exists" do
    create_book("g", "g", 4)
    #Check Book Exists
    page = @driver.page_source
    expect(page.to_s).to include "Book validation failed"

  end

  it "Login create a new voucher and check it exists then edit and check the edit is update, then delete the voucher" do
    create_voucher("Test Voucher", "Test Body", 5)
    #Check Voucher exists
    page = @driver.page_source
    expect(page.to_s).to include @title, @body, @rating.to_s
    #Edit the voucher
    @driver.find_element(css: "body > fieldset > a").click
    @driver.find_element(css: "body > form > input[type='text']:nth-child(2)").send_keys ""
    @driver.find_element(css: "body > form > input[type='text']:nth-child(2)").send_keys "zig"
    @driver.find_element(css: "body > form > input[type='submit']:nth-child(5)").click
    #Check updated exists
    page = @driver.page_source
    expect(page.to_s).to include "Voucher validation failed"

  end

  it "Login create a new voucher and check it exists then edit and check the edit is update, then delete the voucher" do
    create_book("Test Book", "Test Body", 5)
    #Check Book exists
    page = @driver.page_source
    expect(page.to_s).to include @title, @body, @rating.to_s
    #Edit the Book
    @driver.find_element(css: "body > fieldset > a").click
    @driver.find_element(css: "body > form > input[type='text']:nth-child(2)").send_keys " Updated"
    @driver.find_element(css: "body > form > input[type='submit']:nth-child(5)").click
    #Check updated exists
    page = @driver.page_source
    expect(page.to_s).to include "Book validation failed"

  end

  after(:all) do
    #@driver.quit
  end

end
