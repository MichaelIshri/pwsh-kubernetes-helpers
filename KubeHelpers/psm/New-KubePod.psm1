Import-Module -Name "$($PSScriptRoot)\Set-Capture.psm1"

<#
    .Synopsis
    Generates pod template file for use in Kubernetes

    .Description
    Generates pod template file for use in Kubernetes

    .Parameter Name
    Sets the name key in the metadata section

    .Parameter Image
    Sets the container image value

    .Parameter ImageName
    Sets the container image name value

    .Example
    New-KubePod -Name webapp -Image nginx:latest

    .Example
    New-KubePod -Name webapp -Image nginx:latest | Out-File my-pod.yaml
#>
function New-KubePod() {
    param(
        [Parameter(Mandatory=$false)][String]$Name="pod-example",
        [Parameter(Mandatory=$false)][String]$Image="ubuntu:trusty",
        [Parameter(Mandatory=$false)][String]$ImageName="ubuntu"
    )
    
    $stub = Get-Content -Path "$($PSScriptRoot)\..\stubs\pod.yaml" -Raw 
        | Set-Capture -Find "{{ name }}" -ReplaceWith $Name
        | Set-Capture -Find "{{ image }}" -ReplaceWith $Image
        | Set-Capture -Find "{{ imageName }}" -ReplaceWith $ImageName
    
    return $stub
}