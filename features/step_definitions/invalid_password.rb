Then /^I should see error (.*?)$/ do |error|
	wait_for_elements_exist("* id:'alertTitle'", :timeout => 2)

	has_text?(error)
end

