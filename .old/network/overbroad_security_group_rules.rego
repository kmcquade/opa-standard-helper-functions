package policy.ec2.overbroad_security_group_rules

import data.helpers.network.cidr_analysis.are_ips_public
import data.terraform.get_resources_by_type
import data.terraform.get_resources_created

import data.commmon.hash_contains_key_pattern
import input as tfplan

#########
# Policy
#########
security_group_rule_ingress_changes[r] {
	resource := tfplan[_]
	resource.resourceType == "aws_security_group_rule"
	resource.attributes.type == "ingress"
	r := resource
}

any_security_group_rules_with_illegal_ips[ip] {
	resource := security_group_rule_ingress_changes[_]
	are_ips_public(cidr_blocks_to_check)

	# This one is just for troubleshooting, to get the count
	# ip := cidr_blocks_to_check
	# If we want to just point to the security group name
	# ip := resource.name
	ip := sprintf("%s%s%s", [resource.resourceType, ".", resource.name])
}

cidr_blocks_to_check[ip] {
	resource := security_group_rule_ingress_changes[_]
	new_resource := resource.attributes
	new_resource.type == "ingress"
	pattern := `^cidr_blocks\.[0-9]$`
	ip := new_resource[re_match(pattern)]
}

default authz = false

authz {
	count(any_security_group_rules_with_illegal_ips) == 0
}

