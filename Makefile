build:
	docker build -t hagrid:dev .

run:
	docker run --rm -it -p 7272:7272\
		-v $(shell pwd)/temp:/var/lib/hagrid\
		-e port=7272\
		-e base_URI="https://localhost:7272"\
		-e from="noreply@localhost"\
		-e x_accel_redirect=false\
		-e token_secret="hagrid"\
		-e token_validity=3600\
		-e mail_rate_limit=60 hagrid:dev
