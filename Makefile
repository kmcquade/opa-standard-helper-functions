all: fmt test

fmt:
	@opa fmt policy -w

test:
	@opa test policy -v --explain full -l
