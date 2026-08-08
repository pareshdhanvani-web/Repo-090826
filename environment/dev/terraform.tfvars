rgs = {
  rg1 = {
    name = "rg1"
    loc  = "centralindia"
    mb   = "terraform"
    tags = {
      brand     = "sadakchhap"
      education = "anpadh"
      signature = "angutha"
      hobby     = "cars"
    }
  }
  rg2 = {
    name = "rg2"
    loc  = "centralindia"
    mb   = "terraform"
    tags = {
      brand     = "chhedilal"
      education = "panchavifail"
      signature = "angutha"
      hobby     = "badibadibaatein"
    }
  }
}
vnets = {
  vnet1 = {
    name   = "vnet1"
    rgname = "rg1"
    loc    = "centralindia"
    as     = ["1.0.0.0/16"]

  }
  vnet2 = {
    name   = "vnet2"
    rgname = "rg2"
    loc    = "centralindia"
    as     = ["1.1.0.0/16"]
  }
}
snets = {
  snet1 = {
    name      = "snet1"
    vnet_name = "vnet1"
    rgname    = "rg1"
    ap        = ["1.0.0.0/24"]

  }
  snet2 = {
    name      = "snet2"
    vnet_name = "vnet1"
    rgname    = "rg1"
    ap        = ["1.0.1.0/24"]
  }
  snet3 = {
    name      = "snet1"
    vnet_name = "vnet2"
    rgname    = "rg2"
    ap        = ["1.1.0.0/24"]
  }
  snet4 = {
    name      = "snet2"
    vnet_name = "vnet2"
    rgname    = "rg2"
    ap        = ["1.1.1.0/24"]
  }
}
vms = {
  vm1 = {
    nic_name         = "nic_vm1"
    rgname           = "rg1"
    loc              = "centralindia"
    subnet_name      = "snet1"
    subnet_vnet_name = "vnet1"
    vm_name          = "vm1"
    vm_size          = "standard_D2s_V3"
    admin_username   = "azureuser"
    admin_password   = "Azure@123"

  }
  vm2 = {
    nic_name         = "nic_vm2"
    rgname           = "rg2"
    loc              = "centralindia"
    subnet_name      = "snet1"
    subnet_vnet_name = "vnet2"
    vm_name          = "vm2"
    vm_size          ="standard_D2s_V3"
    admin_username   = "azureuser"
    admin_password   = "Azure@123"
  }
}
