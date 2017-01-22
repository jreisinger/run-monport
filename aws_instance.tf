# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "monport"

provider "aws" {
	# access_key and secret key in $HOME/.aws/credentials
    region = "eu-central-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "monport" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
	key_name = "terraform"
    tags {
        Name = "monport"
    }

	provisioner "local-exec" {
		command = "sleep 30 && /bin/echo -n \"[monport]\n${aws_instance.monport.public_ip} ansible_connection=ssh ansible_ssh_user=ubuntu\" > inventory && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory monport-playbook.yml --key-file=~/Downloads/terraform.pem" 
	}
}
