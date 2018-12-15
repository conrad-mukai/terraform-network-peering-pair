/*
 * network-peering-pair test networks outputs
 */

output "requester" {
  value = {
    public_route_table_id = "${module.network1.public_route_table_id}"
    private_route_table_ids = "${module.network1.private_route_table_ids}"
    internal_security_group_id = "${module.network1.internal_security_group_id}"
    bastion_ips = "${module.network1.bastion_ips}"
    route53_zone_id = "${module.network1.route53_zone_id}"
    vpc_id = "${module.network1.vpc_id}"
  }
}

output "accepter" {
  value = {
    public_route_table_id = "${module.network2.public_route_table_id}"
    private_route_table_ids = "${module.network2.private_route_table_ids}"
    internal_security_group_id = "${module.network2.internal_security_group_id}"
    bastion_ips = "${module.network2.bastion_ips}"
    route53_zone_id = "${module.network2.route53_zone_id}"
    vpc_id = "${module.network2.vpc_id}"
  }
}
