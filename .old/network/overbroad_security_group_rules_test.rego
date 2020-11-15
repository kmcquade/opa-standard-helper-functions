package policy.ec2.overbroad_security_group_rules

import input as tfplan

test_overbroad_security_group_rules_pass {
	authz with tfplan as {
		"aws_security_group.test": {
			"attributes": {
				"arn": "",
				"description": "Managed by Terraform",
				"egress.#": "",
				"id": "",
				"ingress.#": "",
				"name": "",
				"owner_id": "",
				"revoke_rules_on_delete": "false",
				"vpc_id": "",
			},
			"name": "test",
			"resourceType": "aws_security_group",
			"requiresNew": true,
			"willBeDestroyed": false,
		},
		"aws_security_group_rule.test": {
			"attributes": {
				"cidr_blocks.#": "1",
				"cidr_blocks.0": "10.0.0.0/16",
				"from_port": "0",
				"id": "",
				"protocol": "tcp",
				"security_group_id": "${aws_security_group.test.id}",
				"self": "false",
				"source_security_group_id": "",
				"to_port": "65535",
				"type": "ingress",
			},
			"oldAttributes": {
				"cidr_blocks.#": "",
				"cidr_blocks.0": "",
				"from_port": "",
				"id": "",
				"protocol": "",
				"security_group_id": "",
				"self": "",
				"source_security_group_id": "",
				"to_port": "",
				"type": "",
			},
			"name": "test",
			"resourceType": "aws_security_group_rule",
			"requiresNew": true,
			"willBeDestroyed": false,
		},
	}
}

test_overbroad_security_group_rules_fail {
	not authz with tfplan as {
		"aws_security_group.test": {
			"attributes": {
				"arn": "",
				"description": "Managed by Terraform",
				"egress.#": "",
				"id": "",
				"ingress.#": "",
				"name": "",
				"owner_id": "",
				"revoke_rules_on_delete": "false",
				"vpc_id": "",
			},
			"name": "test",
			"resourceType": "aws_security_group",
			"requiresNew": true,
			"willBeDestroyed": false,
		},
		"aws_security_group_rule.test": {
			"attributes": {
				"cidr_blocks.#": "1",
				"cidr_blocks.0": "0.0.0.0/0",
				"from_port": "0",
				"id": "",
				"protocol": "tcp",
				"security_group_id": "${aws_security_group.test.id}",
				"self": "false",
				"source_security_group_id": "",
				"to_port": "65535",
				"type": "ingress",
			},
			"name": "test",
			"resourceType": "aws_security_group_rule",
			"requiresNew": true,
			"willBeDestroyed": false,
		},
		"aws_security_group_rule.test2": {
			"attributes": {
				"cidr_blocks.#": "2",
				"cidr_blocks.0": "40.76.4.15/32",
				"cidr_blocks.1": "40.112.72.205/32",
				"from_port": "0",
				"id": "",
				"protocol": "tcp",
				"security_group_id": "${aws_security_group.test.id}",
				"self": "false",
				"source_security_group_id": "",
				"to_port": "65535",
				"type": "ingress",
			},
			"name": "test2",
			"resourceType": "aws_security_group_rule",
			"requiresNew": true,
			"willBeDestroyed": false,
		},
	}
}
