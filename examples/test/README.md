# test

This example is used in the GitHub Actions workflow to test this module.

## Local Run

To run this example locally, execute the following commands:

```sh
export TF_CLOUD_ORGANIZATION="<Your Terraform Cloud organization>"
export TF_WORKSPACE="<Your Terraform Cloud workspace>"
terraform init
terraform apply -target module.bookstack_app_service.azurerm_linux_web_app.main
terraform apply
terraform taint module.bookstack_app_service.random_id.restart
terraform apply
```

Access application from a web browser. You can get your application's URL using this command:

```sh
echo "https://$(tf output -json linux_web_app | jq -r '.default_hostname')"
```
