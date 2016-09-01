Then /^I should see error "(.*?)"$/ do |error|
	wait_for_elements_exist("* id:'alertTitle'", :timeout => 2)

	assert_text(error)
end

