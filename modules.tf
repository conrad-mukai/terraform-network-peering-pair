/*
 * network-peering-pair modules
 */

data "aws_vpc" "requester" {
  id = "${var.requester_vpc_id}"
}

data "aws_vpc" "accepter" {
  id = "${var.accepter_vpc_id}"
}

module "requester" {
  source = "github.com/conrad-mukai/terraform-network-peering.git"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.connection.id}"
  peer_cidr = "${data.aws_vpc.accepter.cidr_block}"
  public_route_table_id = "${var.requester_public_route_table_id}"
  private_route_table_ids = "${var.requester_private_route_table_ids}"
  internal_security_group_id = "${var.requester_internal_security_group_id}"
}

module "accepter" {
  source = "github.com/conrad-mukai/terraform-network-peering.git"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.connection.id}"
  peer_cidr = "${data.aws_vpc.requester.cidr_block}"
  public_route_table_id = "${var.accepter_public_route_table_id}"
  private_route_table_ids = "${var.accepter_private_route_table_ids}"
  internal_security_group_id = "${var.accepter_internal_security_group_id}"
}
