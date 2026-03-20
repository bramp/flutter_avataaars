.PHONY: all format analyze test test-ci test-golden test-golden-ci fix clean run generate

# Device to run on: chrome, macos, ios, android (default: chrome)
DEVICE ?= chrome

## Run all checks (format, analyze, test)
all: format analyze test

## Run the example app (use DEVICE=macos, DEVICE=ios, etc.)
run:
	cd example && flutter run -d $(DEVICE)

## Format all Dart code
format:
	dart format .

## Run the analyzer across package and example
analyze:
	flutter analyze
	cd example && flutter analyze

## Run package tests (includes golden tests on macOS)
test:
ifeq ($(shell uname), Darwin)
	flutter test
else
	flutter test --exclude-tags mac
endif

## Run tests for CI (excludes golden/mac tests, injects build info)
test-ci:
	flutter test --exclude-tags mac \
		--dart-define=COMMIT_HASH=$$(git rev-parse --short HEAD) \
		--dart-define=BUILD_DATE="$$(date -u +'%Y-%m-%d %H:%M UTC')"

## Run golden tests (macOS only)
test-golden:
	flutter test --tags mac

## Run golden tests for CI (macOS only), updating goldens
test-golden-ci:
	flutter test --tags mac

## Apply auto-fixes
fix:
	dart fix --apply

## Delete build artifacts
clean:
	flutter clean
	cd example && flutter clean

## Regenerate SVG data from React avataaars library
generate:
	cd avataaars-generator && NODE_PATH=./node_modules node ../tools/extract_svg_fragments.js
	python3 tools/generate_svg_data.py
	dart format lib/src/svg/svg_data.dart
