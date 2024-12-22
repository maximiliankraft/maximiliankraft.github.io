---
layout: page
title: Dateibasierte provisionierung mit Terraform
permalink: /TeachingMaterials/Terraform
menubar: false
nav_exclude: true
exclude: true
nav: false
---

Nachdem wir mit dem Azure Web Interface eine VM erstellt haben, um in dieser Container zu hosten, ist der nächste Schritt die Provisionierung der VM zu automatisieren. 

In Docker Compose kann man eine Umgebung für seine Software definieren, d.h. welche Ports und anderen Services verfügbar sind. Terraform macht dasselbe auf der Ebene der Infrastruktur. Man legt hier seine Umgebung fest - welche VM erzeugt werden soll, wie viel Arbeits- und Festplattenspeicher diese hat. Auch öffentliche IP-Adressen und Hostnamen kann man festlegen. All das sind sogenannte `Resources` in einer .tf Datei. Diese `Resources` kann man später verwenden, um seine Services darauf auszuführen.

## Aufbau einer .tf Datei

Ganz oben hat man meistens einen Provider-Block. In diesem wird festgelegt, wo die erstellten Ressourcen angelegt werden, z.B. auf Azure, AWS, Oracle Cloud oder Google Cloud. Dazu muss man sich zunächst die CLIs dieser Provider installieren. Terraform wird dann die eingegebenen Ressourcen in Kommandos für die CLIs übersetzen, damit diese auf den Providern angelegt werden.

Beispiel für einen Azure Provider Block:
```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}
```

Hat man den Provider festgelegt, kann man verschiedene Ressourcen anlegen, zum Beispiel öffentliche IP-Adressen, virtuelle Maschinen, App Services oder Kubernetes Cluster. Je nach Provider muss man die Ressourcen allerdings unterschiedlich anlegen. Man kann nicht eine VM erstellen und diese dann 1:1 auf Oracle Cloud und Google Cloud ausführen lassen. Es gibt für jeden Cloud-Provider genaue Vorgaben, wie die Ressourcen zu definieren sind. Jedoch ist es damit immer noch einfacher, schnell von einem Provider zum anderen zu wechseln, wenn man für jeden Provider eine eigene .tf-Datei anlegt. Im Vergleich zu einer manuellen Migration über die Web-Interfaces oder CLIs der Anbieter. 

Beispiel für eine Azure VM Resource:
```hcl
resource "azurerm_virtual_machine" "example" {
  name                  = "example-vm"
  location              = "westeurope"
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size              = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    name              = "example-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}
```

Hat man alle Ressourcen angelegt und diese wurden erstellt, wird auf der lokalen Festplatte eine `terraform.tfstate` Datei erstellt, in der der aktuelle Zustand der Cloud-Ressourcen festgehalten wird. Sollte während dem Erstellen der Ressourcen ein Fehler passieren, kann man immer von diesem aktuellen Zustand ausgehen und muss bestimmte Ressourcen nicht doppelt erstellen bzw. verhindert so, dass sie doppelt erstellt werden.

Wenn alle Ressourcen erstellt wurden, kann man zur leichteren Weiterverarbeitung `Outputs` definieren. Darin werden bestimmte während der Erstellung der Ressourcen angelegte Variablen und Parameter auf die Konsole geschrieben. Man kann auch später mit `terraform output <output-name>` einzelne Outputs abfragen, z.B. die IP-Adresse der aktuell angelegten virtuellen Maschine.

Beispiel für Outputs:
```hcl
output "public_ip" {
  value = azurerm_public_ip.example.ip_address
}

output "vm_username" {
  value = "azureuser"
}
```

## Aufgabe

Nimm folgende .tf-Datei als Grunlage um dir eine VM zu erstellen:

```hcl
# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Generate SSH key pair
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create resource group
resource "azurerm_resource_group" "rg" {
  name     = "tf_rg"
  location = "westeurope"
}

# Create virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "5xhbgm-vnet"
  address_space       = ["10.1.0.0/16"]
  location           = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create subnet
resource "azurerm_subnet" "subnet" {
  name                 = "default"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.1.1.0/24"]
}

# Create network security group and rules
resource "azurerm_network_security_group" "nsg" {
  name                = "5xhbgm-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTP"
    priority                   = 320
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTPS"
    priority                   = 340
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create public IP
resource "azurerm_public_ip" "pip" {
  name                = "5xhbgm-ip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}

# Create network interface
resource "azurerm_network_interface" "nic" {
  name                = "5xhbgm-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "nsg_association" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "5xhbgmvm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B2s" # B1s free eligible, B2s has more ram
  admin_username      = "azureuser"

  

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 64
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.ssh_key.public_key_openssh
  }

  patch_mode = "AutomaticByPlatform"
}

# Get the public IP after it's allocated (since it's dynamic)
data "azurerm_public_ip" "pip_data" {
  name                = azurerm_public_ip.pip.name
  resource_group_name = azurerm_resource_group.rg.name
  depends_on          = [azurerm_linux_virtual_machine.vm]
}

# Output variables
output "admin_username" {
  value = azurerm_linux_virtual_machine.vm.admin_username
}

output "public_ip_address" {
  value = data.azurerm_public_ip.pip_data.ip_address
}

output "ssh_private_key" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}

output "ssh_public_key" {
  value = tls_private_key.ssh_key.public_key_openssh
}

```

Logge dich via SSH in die aktuell provisionierte VM ein und erstelle ein Skript, in dem:
1. Docker installiert wird
2. Eine Docker Compose-Datei erstellt und gestartet wird
3. Lege eine Resource an (z.B. `azurerm_virtual_machine_extension` [(siehe terraform-docs)](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension)) [(siehe azure-docs)](https://learn.microsoft.com/de-de/azure/virtual-machines/extensions/features-linux?tabs=azure-cli#azure-resource-manager-templates), die dieses Skript beim erstmaligen Start der VM in Zukunft ausführt und dafür sorgt, dass sofort alles verfügbar ist, was man braucht, um die Webanwendung ausführen zu können. Teste das Skript zunächst über SSH. 

Beispiel für ein Startup-Skript:
```bash
#!/bin/bash
# Update package lists
sudo apt-get update

# Install prerequisites
sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install Docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add the VM's system user to docker group
sudo usermod -aG docker azureuser
exit 0
```

## Weitere Unterlagen

- [Why You NEED To Learn Terraform | Practical Tutorial - Travis Media](https://www.youtube.com/watch?v=nvNqfgojocs)

- [Terraform explained in 15 mins | Terraform Tutorial for Beginners - TechWorldwithNana](https://www.youtube.com/watch?v=l5k1ai_GBDE)

- [How to install the Azure CLI - learn.microsoft.com](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

- Statt VMs: [azurerm_linux_web_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app)