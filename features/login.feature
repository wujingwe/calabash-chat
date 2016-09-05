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
		And I enter password field with "invalid"
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

	Scenario: Drawer
		Given I am in main view
		Then I touch hamburger toggle button
		Then I scroll drawer to top
		Then I should see my username "user"
		Then I should see login address "localhost"

	Scenario: Create test message
		Given I am in conversation "Lloyd Wu"
		Then I write message "Test Message from Calabash"
		Then I click send button
		Then I wait
		Then I should see message "Test Message from Calabash"


