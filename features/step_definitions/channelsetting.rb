require 'calabash-android/calabash_steps'

When (/^I am in drawer view$/) do
	if element_does_not_exist("* id:'drawer'")
		tap_when_element_exists("Toolbar AppCompatImageButton")
	end

	syntax = "* id:'create' index:0"
	q = query(syntax)
	while q.empty?
		scroll_down
		q = query(syntax)
	end
	tap_when_element_exists(syntax)
end

Then (/^I create a channel$/) do
	tap_when_element_exists("* id:'create'")
end

Then (/^I enter channelname field with "(.*?)"$/) do |input|
       check_element_exists("* id:'title'")
       query("AppCompatEditText id:'title'", setText:"#{input}")
       assert_text("Spaces and special characters are not allowed.")
end

Then (/^I check channelname length with "(.*?)"$/) do |input|
		query("AppCompatEditText id:'title'", setText:"#{input}")
     	assert_text("64 / 64")
end

Then (/^I write channelname "Testok"$/) do
		query("AppCompatEditText id:'title'", setText:"Testok")
end

Then (/^I input purpose "automatic"$/) do
		query("AppCompatEditText id:'description'", setText:"automatic")
end

Then (/^I add members $/) do
		tap_when_element_exists("* id:'members_layout'")
end

And (/^I search the members $/) do
	tap_when_element_exists("* id:'filter'")
	tap_when_element_exists("* id:'invite_layout'")
	tap_when_element_exists("* id:'filter'")
	query("* id:'filter'", setText:"freda")
	tap_when_element_exists("* id:'filter'")
	tap_when_element_exists("* id:'invite'")
	tap_when_element_exists("* id:'done'")
end

Then (/^I enabled Encrypt channel and create it $/) do
	tap_when_element_exists("* id:'private_'")
	tap_when_element_exists("* id:'done'")
end

And (/^I check whether the titile is correct or not $/) do

end



