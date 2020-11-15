package helpers.terraform

import data.helpers.terraform.test_data

# ---------------------------------------------------------------------------------------------------------------------
# get_resources_by_types
# ---------------------------------------------------------------------------------------------------------------------

test_get_resources_by_types_submodule {
	tfplan := test_data.tfplan_test_get_resources_by_types_submodule
	expected_result := [
		{
			"address": "module.sns-topic.aws_sns_topic.alarm[0]",
			"mode": "managed",
			"type": "aws_sns_topic",
			"name": "alarm",
			"index": 0,
			"provider_name": "aws.us-west-2",
			"schema_version": 0,
			"values": {"kms_master_key_id": null},
		},
		{
			"address": "module.sns-topic.aws_sns_topic.sns-alarm",
			"mode": "managed",
			"type": "aws_sns_topic",
			"name": "sns-alarm",
			"provider_name": "aws",
			"schema_version": 0,
			"values": {"kms_master_key_id": null},
		},
	]

	expected_result == get_resources_by_types_submodule(tfplan, ["aws_sns_topic"])
}

test_get_planned_values_submodule_variable {
	tfplan := test_data.tfplan_test_get_planned_values_submodule_variable
	expected_result := {
		"address": "module.s3_notification_sns.aws_sns_topic.alarm",
		"mode": "managed",
		"type": "aws_sns_topic",
		"name": "alarm",
		"provider_name": "aws",
		"schema_version": 0,
		"values": {"kms_master_key_id": "alias/sns-key"},
	}

	expected_result == get_planned_values_submodule(tfplan, "aws_sns_topic.alarm")
}

test_get_resources_by_types_submodule_variable {
	tfplan := test_data.tfplan_test_get_resources_by_types_submodule_variable
	expected_results := [{
		"address": "module.s3_notification_sns.aws_sns_topic.alarm",
		"mode": "managed",
		"type": "aws_sns_topic",
		"name": "alarm",
		"provider_name": "aws",
		"schema_version": 0,
		"values": {"kms_master_key_id": "alias/sns-key"},
	}]

	expected_results == get_resources_by_types_submodule(tfplan, ["aws_sns_topic"])
}

# ---------------------------------------------------------------------------------------------------------------------
# get_planned_values
# ---------------------------------------------------------------------------------------------------------------------

test_get_planned_values {
	tfplan := test_data.tfplan_test_get_planned_values
	expected_result := {
		"read_capacity": 20,
		"server_side_encryption": [{"enabled": false}],
	}

	expected_result == get_planned_values(tfplan, "aws_dynamodb_table.example")

	expected_result_2 := {
		"index": 0,
		"read_capacity": 30,
		"server_side_encryption": [{"enabled": true}],
	}

	expected_result_2 == get_planned_values(tfplan, "aws_dynamodb_table.example_2")
}

test_get_planned_values_submodule {
	tfplan := test_data.tfplan_test_get_planned_values_submodule
	expected_result := {
		"address": "module.sns-topic.aws_sns_topic.alarm[0]",
		"mode": "managed",
		"type": "aws_sns_topic",
		"name": "alarm",
		"index": 0,
		"provider_name": "aws.us-west-2",
		"schema_version": 0,
		"values": {"kms_master_key_id": null},
	}

	expected_result == get_planned_values_submodule(tfplan, "aws_sns_topic.alarm")

	expected_result_2 := {
		"address": "module.sns-topic.aws_sns_topic.sns-alarm",
		"mode": "managed",
		"type": "aws_sns_topic",
		"name": "sns-alarm",
		"provider_name": "aws",
		"schema_version": 0,
		"values": {"kms_master_key_id": null},
	}

	expected_result_2 == get_planned_values_submodule(tfplan, "aws_sns_topic.sns-alarm")
}
