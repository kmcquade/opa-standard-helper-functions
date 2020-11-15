package helpers.network.cidr_analysis

# ---------------------------------------------------------------------------------------------------------------------
# are_ips_public
# Given a set of IP addresses, this will tell you whether or not any of the IPs are public
# ---------------------------------------------------------------------------------------------------------------------
example_public_ips_list = [
	"40.76.4.15/32",
	"40.76.4.0/28",
]

example_private_ips_list = [
	"10.0.1.0/24",
	"192.168.0.0/16",
]

test_are_ips_public_yes {
	true == are_ips_public(example_public_ips_list)
}

test_are_ips_public_false {
	false == are_ips_public(example_private_ips_list)
}

test_are_ips_public_not {
	not are_ips_public(example_private_ips_list)
}

# ---------------------------------------------------------------------------------------------------------------------
# cidr_set_intersects
# This function helps out the `are_ips_public` function
# ---------------------------------------------------------------------------------------------------------------------
test_cidr_set_intersects_pass {
	cidr_set_intersects(non_private_ip_ranges, "40.76.4.15/32")
}

test_cidr_set_intersects_false {
	# It's not in the public range, so insert not keyword
	false == cidr_set_intersects(non_private_ip_ranges, "192.168.1.1/32")
}

test_cidr_set_intersects_not {
	# It's not in the public range, so insert not keyword
	not cidr_set_intersects(non_private_ip_ranges, "192.168.1.1/32")
}