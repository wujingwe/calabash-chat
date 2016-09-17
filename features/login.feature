@login
Feature: Login feature

	@rotate @restart
	Scenario: Rotate
		Given I am on the login window
		Then I hide keyboard
		Then I set screen to portrait
		Then I wait
		Then I take a "portrait" screenshot
		Then I set screen to landscape
		# Wait a bit to see landscape in screenshot
		Then I wait
		Then I take a "landscape" screenshot

	@invalid_password
	Scenario: Show error when enter wrong password
		Given I am on the login window
		Then I set screen to portrait
		When I enter address field with "localhost"
		And I enter account field with "user"
		And I enter password field with "wrong_password"
		And I check HTTPS CheckBox
		And I click on LOGIN Button
		Then I wait for progress
		Then I wait
		Then I take a screenshot
		Then I should see error "帳號或密碼有誤，請再試一次。"

	@validlogin
	Scenario: As a valid user I can log into my app
		Given I hide AlertDialog
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

