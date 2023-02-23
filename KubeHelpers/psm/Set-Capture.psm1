# Parses stub files looking for the key and then replaces with value when found.
function Set-Capture() {
    param(
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)][String]$Stub,
        [Parameter(Mandatory=$true,Position=1)][String]$Find,
        [Parameter(Mandatory=$true,Position=2)][String]$ReplaceWith
    )

    # Regex to find {{ example }} or {{example}}
    $regex =  "\{\{\s?(?:\S+)\s?\}\}"
    $captured = $Stub | Select-String -AllMatches -Pattern $regex

    foreach ($capture in $captured.matches) {
        # Remove any whitespaces so we can reduce the search to {{example}}
        if(($capture.Value -replace "\s", "") -eq ($Find -replace "\s", "")) {
            return $Stub -replace $capture.Value, $ReplaceWith
        }
    }

    return $Stub
}