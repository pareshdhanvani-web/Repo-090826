rgs = {
  rg1 = {
    name = "frontend-rg"
    loc  = "westindia"
    mb   = "terraform"
    tags = {
      brand     = "sadakchhap"
      education = "Aathvi-fail"
      signature = "angutha"
      hobby     = "cars"

    }
  }
  rg2 = {
    name = "backend-rg"
    loc  = "westindia"
    mb   = "terraform"
    tags = {
      brand     = "none"
      education = "dashviffail"
      signature = "thumb"
      hobby     = "badi-badi-baate"
    }
  }
}
vnets = {
  vnet1 = {
    name   = "frontend-vnet"
    rgname = "frontend-rg"
    loc    = "westindia"
    as     = ["1.0.0.0/16"]
  }
  vnet2 = {
    name   = "backend-vnet"
    rgname = "backend-rg"
    loc    = "westindia"
    as     = ["1.1.0.0/16"]
  }
}
snets = {
  snet1 = {
    name      = "AzureBastionSubnet"
    vnet_name = "frontend-vnet"
    rgname    = "frontend-rg"
    ap        = ["1.0.0.0/26"]

  }
  snet2 = {
    name      = "Frontend-subnet"
    vnet_name = "frontend-vnet"
    rgname    = "frontend-rg"
    ap        = ["1.0.1.0/24"]
  }
  snet3 = {
    name      = "backent-subnet"
    vnet_name = "backend-vnet"
    rgname    = "backend-rg"
    ap        = ["1.1.0.0/24"]
  }
}
pips = {
  pip1 = {
    name   = "pubip_bastion"
    rgname = "frontend-rg"
    loc    = "westindia"

    tags = {
      environment = "Preprod"
    }
  }
}
bastion = {
  bastion = {
    name             = "Azure_Bastion"
    rgname           = "frontend-rg"
    loc              = "westindia"
    ipconfigname     = "internal"
    subnetname       = "AzureBastionSubnet"
    subnet_vnet_name = "frontend-vnet"
    public_ip_name   = "pubip_bastion"


  }
}
nsg = {
  nsg1 = {
    nsg_name     = "frontend-nsg"
    rgname       = "frontend-rg"
    loc          = "west-india"
    nsgrule_name = "frontend-vm-rule"
    subnet_name  = "frontend-subnet"
    vnet_name    = "frontend-vnet"
  }
  nsg2 = {
    nsg_name     = "backend-nsg"
    rgname       = "backend-rg"
    loc          = "west-india"
    nsgrule_name = "backend-vm-rule"
    subnet_name  = "backend-subnet"
    vnet_name    = "backend-vnet"
  }
}
vms = {
  vm1 = {
    vmname          = "frontend-vm"
    vmsize          = "Standard_D2s_v3"
    nic_name        = "nic-frontend"
    rgname          = "frontend_rg"
    keyvault_name   = "keyvault"
    keyvault_rgname = "frontend-rg"
    subnet_name     = "frontend-subnet"
    vnet_name       = "frontend-vnet"

  }
  vm2 = {
    vmname          = "backend-vm"
    vmsize          = "Standard_D2s_v3"
    nic_name        = "nic-backend"
    rgname          = "backend_rg"
    keyvault_name   = "keyvault"
    keyvault_rgname = "frontend-rg"
    subnet_name     = "backend-subnet"
    vnet_name       = "backend-vnet"

  }
}

kv = {
  kv1 = {
    keyvault_name = "keyvault"
    rg_name       = "frontend-rg"
    location      = "westindia"
  }
}