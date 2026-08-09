module "resource_group" {
  source = "../../Modules/Azurerm_Resource_Group"
  rgs    = var.rgs
}
module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../Modules/Azurerm_Virtual_network"
  vnets      = var.vnets
}
module "subnet" {
  depends_on = [module.resource_group, module.virtual_network]
  source     = "../../Modules/Azurerm_subnet"
  snets      = var.snets
}
module "pubip" {

  depends_on = [module.resource_group]
  source     = "../../Modules/Azurerm_pubip"
  pips       = var.pips

}
module "Bastion" {

  depends_on = [module.resource_group, module.pubip]
  source     = "../../Modules/Azurerm_Bastion"
  bastion    = var.bastion

}

module "nsg" {
  depends_on = [module.resource_group, module.subnet]
  source     = "../../Modules/Azurerm_NSG"
  nsg        = var.nsg
}
module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../Modules/Azurerm_Keyvault"
  kv         = var.kv

}
module "vm" {
  depends_on = [module.resource_group, module.subnet, module.nsg]
  source     = "../../Modules/Azurerm_Vm"
  vms        = var.vms

}