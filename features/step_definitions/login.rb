require 'calabash-android/calabash_steps'

Given /^I am on the login window$/ do
	wait_for(:timeout => 1) {
		element_exists("* id:'address'")
	}
	check_element_exists("* id:'address'")
end
		
When /^I enter address field with "(.*?)"$/ do |input|
	check_element_exists("* id:'address'")
	query("* id:'address'", setText:"#{input}")
end

And /^I enter account field with "(.*?)"$/ do |input|
	check_element_exists("* id:'account'")
	query("* id:'account'", setText:"#{input}")
end

And /^I enter password field with "(.*?)"$/ do |input|
	check_element_exists("* id:'password'")
	query("* id:'password'", setText:"#{input}")
end

And /^I check HTTPS CheckBox$/ do
	check_element_exists("* id:'cb_https'")
	if (!query("* id:'cb_https'").first['checked'])
		touch("* id:'cb_https'")
	end
end

And /^I click on LOGIN Button$/ do
	check_element_exists("* id:'btn_login'")
	touch("* id:'btn_login'")
end

Then /^I should user login successfully$/ do
	wait_for_element_does_not_exist("DialogTitle id:'alertTitle'", :timeout => 2)
end
