# terraform-confluent-platform
Terraform Scripts for Deploying the Confluent Platform within Cloud Providers

**NOTE:** These scripts currently use the PS Bootcamp infrastructure already setup in advance. 

## AWS Module

### Pre-Reqs

1. AWS access to the PS infrastructure
2. Your KeyPair added to AWS 
3. IAM account create with AccessKey and SecuritySecret. 
   Along with it being added to the _bootcamp-terraform_ Group.
   See [Terraform AWS Provider](https://www.terraform.io/docs/providers/aws/index.html) docs for how to use this account.

### Required and Key Variables

| Var             | Required | Default             | Desc                                                                   |
| --------------- |:--------:|:-------------------:| ---------------------------------------------------------------------- |
| first_name      | Yes      |                     | Your first name, all in lower case, and with no special chars          |
| key_pair        | Yes      |                     | Your KeyPair that you will need to upload separately                   |
| cluster_id      | No       | Empty               | An optional cluster identifier for use when running multiple clusters  |
| security_groups | No       | Empty               | Additional Security Groups within the PS Bootcamp VPC                  |
| image_id        | No       | Ubuntu 18.04 x86-64 | AMI ID to use with all instances                                       |