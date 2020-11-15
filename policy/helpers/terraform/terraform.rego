package helpers.terraform

import input as tfplan

# ---------------------------------------------------------------------------------------------------------------------
# get_resources_by_type
# Functions to get resources by specifying their type (like aws_s3_bucket)
# ---------------------------------------------------------------------------------------------------------------------

# get_resources_by_types_combined
get_resources_by_types_combined(tfplan, types) = [ resource |
    resource = get_resources_by_types(tfplan, types)
    resource = get_resources_by_types_submodule(tfplan, types)
]

# Get a resource object from a resource in a Terraform plan
# Terraform plan path: configuration.root_module.resources
get_resources_by_types(tfplan, types) = [resource |
	resource = tfplan.configuration.root_module.resources[_] # iterate over resources in tfplan config root module
	type = types[_] # iterate over types
	resource.type == type # include resource into return list if the type matches
	not startswith(resource.address, "data.") # exclude data resources, i.e. pre-existing resources
	get_planned_values(tfplan, resource.address) # exclude resources which are not in planned_values section
]

# Get a resource object from a submodule in a Terraform plan
# Terraform plan path: configuration.root_module.${module_call}.module.resources
get_resources_by_types_submodule(tfplan, types) = [resource |
	module_calls := tfplan.configuration.root_module.module_calls
	module_call = module_calls[_]
	config_resources := module_call.module.resources
	config_resource = config_resources[_]
	type = types[_] # iterate over types
	config_resource.type == type # include resource into return list if the type matches
	not startswith(config_resource.address, "data.") # exclude data resources, i.e. pre-existing resources
	resource = get_planned_values_submodule(tfplan, config_resource.address)
]

# ---------------------------------------------------------------------------------------------------------------------
# get_planned_values
# Functions to get the planned values from Terraform plan
# ---------------------------------------------------------------------------------------------------------------------

# Get planned values from the root module
# Terraform plan path: planned_values.root_module_resources
get_planned_values(tfplan, address) = values {
	resources := [resource |
		resources := tfplan.planned_values.root_module.resources
		resource := resources[_]
		startswith(resource.address, address) # startswith allows finding resource with index
	]

	count(resources) > 0
	values := resources[0].values # get the values from the 1st found match
}

# Get Planned values from a submodule
# Terraform plan path: planned_values.root_module.child_modules
get_planned_values_submodule(tfplan, address) = values {
	resources := [resource |
		modules := tfplan.planned_values.root_module.child_modules
		module := modules[_]
		resources = module.resources
		resource := resources[_]
		startswith(resource.address, "module") # startswith allows finding resource with index
		contains(resource.address, address) # startswith allows finding resource with index
	]

	count(resources) > 0
	values := resources[0] # get the values from the 1st found match
}
