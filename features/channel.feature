@channel
Feature: Login feature

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

	@enterChannel
	Scenario: Drawer
		Given I am in main view
		Then I touch hamburger toggle button
		Then I scroll drawer to top
		Then I should see my username "user"
		Then I should see login address "localhost"

	@createMessage
	Scenario: Create test message
		Given I am in conversation "001_private"
		Then I wait
		Then I write message "Test Message from Calabash"
		Then I click send button
		Then I wait
		Then I should see message "Test Message from Calabash"

	@createMessageURL
	Scenario: Create url
		Given I am in conversation "001_private"
		Then I wait
		Then I write message "http://reactivex.io/"
		Then I click send button
		Then I wait
		Then I should see message "http://reactivex.io/"
		Then I wait
		Then I should see og "ReactiveX"
		Then I take a screenshot


