Then /^I should user login unsuccessfully$/ do
	wait_for_elements_exist("* id:'alertTitle'", :timeout => 1)
	query("* id:'message'", "text").first == "帳號或密碼有誤，請再試一次。"
end

