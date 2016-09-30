require 'calabash-android/calabash_steps'

Given (/^I am in snooze view$/) do 
	if element_does_not_exist("* id:'drawer'")
		touch("Toolbar AppCompatImageButton")
	end
	sleep 2
	touch("* id:'snooze'")
end

Then (/^I set the snooze time for "(.*?)"$/) do |input|
    touch("* id:'#{input}'")
end

Then (/^I check snooze time is correct or not/) do
	sleep 5 
    touch("* id:'snooze'")
	remain1 = query("* id:'remain'").last['text']
	sleep 5
	remain2 = query("* id:'remain'").last['text'] 
	if (remain1 <= remain2)
		raise "incorrect snooze time"
	end
end
