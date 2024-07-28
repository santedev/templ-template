run: build
	@./bin/app
build:
	@~/go/bin/templ generate && \
	 ./tailwindcss -i views/css/app.css -o public/styles.css \
	&& go build -o bin/app .
css:
	./tailwindcss -i views/css/app.css -o public/styles.css --watch
templ:
	~/go/bin/templ generate --watch --proxy=http://localhost:8000
build-js:
	@curl -o public/scripts/htmx.min.js https://unpkg.com/htmx.org@2.0.1/dist/htmx.min.js \
	&& curl -o public/scripts/alpine.js https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js \
	&& curl -o public/scripts/jquery.min.js https://code.jquery.com/jquery-3.7.1.min.js