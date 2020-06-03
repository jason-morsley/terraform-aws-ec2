# Terraform an EC2 instance in AWS

## Examples

For examples how to use, please refer to the examples folder.

## Usage

```
module "ec2" {

  source = "jason-morsley/ec2/aws"

  name = "example"

  tags = {
    Terraform = "true"
  }

}
```