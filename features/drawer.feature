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
