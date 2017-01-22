Create the credentials file

    mkdir $HOME/.aws
    touch $HOME/.aws/credentials
    chmod 600 $HOME/.aws/credentials

    cat > $HOME/.aws/credentials1 <<EOF
    [default]
    aws_access_key_id = "AWS_ACCESS_KEY_ID"
    aws_secret_access_key = "AWS_ACCESS_KEY"
    EOF

Create the VM and deploy App::Monport

    terraform apply

Run monport

    ssh -i ~/Downloads/terraform.pem ubuntu@IP_ADDRESS 'monport -v'

Destroy the VM

    terraform destroy

TO DO

- [x] run monport
- [ ] if diffs let me know
- [ ] destroy the VM when done
- [ ] if errors let me know
- [ ] make all unattended
