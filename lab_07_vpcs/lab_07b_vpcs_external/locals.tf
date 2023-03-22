# locals {
#     az_public = zipmap(local.azs, var.public_subnets)
#     az_private = zipmap(local.azs, var.private_subnets)
#     az_database = zipmap(local.azs, var.database_subnets)
# }

locals {
  az_name = data.aws_availability_zones.available.names
  az_id   = data.aws_availability_zones.available.zone_ids

  name_suffix = "${var.project}-${var.environment}-${var.lab_number}"

  public_subnet_ids = data.aws_subnets.public_subnets.ids
}