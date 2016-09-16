@pushNotification
Feature: Push notification feature

	@validlogin @restart
	Scenario: As a valid user I can log into my app
		Given I am on the login window
		Then I set screen to portrait
		When I enter address field with "localhost"
		And I enter account field with "user"
		And I enter password field with "password"
		And I check HTTPS CheckBox
		And I click on LOGIN Button
		Then I wait for progress
		Then I wait
		Then I take a screenshot
		Then I should user login successfully

	@receiveNotification
	Scenario: Receive message
		# wait for channel finish initialization
		Given I wait for 5 seconds
		Given I move app to background
        #And there are no notifications with "push(socket connected|disconnected)"
        And Server sends message "push(socket connected)"
		#When I click a notification with "Chat" and "push(socket connected)"
		# wait 5 mins for socket disconnected
        Then I wait for 300 seconds
        And the server sends me message "push(socket disconnected)"
		#When I click a notification with "Chat" and "push(socket disconnected)"
