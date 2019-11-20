package network

# ---------------------------------------------------------------------------------------------------------------------
# are_ips_public
# Determines whether any IP addresses fall outside of RFC1918 (private CIDR ranges)
#   To calculate the non-private IPs, use this:
#   https://serverfault.com/questions/304781/cidr-ranges-for-everything-except-rfc1918
# ---------------------------------------------------------------------------------------------------------------------

# Netmask commands to create list of non-private CIDR ranges. You can also do this for your corporate IPs
#   if you modify the provided ranges below
# netmask -c 0.0.0.0:9.255.255.255
# netmask -c 11.0.0.0:172.15.255.255
# netmask -c 172.32.0.0:192.167.255.255
# netmask -c 192.169.0.0:223.255.255.255

are_ips_public(ips_to_check) {
	some i
	single_ip := ips_to_check[i]
	true == cidr_set_intersects(non_private_ip_ranges, single_ip)
}

else = false {
	some i
	single_ip := ips_to_check[i]
	false == cidr_set_intersects(non_private_ip_ranges, single_ip)
}

### This contains the non-private CIDR ranges
non_private_ip_ranges = [
	"0.0.0.0/5",
	"8.0.0.0/7",
	"11.0.0.0/8",
	"12.0.0.0/6",
	"16.0.0.0/4",
	"32.0.0.0/3",
	"64.0.0.0/2",
	"128.0.0.0/3",
	"160.0.0.0/5",
	"168.0.0.0/6",
	"172.0.0.0/12",
	"172.32.0.0/11",
	"172.64.0.0/10",
	"172.128.0.0/9",
	"173.0.0.0/8",
	"174.0.0.0/7",
	"176.0.0.0/4",
	"192.0.0.0/9",
	"192.128.0.0/11",
	"192.160.0.0/13",
	"192.169.0.0/16",
	"192.170.0.0/15",
	"192.172.0.0/14",
	"192.176.0.0/12",
	"192.192.0.0/10",
	"193.0.0.0/8",
	"194.0.0.0/7",
	"196.0.0.0/6",
	"200.0.0.0/5",
	"208.0.0.0/4",
]

cidr_set_intersects(set, x) {
	net.cidr_intersects(set[_], x)
}

else = false {
  false == net.cidr_intersects(set[_], x)
}