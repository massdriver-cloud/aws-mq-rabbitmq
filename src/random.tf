resource "random_password" "main" {
  length           = 16
  lower            = true
  number           = true
  special          = true
  upper            = true
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
  override_special = "!@#$%&*()-_+[]{}<>?"
}
