console:
	calabash-android run $(APK)

html:
	calabash-android run $(APK) --format html --out reports.html

clean:
	rm -rf *.png
	rm -rf cucumber.json
