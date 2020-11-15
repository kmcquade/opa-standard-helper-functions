package helpers.common

# ---------------------------------------------------------------------------------------------------------------------
# list_contains_value
# Determines if a value is present in a list
# ---------------------------------------------------------------------------------------------------------------------

list_contains_value(list, item) {
	list_item = list[_]
	list_item == item
}

else = false {
	not list[item]
	not list[item] == false
}

# ---------------------------------------------------------------------------------------------------------------------
# object_contains_key
# Determines if an object contains a key
# ---------------------------------------------------------------------------------------------------------------------

object_contains_key(object, item) {
	_ = object[key]
	key = item
}

else = false {
	not object[item]
	not object[item] == false
}

# ---------------------------------------------------------------------------------------------------------------------
# object_contains_key_pattern
# Determines any keys in an object match a regex expression
# ---------------------------------------------------------------------------------------------------------------------

object_contains_key_pattern(object, pattern) = key {
	_ = object[a_key]
	key := re_match(pattern, a_key)
}

else = false {
	_ = object[a_key]
	false == re_match(pattern, a_key)
}
