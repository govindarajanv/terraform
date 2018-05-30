variable "container_name" {
  description = "Name of container"
  default = "blog"
}
variable "int_port" {
  description = "internal port for container"
  default = "2368"
}
variable "ext_port" {
  description = "external port for container"
  default = "8128"
}
variable "image" {}
