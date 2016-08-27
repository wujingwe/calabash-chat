@login
Feature: Login feature
	@validlogin
	Scenario: As a valid user I can log into my app
		Given I am on the login window
		When I enter address field with "localhost"
		And I enter account field with "user"
		And I enter password field with "ooxx"
		And I check HTTPS CheckBox
		And I click on LOGIN Button
		Then I wait for progress
		Then I take a screenshot
		Then I should user login successfully

	@invalid_password
	Scenario: Show error when enter wrong password
		Given I am on the login window
		When I enter address field with "localhost"
		And I enter account field with "user"
		And I enter password field with "invalid"
		And I check HTTPS CheckBox
		And I click on LOGIN Button
		Then I wait for progress
		Then I take a screenshot
		Then I should user login unsuccessfully
