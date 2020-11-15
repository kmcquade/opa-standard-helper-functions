package old.terraform

#get_resources_by_type(resource_type) = res {
#	res := [name |
#		tfplan[name] = _
#		tfplan[name].resourceType == resource_type
#	]
#}

#get_resources_by_types_tf11(tfplan, types) = [resource |
#	resource = tfplan[_] # iterate over resources in tfplan
#	type = types[_] # iterate over types
#	resource.resourceType == type # include resource into return list if the type matches
#]