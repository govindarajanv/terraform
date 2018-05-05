module "foo" {
  source = "../my_dr_environment"
  instance_name = "foo"
}
module "bar" {
  source = "../my_dr_environment"
  instance_name = "bar"
}
