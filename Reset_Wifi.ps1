# Alterando política de execução;

Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass


#01. Selecionando: Nome da rede e número da interface;

Get-NetAdapter | Select name, ifIndex | Format-List

#02. Colocando display para usuário:

[String]$stringWifi = "Wi-Fi"

Write-Host ('Identifique o termo "Wi-Fi" e seu respectivo número de interface')


#03. Lendo entrada dousuário:

[int]$inputUser = Read-Host ('Insira o número da interface Wi-fi: ').Trim()


#04. Removendo Servidor DNS:

Set-DnsClientServerAddress -InterfaceIndex $inputUser -ResetServerAddresses

Remove-NetIPAddress -InterfaceAlias "Wi-Fi"

#05. Resetando demais redes:


ipconfig /release

ipconfig /renew

ipconfig /flushdns
