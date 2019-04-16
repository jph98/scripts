# Terraform

https://github.com/brikis98/terraform-up-and-running-code/tree/master/code

## Concepts

### State

State - info recorded for the current world
* Shared storage state files
* Locking state files
* Isolating state files

Remote state should be used instead of version control
* S3, Hashicorp Atlas/Consul
* specify bucket, versioning, prevent_destroy

Locking state:
* Terra Grunt utilises 

tfstate file per environment

terraform_remote_state
* Can use to retrieve read only info from AWS based on state
* Use output variables
* data.terraform_remote_state.db.address

### Folder Structure 

staging and production
* services and data-store
* main.tf in each that reuses a module

### Templates
Interpolation function:
* ${file("./thing.txt")} 

Template file:
* Replace placeholders with variables

### Output Variables 

Output variables:

```
output "asg_name" {
 value = "${aws_autoscaling_group.example.name}"
}
```

### Modules

Module - set of templates in a folder
* file paths are relative, use ${path.module} to great effect
* inline blocks - as part of resources etc... encapsulation

```
module "name" {
    source: "where_the_module_can_be_found"
}
```

n.b. You can specify versions in modules:

```
source = "git::git@github.com:foo/modules.git//webserver-cluster?ref=v0.0.1"
```

Example Module:

https://github.com/brikis98/terraform-up-and-running-code/tree/master/code/terraform/04-terraform-module

### Variables

Variables: store in vars.tf

### Loops, If,

Loop with:

```
resource "aws_iam_user" "example" {
 count = 3
 name = "neo.${count.index}"
}
```

Once you've used count it becomes a list of resources which you then need to refer to with the splat syntax:

```
value = ["${aws_iam_user.example.*.arn}"]
```

Array loop with:

```
resource "aws_iam_user" "example" {
 count = "${length(var.user_names)}"
 name = "${element(var.user_names, count.index)}"
}
```

If (really really weird) by setting a count variable to true (converted to 1):

```
resource "aws_autoscaling_schedule" "scale_in_at_night" {
 count = "${var.enable_autoscaling}"
}
```

if-else with:

```
resource "aws_iam_user_policy_attachment" "neo_cloudwatch_read_only" {
 count = "${1 - var.give_neo_cloudwatch_full_access}"
}
```

### Zero Downtime

We can create zero downtime by creating a new resource before tearing down the old one, e.g:

```
lifecycle { create_before_destroy } 
```

n.b. 
* Must be applied to all dependent resources
* Doesn't work with autoscaling policies

## Terraform Commands

```
terraform plan
```

```
terraform init
```

```
terraform apply
```
