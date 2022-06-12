# Authenticate with Azure Subscription
az login

# Initialize Terraform
terraform init

# Apply the Terraform configuration if you haven't already
terraform apply

# Get the Resource ID of the existing App Service
terraform state show azurerm_app_service.as_linux_demo

# Remove the deprecated App Service from the current state
terraform state rm azurerm_app_service.as_linux_demo

# Remove or comment out azurerm_app_service.as_linux_demo from main.tf

# Add an empty azurerm_linux_web_app block to main.tf
# Save main.tf

# Import existing App into the new azurerm_linux_web_app resource
terraform import azurerm_linux_web_app.as_linux_demo_new <Resource_ID>

# Get the current state of the new resource
terraform state show azurerm_linux_web_app.as_linux_demo_new

