/*
 * network-peering-pair outputs
 */

output "vpc_peering_connection_id" {
  value = "${aws_vpc_peering_connection.connection.id}"
}
