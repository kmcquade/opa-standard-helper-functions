package helpers.terraform.terraform_test_data

tfplan_test_get_resources_by_types_submodule := {
		"format_version": "0.1",
		"terraform_version": "0.12.9",
		"planned_values": {"root_module": {"child_modules": [{
			"resources": [
				{
					"address": "module.scm-sns-topic.aws_sns_topic.alarm[0]",
					"mode": "managed",
					"type": "aws_sns_topic",
					"name": "alarm",
					"index": 0,
					"provider_name": "aws.us-west-2",
					"schema_version": 0,
					"values": {"kms_master_key_id": null},
				},
				{
					"address": "module.scm-sns-topic.aws_sns_topic.sns-alarm",
					"mode": "managed",
					"type": "aws_sns_topic",
					"name": "sns-alarm",
					"provider_name": "aws",
					"schema_version": 0,
					"values": {"kms_master_key_id": null},
				},
			],
			"address": "module.scm-sns-topic",
		}]}},
		"configuration": {"root_module": {"module_calls": {"scm-sns-topic": {"module": {"resources": [
			{
				"address": "aws_sns_topic.alarm",
				"mode": "managed",
				"type": "aws_sns_topic",
				"name": "alarm",
				"provider_config_key": "scm-sns-topic:aws.us-west-2",
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
				"provider_config_key": "scm-sns-topic:aws",
				"expressions": {
					"delivery_policy": {"constant_value": "{\n  \"http\": {\n    \"defaultHealthyRetryPolicy\": {\n      \"minDelayTarget\": 20,\n      \"maxDelayTarget\": 20,\n      \"numRetries\": 3,\n      \"numMaxDelayRetries\": 0,\n      \"numNoDelayRetries\": 0,\n      \"numMinDelayRetries\": 0,\n      \"backoffFunction\": \"linear\"\n    },\n    \"disableSubscriptionOverrides\": false,\n    \"defaultThrottlePolicy\": {\n      \"maxReceivesPerSecond\": 1\n    }\n  }\n}\n"},
					"name": {"references": ["var.topic_name"]},
				},
			},
		]}}}}},
	}


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