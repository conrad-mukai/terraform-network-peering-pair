/*
 * network-peering-pair test
 */

provider "aws" {
  region = "${var.region}"
}

module "peering" {
  source = "../.."
  requester_vpc_id = "${var.requester_vpc_id}"
  accepter_vpc_id = "${var.accepter_vpc_id}"
  requester_public_route_table_id = "${var.requester_public_route_table_id}"
  accepter_public_route_table_id = "${var.accepter_public_route_table_id}"
  requester_private_route_table_ids = "${var.requester_private_route_table_ids}"
  accepter_private_route_table_ids = "${var.accepter_private_route_table_ids}"
  requester_internal_security_group_id = "${var.requester_internal_security_group_id}"
  accepter_internal_security_group_id = "${var.accepter_internal_security_group_id}"
}