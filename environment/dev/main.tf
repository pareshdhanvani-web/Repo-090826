module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs

}
module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_virtual_network"
  vnets      = var.vnets
}
module "subnet" {
  depends_on = [module.resource_group, module.virtual_network]
  source     = "../../modules/azurerm_subnet"
  snets      = var.snets
}
module "virtual_machine" {
  depends_on = [module.resource_group, module.virtual_network, module.subnet]
  source     = "../../modules/azurerm_vm"
  vms        = var.vms
}