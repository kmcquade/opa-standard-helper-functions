package helpers.common

# ---------------------------------------------------------------------------------------------------------------------
# list_contains_value
# Determines if a value is present in a list
# ---------------------------------------------------------------------------------------------------------------------

sample_list := [
  "marshall",
  "mathers",
  "haley",
  "kim",
]

test_list_contains_value_pass {
	list_contains_value(sample_list, "mathers")
}

test_list_contains_value_false {
	false == list_contains_value(sample_list, "biggie")
}

test_list_contains_value_not {
	not list_contains_value(sample_list, "biggie")
}

# ---------------------------------------------------------------------------------------------------------------------
# object_contains_keys
# Determines if an object contains a key
# ---------------------------------------------------------------------------------------------------------------------

sample_object_for_key_existence := {
  "luke": "skywalker",
  "obiwan": "kenobi"
}

# Pass example
test_object_contains_key_pass {
  object_contains_key(sample_object_for_key_existence, "luke")
}

# False example
test_object_contains_key_false {
  object_contains_key(sample_object_for_key_existence, "kylo") == false
}

# Not example
test_object_contains_key_not {
  not object_contains_key(sample_object_for_key_existence, "kylo")
}

# ---------------------------------------------------------------------------------------------------------------------
# object_contains_key_pattern
# Determines any keys in an object match a regex expression
# ---------------------------------------------------------------------------------------------------------------------

sample_object_for_key_pattern_existence := {
  "logging.#": "1",
  "logging.2506127480.target_bucket": "somebucket",
  "logging.2506127480.target_prefix": "log/",
}

# Pass example
test_object_contains_key_pattern_pass {
		object_contains_key_pattern(sample_object_for_key_pattern_existence, "^logging.*target_bucket$")
}

# False example
test_object_contains_key_pattern_false {
		false == object_contains_key_pattern(sample_object_for_key_pattern_existence, "^logging.*youngmoney$")
}

# Not example
test_object_contains_key_pattern_not {
		not object_contains_key_pattern(sample_object_for_key_pattern_existence, "^logging.*youngmoney$")
}