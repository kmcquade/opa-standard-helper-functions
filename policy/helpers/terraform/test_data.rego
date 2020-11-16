package helpers.terraform.test_data

# This package contains test data. We separate it out to make the unit test files cleaner.

# combined
tfplan_test_get_resources_by_types_combined := {
	"configuration": {"root_module": {
		"module_calls": {"s3_bucket": {
			"expressions": {
				"acl": {"constant_value": "private"},
				"bucket": {"constant_value": "woaidjfidjafa-s3-bucket"},
			},
			"module": {"resources": [{
				"address": "aws_s3_bucket.this",
				"count_expression": {"references": ["var.create_bucket"]},
				"expressions": {
					"acceleration_status": {"references": ["var.acceleration_status"]},
					"acl": {"references": ["var.acl"]},
					"bucket": {"references": ["var.bucket"]},
					"bucket_prefix": {"references": ["var.bucket_prefix"]},
					"force_destroy": {"references": ["var.force_destroy"]},
					"request_payer": {"references": ["var.request_payer"]},
					"tags": {"references": ["var.tags"]},
				},
				"mode": "managed",
				"name": "this",
				"provider_config_key": "s3_bucket:aws",
				"schema_version": 0,
				"type": "aws_s3_bucket",
			}]},
			"source": "terraform-aws-modules/s3-bucket/aws",
		}},
		"resources": [{
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
		}],
	}},
	"format_version": "0.1",
	"planned_values": {"root_module": {
		"child_modules": [{
			"address": "module.s3_bucket",
			"resources": [{
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
			}],
		}],
		"resources": [{
			"address": "aws_s3_bucket.b",
			"mode": "managed",
			"name": "b",
			"provider_name": "aws",
			"schema_version": 0,
			"type": "aws_s3_bucket",
			"values": {
				"acl": "private",
				"bucket": "my-tf-test-bucket",
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
		}],
	}},
	"resource_changes": [
		{
			"address": "aws_s3_bucket.b",
			"change": {
				"actions": ["create"],
				"after": {
					"acl": "private",
					"bucket": "my-tf-test-bucket",
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
				"after_unknown": {
					"acceleration_status": true,
					"arn": true,
					"bucket_domain_name": true,
					"bucket_regional_domain_name": true,
					"cors_rule": [],
					"grant": [],
					"hosted_zone_id": true,
					"id": true,
					"lifecycle_rule": [],
					"logging": [],
					"object_lock_configuration": [],
					"region": true,
					"replication_configuration": [],
					"request_payer": true,
					"server_side_encryption_configuration": [],
					"versioning": true,
					"website": [],
					"website_domain": true,
					"website_endpoint": true,
				},
				"before": null,
			},
			"mode": "managed",
			"name": "b",
			"provider_name": "aws",
			"type": "aws_s3_bucket",
		},
		{
			"address": "module.s3_bucket.aws_s3_bucket.this[0]",
			"change": {
				"actions": ["create"],
				"after": {
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
				"after_unknown": {
					"acceleration_status": true,
					"arn": true,
					"bucket_domain_name": true,
					"bucket_regional_domain_name": true,
					"cors_rule": [],
					"grant": [],
					"hosted_zone_id": true,
					"id": true,
					"lifecycle_rule": [],
					"logging": [],
					"object_lock_configuration": [],
					"region": true,
					"replication_configuration": [],
					"request_payer": true,
					"server_side_encryption_configuration": [],
					"versioning": true,
					"website": [],
					"website_domain": true,
					"website_endpoint": true,
				},
				"before": null,
			},
			"index": 0,
			"mode": "managed",
			"module_address": "module.s3_bucket",
			"name": "this",
			"provider_name": "aws",
			"type": "aws_s3_bucket",
		},
	],
	"terraform_version": "0.12.23",
}

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
