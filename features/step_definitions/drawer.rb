require 'calabash-android/calabash_steps'

Given /^I am in main view$/ do
	wait_for_elements_exist("* id:'drawer_layout'", :timeout => 1)
end

Then /^I touch hamburger toggle button$/ do
	touch("ImageButton")
end

Then /^I scroll drawer to top$/ do
	scroll_to_row("RecyclerView index:1", 0)
end

Then /^I should see my username "(.*?)"$/ do |input|
	assert_text(input)
end

Then /^I should see login address "(.*?)"$/ do |address|
	assert_text(address)
end
