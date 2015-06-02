# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
class TestClass
  include DataMagic
end
Given(/^I am on User_details page$/) do
  @browser.goto"#{@URL}"
  @Browser = UserPage.new @browser
end 
 
#Then(/^I should see (.*?)$/)do |text|
 #expect(@Browser.text.include? text).to eq(true)
 #sleep 5
#end

Given(/^I am on New User_details page$/) do
sleep 5
#@Browser PageObject::PageFactory
@Browser.visit
  #puts @Browser.text.include? 'Show'
  #puts @Browser.text
  DataMagic.yml_directory = 'features/yaml'
  DataMagic.load 'default.yml'
end 

Then(/^I Should see Arjun has user details$/) do
  @user_detail=File.open('/home/ignitemindz/document.json')
   @user_detail.each do |detail|
  # puts detail
  end
end
Then(/^I should see data_for "(.*?)"data$/)do |key|
 # TestClass.instance_variable_set "@private_firstsecond_index", 0
  @data_detail =TestClass.new
  @data =@data_detail.data_for key
  puts @data
end
When(/^I entered Archana in name$/)do
  @browser.goto "http://localhost:3000/user_details/new.json"

 puts @Browser.text
end