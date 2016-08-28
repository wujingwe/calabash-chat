Then /^I should see error (.*?)$/ do |error|
	wait_for_elements_exist("* id:'alertTitle'", :timeout => 1)
	query("* id:'message'", "text").first == error
end

