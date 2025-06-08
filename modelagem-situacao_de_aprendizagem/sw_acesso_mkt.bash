#!/usr/bin/bash

# Habilita modo privilegiado
echo -e "enable"

# Entra no modo de configuração
echo -e "configure terminal\n"

# Definir hostname
echo -e "hostname SW_AC_MKT\n"

# Criar VLAN para a rede
echo -e "vlan 10"
echo -e "name REDE_MKT\n"
echo -e "switchport access vlan 10"

# Atribuir VLANs as portas a serem utilizadas
echo -e "interface range fa 0/1-9"
echo -e "duplex auto"
echo -e "speed auto"
echo -e "no shutdown\n"

echo -e "interface fa 0/24"
echo -e "switchport access vlan 10"
echo -e "duplex auto"
echo -e "speed auto"
echo -e "no shutdown\n"

echo -e "interface gi 0/1"
echo -e "switchport mode trunk"
echo -e "switchport trunk allowed vlan 10"
echo -e "duplex full"
echo -e "speed 1000"
echo -e "no shutdown\n"

# Desligar e reconfigurar as portas não utilizadas
echo -e "interface range fa 0/9-23"
echo -e "switchport access vlan 1"
echo -e "duplex auto"
echo -e "speed auto"
echo -e "shutdown\n"

echo -e "interface ra gi 0/2"
echo -e "switchport access vlan 1"
echo -e "duplex auto"
echo -e "speed auto"
echo -e "shutdown"
echo -e "exit\n"

# Salva as modificações feitas
echo -e "exit"
echo -e "copy running-config startup-config"
echo -e ""
echo -e "disable"
