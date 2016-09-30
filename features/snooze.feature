@snooze
Feature: snooze feature

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

	Scenario: touch snooze icon
		Given I am in snooze view
		Then I set the snooze time for "twenty_mins"
		Then I wait for progress
		Then I check snooze time is correct or not
		
	
