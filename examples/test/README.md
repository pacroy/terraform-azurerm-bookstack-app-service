# test

This example is used in the GitHub Actions workflow to test this module.

## Local Run

To run this example locally, follow below instruction.

1. Execute the following commands in sequence:

```sh
export TF_CLOUD_ORGANIZATION="<Your Terraform Cloud organization>"
export TF_WORKSPACE="<Your Terraform Cloud workspace>"
terraform init
terraform apply -target module.bookstack_app_service.azurerm_linux_web_app.main
terraform apply
terraform taint module.bookstack_app_service.random_id.restart
terraform apply
```

2. Get your application's URL using this command:

```sh
echo "https://$(tf output -json linux_web_app | jq -r '.default_hostname')"
```

3. Access the URL via a web browser. Note: It may take a while until the application is up and running.

4. Log in using the default admin username `admin@admin.com` and password `password`. Note: If login is error, please wait and try again.
