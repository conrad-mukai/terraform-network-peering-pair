/*
 * network-peering-pair test networks
 */

provider "aws" {
  region = "${var.region}"
}

data "aws_availability_zones" "current" {}

locals {
  az1 = "${slice(data.aws_availability_zones.current.names, 0, ceil(1.0*length(data.aws_availability_zones.current.names)/2))}"
  az1_count = "${length(local.az1)}"
  az2 = "${data.aws_availability_zones.current.names}"
  az2_count = "${length(local.az2)}"
}

resource "aws_eip" "network1-nat-eips" {
  count = "${local.az1_count}"
  vpc = true
}

resource "aws_eip" "network1-bastion-eips" {
  count = "${local.az2_count}"
  vpc = true
}

module "network1" {
  source = "github.com/conrad-mukai/terraform-network.git"
  name = "network1"
  vpc_cidr = "${var.requester_cidr}"
  public_cidr_prefix = 28
  private_cidr_prefix = 24
  availability_zones = "${local.az1}"
  ssh_access = "${var.cidr_access}"
  web_access = "${var.cidr_access}"
  dns_domain = "small.example.com"
  bastion_ami = "${var.ami}"
  bastion_user = "${var.user}"
  private_key_path = "${var.private_key_path}"
  authorized_keys_path = "${var.authorized_key_path}"
  key_name = "${var.key_name}"
  nat_eip_ids = "${aws_eip.network1-nat-eips.*.id}"
  bastion_eip_ids = "${aws_eip.network1-bastion-eips.*.id}"
}

resource "aws_eip" "network2-nat-eips" {
  count = "${local.az2_count}"
  vpc = true
}

resource "aws_eip" "network2-bastion-eips" {
  count = "${local.az2_count}"
  vpc = true
}

module "network2" {
  source = "github.com/conrad-mukai/terraform-network.git"
  name = "network2"
  vpc_cidr = "${var.accepter_cidr}"
  public_cidr_prefix = 24
  availability_zones = "${local.az2}"
  ssh_access = "${var.cidr_access}"
  web_access = "${var.cidr_access}"
  dns_domain = "big.example.com"
  bastion_ami = "${var.ami}"
  bastion_user = "${var.user}"
  private_key_path = "${var.private_key_path}"
  authorized_keys_path = "${var.authorized_key_path}"
  key_name = "${var.key_name}"
  nat_eip_ids = "${aws_eip.network2-nat-eips.*.id}"
  bastion_eip_ids = "${aws_eip.network2-bastion-eips.*.id}"
}
