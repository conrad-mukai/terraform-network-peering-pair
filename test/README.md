# Network Peering Pair Module Test

Test for the network peering pair module.

## Quick Start

To run the test do the following:
1. In the networks directory create a `terraform.tfvars` file from
   `terraform.tfvars.template`.
1. Fill in all the empty fields in `terraform.tfvars`. You should set
   `private_key_path` to the path for the private key that corresponds to the
   `key_name` parameter. Set `authorized_key_path` to a personal public key
   (something like `~/.ssh/id_rsa.pub`).
1. Run `terraform init`.
1. Run `terraform apply`.
1. The code will create 2 VPCs. Take note of the output.
1. Switch to the peering directory and create a `terraform.tfvars` file from
   `terraform.tfvars.template`.
1. Fill in all the empty fields in `terraform.tfvars` using the outputs from
   the networks run.
1. Run `terraform init`.
1. Run `terraform apply`.
1. The code will peer the two networks.
1. Finish the peering by manually associating the Route53 zones with their
   peered VPC.

## Details

The test determines a list of availability zones for the specified region, and
creates 2 lists. One with half the availabilty zones and the other with all
availability zones. For regions with an odd number of availability zones in
hafl list is rounded up (so for regions with 3 availability zones the list will
contain 2).

We then produce 2 network with the following parameters:

**Small Network**

| Variable | Value |
| -------- | ----- |
| `vpc_cidr` | 172.16.0.0/20 |
| `public_cidr_prefix` | 28 |
| `private_cidr_prefix` | 24 |

**Big Network**

| Variable | Value |
| -------- | ----- |
| `vpc_cidr` | 172.18.0.0/16 |
| `public_cidr_prefix` | 24 |
| `private_cidr_prefix` | -1 |

In the peering part of the test a peering connection is created and the routing
tables and security groups are modified to enable the peering.

## Verification

You can verify the connection by logging into one bastion by adding the private
key you use for bastion access to your ssh agent. For example if you use
`~/.ssh/id_rsa` then you would use the following command:

    ssh-add ~/.ssh/id_rsa

Now ssh to the public IP of one of the bastions in network1. For example, if
the public IP is 35.1.1.1, and the default user on the bastion is ec2-user, you
would enter:

    ssh -A ec2-user@35.1.1.1

Now ssh to a bastion in the other network. If you are in network1, then you
could enter the following:

    ssh network2-bastion01.big.example.com

This demonstrates name resolution and connectivity between the 2 VPCs.
