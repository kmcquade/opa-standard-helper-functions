package main

import data.network.overbroad_network_cidrs

standard_error_message(package_name, error_message, insecure_resources) = msg {
	msg := sprintf("%s: %s for resources %s.", [package_name, error_message, insecure_resources])
}

# overbroad security group rule CIDRs
# Terraform 0.11 only right now
deny[msg] {
	insecure_resources := overbroad_network_cidrs.insecure_resources
	package_name := "network.overbroad_network_cidrs"
	error_message := "aws_security_group rules are outside the RFC1918 range."

	count(insecure_resources) > 0
	msg := standard_error_message(package_name, error_message, insecure_resources)
}
