all: fmt test tfplan tftest

fmt:
	@opa fmt policy -w

test:
	@opa test policy -v --explain full

verify:
	@conftest verify --data policy --no-color

trace:
	@conftest verify --data policy --no-color --trace

# Set TF_SUBFOLDER to where you have your pass/fail Terraform
# The script will tell them if they do not set it
tfplan:
	sh ./scripts/tfplan.sh

tftest:
	@conftest test $(TF_SUBFOLDER)/plan.json \
		--policy policy \
		--data policy

