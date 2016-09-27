require 'calabash-android/calabash_steps'

Given (/^I am in snooze view$/) do 
	if element_does_not_exist("* id:'drawer'")
		touch("Toolbar AppCompatImageButton")
	end
	touch("* id:'snooze'")
end

Then (/^I set the snooze time for "(.*?)"$/) do |input|
     touch("* id:'#{input}'")
end

Then (/^I check snooze time is correct or not/) do 
    touch("* id:'snooze'")
	remain1 = query("* id:'remain'").last['text']
	sleep5
	remain2 = query("* id:'remain'").last['text'] 
	if(remain1 > remain2)
		return true
	else
		raise "incorrect snooze time"
	end
end
	
	

		
