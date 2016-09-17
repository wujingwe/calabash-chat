require 'calabash-android/calabash_steps'

Given (/^I am in main view$/) do
	wait_for_elements_exist("* id:'drawer_layout'", :timeout => 10)
end

Then (/^I touch hamburger toggle button$/) do
	if element_does_not_exist("* id:'drawer'")
		tap_when_element_exists("Toolbar AppCompatImageButton")
	end
end

Then (/^I scroll drawer to top$/) do
	scroll_to_row("RecyclerView index:1", 0)
end

Then (/^I should see my username "(.*?)"$/) do |input|
	if (defined? ACCOUNT) != nil
		input = ACCOUNT
	end
	assert_text(input)
end
