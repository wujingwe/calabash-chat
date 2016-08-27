console:
	calabash-android run $(APK)

html:
	calabash-android run $(APK) --format html --out reports.html
