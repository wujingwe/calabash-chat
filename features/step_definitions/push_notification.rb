require 'calabash-android/calabash_steps'
require 'open3'

Given (/^I move app to background$/) do
	keyboard_enter_keyevent('KEYCODE_HOME')
end

And (/^There are no notifications with "([^"]*?)"(:? and "([^"]*)")?(?: within (\d+) seconds?)?$/) do |text1, text2, timeout|
    # Shouldn't really *do* something in a 'given', but...
    dismiss_notification_matched_by_full_text(
        (timeout || 1).to_f * 1000, text1, text2)
end

And (/^Server sends message "(.*?)"$/) do |message|
    timestamp = Time.now.to_i()
    registrationId = get_preferences("dschat_pref_file")['registrationId']
    cmd = "curl --header \"Authorization: key=#{GCM_KEY}\" "\
        "--header Content-Type:\"application/json\" "\
        "https://gcm-http.googleapis.com/gcm/send   "\
        "-d '{\"data\":{\"msg\":{\"raw_data\":\"#{message}\",\"extra_data\":{\"post_id\":#{timestamp},\"channel_id\":1,\"timestamp\":#{timestamp}}}}, \"registration_ids\":[\"#{registrationId}\"]}'"

    stdout, stderr, status = Open3.capture3(cmd)
    unless status.success?
        fail "Adb failed: #{cmd} Returned #{stdout} :: #{stderr}"
    end
end

def exec_adb(cmd)
    adb_cmd = "#{default_device.adb_command} #{cmd}"
    stdout, stderr, status = Open3.capture3(adb_cmd)
    unless status.success?
        fail "Adb failed: #{adb_cmd} Returned #{stdout} :: #{stderr}"
    end
    [stdout, stderr, status]
end

def keyboard_enter_keyevent(keyevent)
    exec_adb("shell input keyevent #{keyevent}")
end