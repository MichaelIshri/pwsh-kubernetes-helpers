Import-Module -Name "$($PSScriptRoot)\Set-Capture.psm1"
<#
    .Synopsis
    Generates a service template file for use in Kubernetes

    .Description
    Generates a service template file for use in Kubernetes

    .Parameter Name
    Sets the name key in the metadata section

    .Example
    New-KubeService -Name webapp-service

    .Example
    New-KubeService -Name webapp-service | Out-File my-service.yaml
#>
function New-KubeService() {
    param(
        [Parameter(Mandatory=$false)][String]$Name="service-example"
    )

    $stub = Get-Content -Path "$($PSScriptRoot)\..\stubs\service.yaml" -Raw
        | Set-Capture -Find "{{ name }}" -ReplaceWith $Name
    
    return $stub
}