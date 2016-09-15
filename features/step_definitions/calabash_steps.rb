require 'calabash-android/calabash_steps'

Then (/^I set screen to portrait$/) do
	perform_action('set_activity_orientation', 'portrait')
end

Then (/^I set screen to landscape$/) do
	perform_action('set_activity_orientation', 'landscape')
end

Then (/^I hide keyboard$/) do
	hide_soft_keyboard()
end

Then (/^I take a (.*?) screenshot$/) do |rotation|
	screenshot_embed(:name => "#{rotation}_#{Time.now.to_i}")
end

Then (/^I hide AlertDialog$/) do
	touch("* id:'button1'")
end
