package helpers.terraform.test_data
# This package contains test data. We separate it out to make the unit test files cleaner.

# ---------------------------------------------------------------------------------------------------------------------
# get_resources_by_types
# ---------------------------------------------------------------------------------------------------------------------

# test_get_resources_by_types_submodule
tfplan_test_get_resources_by_types_submodule := {
		"format_version": "0.1",
		"terraform_version": "0.12.9",
		"planned_values": {"root_module": {"child_modules": [{
			"resources": [
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
			],
			"address": "module.sns-topic",
		}]}},
		"configuration": {"root_module": {"module_calls": {"sns-topic": {"module": {"resources": [
			{
				"address": "aws_sns_topic.alarm",
				"mode": "managed",
				"type": "aws_sns_topic",
				"name": "alarm",
				"provider_config_key": "sns-topic:aws.us-west-2",
				"expressions": {
					"delivery_policy": {"constant_value": "{\n  \"http\": {\n    \"defaultHealthyRetryPolicy\": {\n      \"minDelayTarget\": 20,\n      \"maxDelayTarget\": 20,\n      \"numRetries\": 3,\n      \"numMaxDelayRetries\": 0,\n      \"numNoDelayRetries\": 0,\n      \"numMinDelayRetries\": 0,\n      \"backoffFunction\": \"linear\"\n    },\n    \"disableSubscriptionOverrides\": false,\n    \"defaultThrottlePolicy\": {\n      \"maxReceivesPerSecond\": 1\n    }\n  }\n}\n"},
					"name": {"constant_value": "scm-alarms-topic1"},
				},
			},
			{
				"address": "aws_sns_topic.sns-alarm",
				"mode": "managed",
				"type": "aws_sns_topic",
				"name": "sns-alarm",
				"provider_config_key": "sns-topic:aws",
				"expressions": {
					"delivery_policy": {"constant_value": "{\n  \"http\": {\n    \"defaultHealthyRetryPolicy\": {\n      \"minDelayTarget\": 20,\n      \"maxDelayTarget\": 20,\n      \"numRetries\": 3,\n      \"numMaxDelayRetries\": 0,\n      \"numNoDelayRetries\": 0,\n      \"numMinDelayRetries\": 0,\n      \"backoffFunction\": \"linear\"\n    },\n    \"disableSubscriptionOverrides\": false,\n    \"defaultThrottlePolicy\": {\n      \"maxReceivesPerSecond\": 1\n    }\n  }\n}\n"},
					"name": {"references": ["var.topic_name"]},
				},
			},
		]}}}}},
	}

# test_get_planned_values_submodule_variable
tfplan_test_get_planned_values_submodule_variable := {
		"planned_values": {"root_module": {"child_modules": [{
			"resources": [{
				"address": "module.s3_notification_sns.aws_sns_topic.alarm",
				"mode": "managed",
				"type": "aws_sns_topic",
				"name": "alarm",
				"provider_name": "aws",
				"schema_version": 0,
				"values": {"kms_master_key_id": "alias/sns-key"},
			}],
			"address": "module.s3_notification_sns",
		}]}},
		"terraform_version": "0.12.9",
	}

tfplan_test_get_resources_by_types_submodule_variable := {
		"planned_values": {"root_module": {"child_modules": [{
			"resources": [{
				"address": "module.s3_notification_sns.aws_sns_topic.alarm",
				"mode": "managed",
				"type": "aws_sns_topic",
				"name": "alarm",
				"provider_name": "aws",
				"schema_version": 0,
				"values": {"kms_master_key_id": "alias/sns-key"},
			}],
			"address": "module.s3_notification_sns",
		}]}},
		"terraform_version": "0.12.9",
		"configuration": {"root_module": {"module_calls": {"s3_notification_sns": {
			"source": "../modules/sns-topic",
			"module": {
				"outputs": {"arn": {"expression": {"references": ["aws_sns_topic.alarm"]}}},
				"resources": [{
					"address": "aws_sns_topic.alarm",
					"mode": "managed",
					"type": "aws_sns_topic",
					"name": "alarm",
					"provider_config_key": "s3_notification_sns:aws",
					"expressions": {
						"kms_master_key_id": {"references": ["var.kms_master_key_id"]},
						"name": {"references": ["var.name"]},
					},
					"schema_version": 0,
				}],
				"variables": {
					"kms_master_key_id": {
						"default": "",
						"description": "KMS Key ID",
					},
					"name": {"description": "Name of the sns topic"},
				},
			},
		}}}},
	}

# ---------------------------------------------------------------------------------------------------------------------
# get_planned_values
# ---------------------------------------------------------------------------------------------------------------------

tfplan_test_get_planned_values := {
		"planned_values": {"root_module": {"resources": [
			{
				"address": "aws_dynamodb_table.example",
				"values": {
					"read_capacity": 20,
					"server_side_encryption": [{"enabled": false}],
				},
			},
			{
				"address": "aws_dynamodb_table.example_2[0]",
				"values": {
					"index": 0,
					"read_capacity": 30,
					"server_side_encryption": [{"enabled": true}],
				},
			},
			{
				"address": "aws_dynamodb_table.example_2[1]",
				"values": {
					"index": 1,
					"read_capacity": 30,
					"server_side_encryption": [{"enabled": true}],
				},
			},
		]}},
		"terraform_version": "0.12.9",
	}

tfplan_test_get_planned_values_submodule := {
		"planned_values": {"root_module": {"child_modules": [{
			"resources": [
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
			],
			"address": "module.sns-topic",
		}]}},
		"terraform_version": "0.12.9",
	}