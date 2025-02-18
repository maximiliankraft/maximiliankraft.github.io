---
layout: page
title: Automatisches Deployment mittels Shellskript
menubar: false
nav_exclude: true
exclude: true
nav: false
---

> Aufbauend auf [Teil 1](/TeachingMaterials/DevOps/Terraform/) der Terraform-Übung

# Automatisches Deployment mittels Shellskript

Füge zu deiner `.tf`-Datei nach der VM-Ressource folgende Ressource für eine VM-Extension an:

```hcl
resource "azurerm_virtual_machine_extension" "init-script" {
  name                 = "docker-install-and-init"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  protected_settings = jsonencode({
    "commandToExecute": file("./cloud-init.sh"),
  })

  depends_on = [
    azurerm_linux_virtual_machine.vm
  ]
}
```

#### Weitere Informationen & Dokumentation zu VM Extensions

> [Terraform azurerm_virtual_machine_extension specification](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension)

> [Azure virtual machine extensions and features](https://learn.microsoft.com/en-us/azure/virtual-machines/extensions/overview)

## Shellskript zum einrichten der VM

Die obige `Virtual Machine Extension` führt die Datei cloud-init.sh aus, nachdem die VM gestartet wurde. Bei mir ist in dieser Datei folgendes enthalten:

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

TOKEN=<secret>
echo "$TOKEN" | sudo docker login registry.gitlab.com -u maximiliankraft --password-stdin

cat > docker-compose.yml << EOF
services:
  springimage:
    ports:
      - 80:8080
    image: registry.gitlab.com/maximiliankraft/5xhbgm_server_2425:v0.4
    depends_on:
      - db
    environment:
      - MYSQL_ROOT_PASSWORD=root
      - MYSQL_DATABASE=fhir
    volumes:
      - mysqlvolume:/var/lib/mysql
    
  db:
    image: mysql
    environment:
      - MYSQL_ROOT_PASSWORD=root
      - MYSQL_DATABASE=fhir
    volumes:
      - mysqlvolume:/var/lib/mysql
volumes:
  mysqlvolume:
EOF

sudo docker compose up db -d
sleep 10
sudo docker compose up springimage -d
exit 0
```

## Übung

Passe das Shellskript für deine Spring-Anwendung/Diplomprojekt an. Durch den Befehl `terraform apply` soll nicht nur eine VM erstellt werden, sondern diese auch automatisch konfiguriert werden. 

Beschreibe beides Detailiert in einem Protokoll und gib dieses auf Moodle ab. 