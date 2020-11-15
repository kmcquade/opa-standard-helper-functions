package helpers.terraform.terraform_11

import input as tfplan

get_resources_by_type(resource_type) = res {
	res := [name |
		tfplan[name] = _
		tfplan[name].resourceType == resource_type
	]
}

get_resources_created(resource_type) = num {
	all := get_resources_by_type(resource_type)
	creates := [name | all[_] = name; tfplan[name].requiresNew == true]
	num := count(creates)
}
