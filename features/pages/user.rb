# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
class UserPage
  include PageObject
  include DataMagic
 
  URL = {:test=>"http://localhost:3000/user_details"}
  text_field(:name_box,:id => "user_detail_name")
  text_field(:mobile,:id => "user_detail_mobile")
  cell(:name,:text => "60")
  def visit
    @browser.goto URL[:test]
  end
  
    def populate_page
    populate_page_with data_for :my_page
  end
 end
 