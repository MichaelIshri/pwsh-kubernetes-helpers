# PowerShell Kubernetes Helpers
Contains a collection of helper scripts to simplify working with Kubernetes.

## Generators
The following file generators can be used to stub out Kubernetes YAML files. When an option isn't provided, a default value is put in it's place which you can choose to remove. The idea is to stub out everything and then you can refine it by removing anything you don't need.

#### `New-KubePod -Name -Image -ImageName`
Generates a new pod definition file.

`-Name`

Sets the name key in the metadata section

`-Image`

Sets the container image value

`-ImageName`

Sets the container image name value

##### Example Usage
```powershell
# Output to screen
New-KubePod -Name webapp -Image nginx:latest

# Output to file
New-KubePod -Name webapp -Image nginx:latest | Out-File my-pod.yaml
```