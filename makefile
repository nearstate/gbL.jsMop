all = test test-dot browser-test

.PHONY: $(all)

runner = ./node_modules/.bin/mocha
openinbrowser = open
testfiles = $(shell find ./test -name "*.js")
browserify = ./node_modules/.bin/browserify

test:
	@$(runner) --reporter spec $(testfiles)

browser-test:
	@cp ./node_modules/mocha/mocha.* ./test-browser
	@$(browserify) -o ./test-browser/browsertests.js $(testfiles)
	@open ./test-browser/browserTests.html

test-dot:
	@$(runner) --reporter dot $(testfiles)
