/*
 * network-peering-pair test outputs
 */

output "vpc_peering_connection_id" {
  value = "${module.peering.vpc_peering_connection_id}"
}
