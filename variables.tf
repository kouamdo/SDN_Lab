variable "ami_id" {
  type = string
  default = "ami-0bbea4fbb4c62691a"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "av-1" {
  type = string
  default = "us-east-1a"
}

variable "av-2" {
  type = string
  default = "us-east-1b"
}

variable "subnet_pub" {
  type = string
  default = "10.2.7.0/24"
}

variable "subnet_k8s_1" {
  type = string
  default = "10.2.6.0/24"
}

variable "subnet_dp_2" {
  type = string
  default = "10.2.5.0/24"
}

variable "subnet_dp_1" {
  type = string
  default = "10.2.4.0/24"
}
variable "subnet_sig_2" {
  type = string
  default = "10.2.3.0/24"
}
variable "subnet_sig_1" {
  type = string
  default = "10.2.2.0/24"
}

variable "priv_subnet_list" {
  type = set(string)
  default = [
    "10.2.2.0/24",
    "10.2.3.0/24",
    "10.2.4.0/24",
    "10.2.5.0/24",
    "10.2.6.0/24"
  ]
}
