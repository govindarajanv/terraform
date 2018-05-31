# Download the latest Ghost Image
module "image" {
  source = "./image"
  image = "${lookup(var.image,var.env)}"
}
# Start the Container
# image_out is output variable from image module

module "container" {
  source = "./container"
  image = "${module.image.image_out}"
  name = "${lookup(var.container_name,var.env)}"
  int_port = "${var.int_port}"
  ext_port = "${lookup(var.ext_port,var.env)}"
}
