@snooze
Feature: snooze feature

	Scenario: touch snooze icon
		Given I am in snooze view
		Then I set the snooze time for twenty_mins
		Then I check snooze time is correct or not
		
	
