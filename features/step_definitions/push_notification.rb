require 'calabash-android/calabash_steps'
require 'open3'
require 'nokogiri'

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

Then (/^I should see notification "(.*?)"$/) do |notification|
    timeout = 5 # 5 seconds
    click_notification_matched_by_full_text(
        (timeout || 1).to_f * 1000, notification, notification)
end

def uiautomator_dump
    stdout, stderr, status = exec_adb("shell uiautomator dump")
    unless /dumped to: (?<file>\S*)/ =~ stdout
        fail "uiautomator dump failed? Returned #{stdout} :: #{stderr}"
    end
    stdout, stderr, status = exec_adb("shell cat #{file}")
    [stdout, stderr, status]
end

def xpath_for_full_path_texts(params)
    texts = params.keys.grep(/^notification.full./)
    clauses = texts.collect { |k| "./node/node[@text='#{params[k]}']" }
    "//node[#{clauses.join('][')}]"
end

def extract_integer_bounds(set)
    return nil if set.empty?
    match = (set.attr('bounds').to_s.match(/\[(\d+),(\d+)\]\[(\d+),(\d+)\]/))
    match.captures.collect(&:to_i)
end

def bounds_from_xpath(xpath)
    stdout, _stderr, _status = uiautomator_dump
    set = Nokogiri::XML(stdout).xpath(xpath)
    if (bounds = extract_integer_bounds(set))
        return yield bounds
    else
        return nil
    end
end

def open_notification_shutter
    bounds_from_xpath('//node[1]') do |x1, y1, x2, y2|
        xm = (x1 + x2) >> 1
        exec_adb("shell input swipe #{xm} #{y1} #{xm} #{y2}")
    end
end

def tap_notification(xpath)
    found_bounds = bounds_from_xpath(xpath) do |x1, y1, x2, y2|
        ym = (y1 + y2) >> 1
        exec_adb("shell input tap #{(x1 + x2) >> 1} #{ym}")
        dismissed = !found_bounds.nil?
        keyboard_enter_keyevent('KEYCODE_BACK') unless dismissed
        return dismissed
    end
end

def dismiss_notification(xpath)
    found_bounds = bounds_from_xpath(xpath) do |x1, y1, _x2, y2|
        ym = (y1 + y2) >> 1
        exec_adb("shell input swipe #{x1} #{ym} 10000 #{ym}")
    end
    found_bounds.nil?
end

def handle_notification(params)
    xpath = xpath_for_full_path_texts(params)
    timeout = params['timeout'].to_i
    start = Time.new
    while start + timeout / 1000 > Time.new
        open_notification_shutter
        if params['action.click']
            break if tap_notification(xpath)
        else
            break if dismiss_notification(xpath)
        end
    end
end

def click_notification_matched_by_full_text(timeout, *strings)
    h = { 'timeout' => timeout.to_s, 'action.click' => 'true' }
    strings.map.with_index { |v, i| h["notification.full.#{i}"] = v if v }
    handle_notification(h)
end

def dismiss_notification_matched_by_full_text(timeout, *strings)
    h = { 'timeout' => timeout.to_s, 'action.dismiss' => 'true' }
    strings.map.with_index { |v, i| h["notification.full.#{i}"] = v if v }
    handle_notification(h)
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