Feature: User page 
    
    
    @authorized_access
    Scenario: To check all the elements of Login Page 
        When I am on User_details page
        #Then I should see "age":24,
           # And I should see ""created_at":"2015-05-18T07:33:09Z","
            #And I should see ""id":1,"
           # And I should see ""mobile":"9445484444","
           # And I should see ""name":"jansi","
            #And I should see ""updated_at":"2015-05-18T07:33:09Z"},"
        When I am on New User_details page
        Then I Should see Arjun has user details
            And I should see data_for "jansi"data
        When I entered Archana in name