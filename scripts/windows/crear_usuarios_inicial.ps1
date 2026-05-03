# ============================================================
# crear_usuarios_inicial.ps1 — Escenario inseguro inicial
# Proyecto: Adecuación ENS Categoría MEDIA — Saniter
# NOTA: Este script reproduce el estado INSEGURO de partida.
#       No ejecutar en producción.
# ============================================================
 
$pass = ConvertTo-SecureString '**********' -AsPlainText -Force
$nombres = 'Alberto','Alejandra','Beatriz','Carlos','Cristian','JoseRamon','Lidia'
 
foreach ($n in $nombres) {
    New-ADUser -Name $n -SamAccountName $n `
        -AccountPassword $pass -Enabled $true `
        -PasswordNeverExpires $true `
        -Path "CN=Users,$((Get-ADDomain).DistinguishedName)"
    Write-Host "Usuario $n creado en CN=Users" -ForegroundColor Green
}
