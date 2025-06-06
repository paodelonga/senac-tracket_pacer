#!/usr/bin/bash

# Habilita modo privilegiado
echo -e "enable"

# Entra no modo de configuração
echo -e "configure terminal\n"

# Definir hostname
echo -e "hostname SW_AC_CENTRAL\n"

# Criar as VLANs para as redes
echo -e "vlan 10"
echo -e "name REDE_RH\n"

echo -e "vlan 20"
echo -e "name REDE_MKT\n"

echo -e "vlan 30"
echo -e "name REDE_HALL\n"

echo -e "vlan 40"
echo -e "name REDE_TI\n"

echo -e "vlan 50"
echo -e "name REDE_DATACENTER\n"

# Atribuir VLANs as portas a serem utilizadas
echo -e "interface range fa 0/1-5"
echo -e "switchport mode access"
echo -e "switchport access vlan 50"
echo -e "duplex auto"
echo -e "speed auto"
echo -e "no shutdown\n"

echo -e "interface range fa 0/21-24"
echo -e "switchport mode trunk"
echo -e "duplex auto"
echo -e "speed auto"
echo -e "no shutdown\n"

echo -e "interface fa 0/21"
echo -e "switchport trunk allowed vlan 10,50\n"

echo -e "interface fa 0/22"
echo -e "switchport trunk allowed vlan 20,50\n"

echo -e "interface fa 0/23"
echo -e "switchport trunk allowed vlan 30,50\n"

echo -e "interface fa 0/24"
echo -e "switchport trunk allowed vlan 40,50\n"

# Desligar e reconfigurar as portas não utilizadas
echo -e "interface range fa 0/6-20"
echo -e "switchport access vlan 1"
echo -e "duplex auto"
echo -e "speed auto"
echo -e "shutdown\n"

echo -e "interface range gi 0/1-2"
echo -e "switchport access vlan 1"
echo -e "duplex auto"
echo -e "speed auto"
echo -e "shutdown"
echo -e "exit\n"

# Salva as modificações feitas
echo -e "exit"
echo -e "copy running-config startup-config"
