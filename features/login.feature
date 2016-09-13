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

	Scenario: Drawer
		Given I am in main view
		Then I touch hamburger toggle button
		Then I scroll drawer to top
		Then I should see my username "chattest"
		Then I should see login address "chat.synology.com"

	Scenario: Create channel 
		Given I am in drawer view
        Then I create a channel 
        Then I enter channelname field with "a b"
        Then I enter channelname field with "@"
		Then I check channelname length with "1234567812345678123456781234567812345678123456781234567812345678"
		Then I write channelname "Testok"
		Then I input purpose "automatic"
		Then I add members
		And I search the members
		Then I enabled Encrypt channel and create it
		And I check whether the titile is correct or not
	
	Scenario: Create test message in channel
		Given I am in channel "Testok"
		Then I write message "Hello"	
		Then I click send button			
		Then I wait
		Then I should see message "Hello"
		Then I send an emoji
		Then I click send button	
		Then I send a sticker

	Scenario: Create test message
		Given I am in conversation "Lloyd Wu"
		Then I write message "Test Message from Calabash"
		Then I click send button
		Then I wait
		Then I should see message "Test Message from Calabash"

