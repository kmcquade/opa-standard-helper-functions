package network.overbroad_network_cidrs
import data.helpers.network.cidr_analysis.are_ips_public
import data.helpers.terraform.get_resources_by_type
import data.helpers.terraform.get_resources_created

import input as tfplan

resource_types = ["aws_security_group_rule"]
insecure_resources = find_insecure_resources_tf11(resource_types)
find_insecure_resources_tf11(resource_types) = insecure_resources_tf11

# ---------------------------------------------------------------------------------------------------------------------
# Terraform 0.11
# ---------------------------------------------------------------------------------------------------------------------

# List of insecure resources.
insecure_resources_tf11[ip] {
	resource := security_group_rule_ingress_changes[_]
	are_ips_public(cidr_blocks_to_check)
	ip := sprintf("%s%s%s", [resource.resourceType, ".", resource.name])
}

security_group_rule_ingress_changes[r] {
	resource := tfplan[_]
	resource.resourceType == "aws_security_group_rule"
	resource.attributes.type == "ingress"
	r := resource
}

cidr_blocks_to_check[ip] {
	resource := security_group_rule_ingress_changes[_]
	new_resource := resource.attributes
	new_resource.type == "ingress"
	pattern := `^cidr_blocks\.[0-9]$`
	ip := new_resource[re_match(pattern)]
}

# This is just for test data
default authz = false

authz {
	count(insecure_resources) == 0
}

