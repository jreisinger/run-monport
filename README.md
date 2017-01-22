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

Destroy the VM

    terraform destroy