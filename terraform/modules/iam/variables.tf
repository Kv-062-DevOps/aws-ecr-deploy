#-----------------------------------------------------------
# Global or/and default variables
#-----------------------------------------------------------
variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "KIAM"
}

variable "region" {
  description = "The region where to deploy this code (e.g. eu-central-1)."
  default     = "eu-central-1"
}

#variable "provider" {
#    type = "map"
#    default = {
#        access_key = "unknown"
#        secret_key = "unknown"
#        region     = "eu-central-1"
#    }
#}

variable "environment" {
  description = "environment for service"
  default     = "STAGE"
}

variable "aws_iam_role-principals" {
  description = "List of allowed principals."
  type        = list(string)
}

variable "aws_iam_policy-resources" {
  description = "List of allowed resources."
  type        = list(string)
  default     = ["*"]
}

variable "aws_iam_policy-actions" {
  description = "List of allowed actions."
  type        = list(string)
  default     = ["*"]
}

variable "enable_crossaccount_role" {
  description = "Enabling cross account role"
  default     = "false"
}

variable "cross_acc_principal_arns" {
  description = "ARNs of accounts, groups, or users with the ability to assume this role."
  type        = list(string)
  default     = ["893769753495", "arn:aws:iam::893769753495:role/kiam_server"]
# default     = ["222222222222", "arn:aws:iam::333333333333:user/MyUser"]
}

variable "cross_acc_policy_arns" {
  description = "List of ARNs of policies to be associated with the created IAM role"
  type        = list(string)
  default     = ["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser", "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]
# default     = ["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser", "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]
}

