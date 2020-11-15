package network.overbroad_network_cidrs

import data.network.overbroad_network_cidrs.test_data
import input as tfplan

test_overbroad_network_cidrs_pass {
	authz with tfplan as test_data.tfplan_test_overbroad_network_cidrs_pass
}

test_overbroad_network_cidrs_fail {
	not authz with tfplan as test_data.tfplan_test_overbroad_network_cidrs_fail
}
