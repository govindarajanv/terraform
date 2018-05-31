-	Install Terraform and docker
-	Use terraform init on your new terraform directory
	-	this downloads all dependencies in .terraform directory under the work directory
-	terrafrom show will show the terraform resource which can be referred for performing interpolation
-	terraform plan will do mock run
-	terraform apply will perform actual run
-	terraform destroy will destroy the created resources
-	terraform taint docker_container.container_id will make the resource as tainted
-	terraform untaint docker_container.container_id will make the resource as tainted
-	terraform console
	>docker_container.container_id.name
	blog
-	when using environments export TF_VAR_env=prod
	terraform console
	>lookup(var.ext_port,var.env)
	80
-	you cannot deploy two different environments at the same time or immediately one after another as tfstate is a single file and gets overwritten by the following terraform apply. So you should use workspaces
-	The following command creates new workspaces
	terraform workspace new dev
	terraform workspace new prod
-	The following command switches to new workspaces
	terraform workspace select dev
	terraform workspace select prod
	terraform workspace select default

