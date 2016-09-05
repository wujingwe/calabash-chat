require 'calabash-android/calabash_steps'

Given /^I am in conversation "(.*?)"$/ do |conversation|
	if element_does_not_exist("* id:'drawer'")
		touch("ImageButton")
	end
	touch("* text:'#{conversation}'")
end

Then /^I write message "(.*?)"$/ do |input|
	query("MsgMultiAutoCompleteTextView id:'message'", setText:"#{input}")
end

Then /^I click send button$/ do
	touch("* id:'send'")
end

Then /^I should see message "(.*?)"$/ do |expected|
	lastMessage = query("RecyclerView AppCompatTextView id:'message'").last['text']
	if expected != lastMessage
		raise "I DON'T see #{message} in last message"
	end
end
