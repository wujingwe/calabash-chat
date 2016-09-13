require 'calabash-android/calabash_steps'

When /^I am in drawer view$/ do
	if element_does_not_exist("* id:'drawer'")
		touch("ImageButton")
	end
	touch("* id:'create' index:0")
end

Then /^I create a channel$/ do
	touch("* id:'create'")
end

Then /^I enter channelname field with "(.*?)"$/ do |input|
       check_element_exists("* id:'title'")
       query("AppCompatEditText id:'title'", setText:"#{input}")
       assert_text("Spaces and special characters are not allowed.")
end

Then  /^I check channelname length with "(.*?)"$/ do |input|
		query("AppCompatEditText id:'title'", setText:"#{input}")
     	assert_text("64 / 64")
end

Then  /^I write channelname "Testok"$/ do
		query("AppCompatEditText id:'title'", setText:"Testok")
end

Then  /^I input purpose "automatic"$/ do
		query("AppCompatEditText id:'description'", setText:"automatic")
end

Then  /^I add members $/ do
		touch("* id:'members_layout'")
end

And /^I search the members $/ do
	touch("* id:'filter'")
	touch("* id:'invite_layout'")
	touch("* id:'filter'")
	query("* id:'filter'", setText:"freda")
	touch("* id:'filter'")
	touch("* id:'invite'")
	touch("* id:'done'")
end

Then  /^I enabled Encrypt channel and create it $/ do
	touch("* id:'private_'")
	touch("* id:'done'")
end

And /^I check whether the titile is correct or not $/ do
	
end



