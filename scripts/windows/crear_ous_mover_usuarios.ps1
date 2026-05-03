# ============================================================
# crear_ous_y_mover_usuarios.ps1
# Proyecto: Adecuación ENS Categoría MEDIA — Saniter
# Control ENS: [op.acc.1] [op.acc.2]
# ============================================================
 
# Crear Unidades Organizativas
New-ADOrganizationalUnit -Name 'Sistemas'       -Path 'DC=saniter,DC=local'
New-ADOrganizationalUnit -Name 'Administracion' -Path 'DC=saniter,DC=local'
New-ADOrganizationalUnit -Name 'Tecnicos'       -Path 'DC=saniter,DC=local'
New-ADOrganizationalUnit -Name 'Almacen'        -Path 'DC=saniter,DC=local'
 
# Mover usuarios a sus UOs correspondientes
Move-ADObject -Identity (Get-ADUser 'Beatriz').DistinguishedName `
    -TargetPath 'OU=Sistemas,DC=saniter,DC=local'
 
Move-ADObject -Identity (Get-ADUser 'Alberto').DistinguishedName `
    -TargetPath 'OU=Administracion,DC=saniter,DC=local'
Move-ADObject -Identity (Get-ADUser 'Alejandra').DistinguishedName `
    -TargetPath 'OU=Administracion,DC=saniter,DC=local'
Move-ADObject -Identity (Get-ADUser 'JoseRamon').DistinguishedName `
    -TargetPath 'OU=Administracion,DC=saniter,DC=local'
 
Move-ADObject -Identity (Get-ADUser 'Carlos').DistinguishedName `
    -TargetPath 'OU=Tecnicos,DC=saniter,DC=local'
Move-ADObject -Identity (Get-ADUser 'Cristian').DistinguishedName `
    -TargetPath 'OU=Tecnicos,DC=saniter,DC=local'
 
Move-ADObject -Identity (Get-ADUser 'Lidia').DistinguishedName `
    -TargetPath 'OU=Almacen,DC=saniter,DC=local'
 
Write-Host 'UOs creadas y usuarios reorganizados correctamente.' -ForegroundColor Green
