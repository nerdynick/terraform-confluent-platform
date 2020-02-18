variable "first_name" {
    type = string
    description = "Your first name. NOTE: No special characters and all in lowercase."
}
variable "cluster_id" {
    type = string
    default = ""
    description = "If you're wishing to have multiple clusters running at a single time. You can define a unique string here. NOTE: No special chars and all in lowercase."
}
variable "image_id" {
    type = string
    #Ubuntu 18.04 LTS x64
    default = "ami-06d51e91cea0dac8d"
}
variable "key_pair" {
    type = string
    description = "Your KeyPair Name that you have already added to AWS"  
}
variable "security_groups" {
    type = list
    default = []
}
variable "default_security_groups" {
    default = ["bootcamp-cp-clients"]
}

###########################
# Derived Vars
###########################
data "template_file" "cluster_dns_postfix" {
    template = "${lower(join(".", compact([var.cluster_id, var.first_name, "aws"])))}"
}
data "template_file" "cluster_name_prefix" {
    template = "${lower(join("-", compact([var.first_name, var.cluster_id])))}"
}

###########################
# Splunk Vars
###########################
variable "splunk_servers" {
    type = number
    default = 0
}
variable "splunk_instance_type" {
    type = string
    default = "t3.medium"
}
variable "splunk_root_volume_size" {
    type = number
    default = 60
}