resource "azurerm_resource_group" "rg_appservice_linux_demo" {
  name     = "rg-appservice-linux-demo"
  location = "Eastus2"
}

resource "azurerm_app_service_plan" "asp_linux_demo" {
  name                = "asp-linux-demo"
  location            = azurerm_resource_group.rg_appservice_linux_demo.location
  resource_group_name = azurerm_resource_group.rg_appservice_linux_demo.name
  reserved            = true
  kind                = "linux"

  sku {
    tier     = "Basic"
    size     = "B1"
    capacity = 1
  }
}

resource "azurerm_app_service" "as_linux_demo" {
  name                = "as-linux-demo-01"
  location            = azurerm_resource_group.rg_appservice_linux_demo.location
  resource_group_name = azurerm_resource_group.rg_appservice_linux_demo.name
  app_service_plan_id = azurerm_app_service_plan.asp_linux_demo.id

  site_config {
    linux_fx_version          = "DOCKER|appsvcsample/python-helloworld:latest"
    always_on                 = true
    ftps_state                = "Disabled"
    use_32_bit_worker_process = false
  }
}



# resource "azurerm_linux_web_app" "as_linux_demo_new" {
#   name                = "as-linux-demo-01"
#   location            = azurerm_resource_group.rg_appservice_linux_demo.location
#   resource_group_name = azurerm_resource_group.rg_appservice_linux_demo.name
#   service_plan_id     = azurerm_app_service_plan.asp_linux_demo.id

#   site_config {
#     always_on         = true
#     use_32_bit_worker = false
#     ftps_state        = "Disabled"

#     application_stack {
#       docker_image     = "appsvcsample/python-helloworld"
#       docker_image_tag = "latest"
#     }
#   }
# }

