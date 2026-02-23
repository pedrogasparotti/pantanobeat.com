.PHONY: run run-drafts build clean new update

run:
	hugo server --navigateToChanged

run-drafts:
	hugo server --buildDrafts --navigateToChanged

build:
	hugo --gc --minify

clean:
	rm -rf public/ resources/_gen/ .hugo_build.lock

new:
	@if [ -z "$(section)" ] || [ -z "$(name)" ]; then \
		echo "Usage: make new section=posts name=my-post-slug"; \
		exit 1; \
	fi
	hugo new content $(section)/$(name).md

update:
	hugo mod get -u ./...
	hugo mod tidy
