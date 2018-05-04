-	Single line comments start with #
-	Multi-line comments are wrapped with /* and */
-	Strings can interpolate other values using syntax wrapped in ${}
-	Multiline strings can use shell-style "here doc" syntax, with the string starting with a marker like <<EOF and then the string ending with EOF on a line of its own. The lines of the string and the end marker must not be indented
-	Lists of primitive types can be made with square brackets ([]). Example: ["foo", "bar", "baz"].
-	Maps can be made with braces ({}) and colons (:): { "foo": "bar", "bar": "baz" }
-	segregate the files into providers, provisioners, access and variables etc
-	always run $terraform plan before $terraform apply
	-	+ means addition of new resources
	-	- means deletion of existing resources
	-	-/+ means deletion and recreation of those resources
-	focus on staying DRY (Dont repeat yourself), parameterize to stay DRY
-	define variables in variables.tf
-	specify output variables in outputs.tf file
-	better to have granular file structure so that you can rename a file with ".disabled" suffix so that it will not get picked up when you dont want a module to be created
-	Naming convention is RESOURCE NAME = RESOURCE TYPE - PROVIDER NAME 
	resource <RESOURCE TYPE> <PROVIDER NAME> {
	..
	..
	}
	Resource Type like 'aws_security_group'
	Provider Name like 'security_group'
-	Use underscore
	-	variable names
	-	resource names
	-	anything interpolated using ${}
-	Use hyphen
	-	resource being created
-	Use terraform format to validate and correct your terraform files matching canonical format and style
	-		-list=true 	lists files whose formatting is different
	-		-write=true 	write the results to the source file
	-		-diff=false	displays the differences
-	segregate the modules into
	-	service
	-	infrastructure  (infrastructure does not change often)
-	Use backend config
-	manage variables and state dynamically
	provider
	|
	--root vpc module
	  |
	  --production root environment module
	  |
	  --bastion(root service module)
