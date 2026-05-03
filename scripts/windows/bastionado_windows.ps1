# ============================================================
# bastionado_windows.ps1
# Proyecto: Adecuación ENS Categoría MEDIA — Saniter
# Control ENS: [mp.s.1]
# Ejecutar como Administrador en PowerShell
# ============================================================
 
# --- Deshabilitar servicios innecesarios ---
Write-Host '>> Deshabilitando servicios innecesarios...' -ForegroundColor Cyan
 
Stop-Service -Name Spooler -Force
Set-Service -Name Spooler -StartupType Disabled
 
Stop-Service -Name RemoteRegistry -Force
Set-Service -Name RemoteRegistry -StartupType Disabled
 
Get-Service Spooler, RemoteRegistry | Select-Object Name, Status, StartType
 
# --- Deshabilitar TCP Timestamps ---
Write-Host '>> Deshabilitando TCP Timestamps...' -ForegroundColor Cyan
 
netsh int tcp set global timestamps=disabled
netsh int tcp show global | Select-String 'Timestamps'
 
# --- Configurar IP estática ENS ---
Write-Host '>> Configurando IP estática red ENS...' -ForegroundColor Cyan
 
New-NetIPAddress -InterfaceAlias 'Ethernet' `
    -IPAddress 10.0.0.20 -PrefixLength 24 -DefaultGateway 10.0.0.1
 
Set-DnsClientServerAddress -InterfaceAlias 'Ethernet' `
    -ServerAddresses ('127.0.0.1','10.0.0.20')
 
Write-Host 'Bastionado completado.' -ForegroundColor Green
