package helpers.terraform

import data.helpers.terraform.test_data

test_get_resources_by_types_combined {
	tfplan := test_data.tfplan_test_get_resources_by_types_combined
	expected_result := [
		{
			"address": "aws_s3_bucket.b",
			"expressions": {
				"acl": {"constant_value": "private"},
				"bucket": {"constant_value": "my-tf-test-bucket"},
			},
			"mode": "managed",
			"name": "b",
			"provider_config_key": "aws",
			"schema_version": 0,
			"type": "aws_s3_bucket",
		},
		{
			"address": "module.s3_bucket.aws_s3_bucket.this[0]",
			"index": 0,
			"mode": "managed",
			"name": "this",
			"provider_name": "aws",
			"schema_version": 0,
			"type": "aws_s3_bucket",
			"values": {
				"acl": "private",
				"bucket": "woaidjfidjafa-s3-bucket",
				"bucket_prefix": null,
				"cors_rule": [],
				"force_destroy": false,
				"grant": [],
				"lifecycle_rule": [],
				"logging": [],
				"object_lock_configuration": [],
				"policy": null,
				"replication_configuration": [],
				"server_side_encryption_configuration": [],
				"tags": null,
				"website": [],
			},
		},
	]

	result := get_resources_by_types_combined(tfplan, ["aws_s3_bucket"])

	#	result == expected_result
	sprintf("%s", result)
}

#	sprintf("%s", get_resources_by_types_combined(tfplan, ["aws_sns_topic"]))
# ---------------------------------------------------------------------------------------------------------------------
# get_resources_by_types
# ---------------------------------------------------------------------------------------------------------------------
#
#test_get_resources_by_types_submodule {
#	tfplan := test_data.tfplan_test_get_resources_by_types_submodule
#	expected_result := [
#		{
#			"address": "module.sns-topic.aws_sns_topic.alarm[0]",
#			"mode": "managed",
#			"type": "aws_sns_topic",
#			"name": "alarm",
#			"index": 0,
#			"provider_name": "aws.us-west-2",
#			"schema_version": 0,
#			"values": {"kms_master_key_id": null},
#		},
#		{
#			"address": "module.sns-topic.aws_sns_topic.sns-alarm",
#			"mode": "managed",
#			"type": "aws_sns_topic",
#			"name": "sns-alarm",
#			"provider_name": "aws",
#			"schema_version": 0,
#			"values": {"kms_master_key_id": null},
#		},
#	]
#
#	expected_result == get_resources_by_types_submodule(tfplan, ["aws_sns_topic"])
#}
#
#test_get_planned_values_submodule_variable {
#	tfplan := test_data.tfplan_test_get_planned_values_submodule_variable
#	expected_result := {
#		"address": "module.s3_notification_sns.aws_sns_topic.alarm",
#		"mode": "managed",
#		"type": "aws_sns_topic",
#		"name": "alarm",
#		"provider_name": "aws",
#		"schema_version": 0,
#		"values": {"kms_master_key_id": "alias/sns-key"},
#	}
#
#	expected_result == get_planned_values_submodule(tfplan, "aws_sns_topic.alarm")
#}
#
#test_get_resources_by_types_submodule_variable {
#	tfplan := test_data.tfplan_test_get_resources_by_types_submodule_variable
#	expected_results := [{
#		"address": "module.s3_notification_sns.aws_sns_topic.alarm",
#		"mode": "managed",
#		"type": "aws_sns_topic",
#		"name": "alarm",
#		"provider_name": "aws",
#		"schema_version": 0,
#		"values": {"kms_master_key_id": "alias/sns-key"},
#	}]
#
#	expected_results == get_resources_by_types_submodule(tfplan, ["aws_sns_topic"])
#}
#
## ---------------------------------------------------------------------------------------------------------------------
## get_planned_values
## ---------------------------------------------------------------------------------------------------------------------
#
#test_get_planned_values {
#	tfplan := test_data.tfplan_test_get_planned_values
#	expected_result := {
#		"read_capacity": 20,
#		"server_side_encryption": [{"enabled": false}],
#	}
#
#	expected_result == get_planned_values(tfplan, "aws_dynamodb_table.example")
#
#	expected_result_2 := {
#		"index": 0,
#		"read_capacity": 30,
#		"server_side_encryption": [{"enabled": true}],
#	}
#
#	expected_result_2 == get_planned_values(tfplan, "aws_dynamodb_table.example_2")
#}
#
#test_get_planned_values_submodule {
#	tfplan := test_data.tfplan_test_get_planned_values_submodule
#	expected_result := {
#		"address": "module.sns-topic.aws_sns_topic.alarm[0]",
#		"mode": "managed",
#		"type": "aws_sns_topic",
#		"name": "alarm",
#		"index": 0,
#		"provider_name": "aws.us-west-2",
#		"schema_version": 0,
#		"values": {"kms_master_key_id": null},
#	}
#
#	expected_result == get_planned_values_submodule(tfplan, "aws_sns_topic.alarm")
#
#	expected_result_2 := {
#		"address": "module.sns-topic.aws_sns_topic.sns-alarm",
#		"mode": "managed",
#		"type": "aws_sns_topic",
#		"name": "sns-alarm",
#		"provider_name": "aws",
#		"schema_version": 0,
#		"values": {"kms_master_key_id": null},
#	}
#
#	expected_result_2 == get_planned_values_submodule(tfplan, "aws_sns_topic.sns-alarm")
#}
