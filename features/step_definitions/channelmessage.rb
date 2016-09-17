require 'calabash-android/calabash_steps'

Given (/^I am in channel "(.*?)"$/) do |channel|
	if element_does_not_exist("* id:'drawer'")
		touch("Toolbar AppCompatImageButton")
	end
	touch("* text:'#{channel}'")
end

Then (/^I send an emoji$/) do
	touch("* id:'business_man'")
	touch("GridView AppCompatImageView index:1")
end

