Then /^I should see error (.*?)$/ do |error|
	wait_for_elements_exist("* id:'alertTitle'", :timeout => 1)

	message = query("* id:'message'", "text").first
	unless message != error
		fail "wrong error message: '#{message}'"
	end
end

