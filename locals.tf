locals {
  parameter_group_name = (
    var.parameter_group_name != null ? var.parameter_group_name : (
      var.create_parameter_group
      ?
      local.safe_family # The name of the new parameter group to be created
      :
      "default.${var.family}" # Default parameter group name created by AWS
    )
  )
  # The name of the parameter group can’t include "."
  safe_family = replace(var.family, ".", "-")
  environment = try(var.tags.environment , var.tags.Environment, var.env, "" )
  namespace = try(var.tags.namespace , "" )
  sg_name =  local.namespace == "" ? "${local.environment}-var.name" : "${local.namespace}-${local.environment}-var.name"
}