$interesting = @()

Write-Output "Looking for something sweet or salty..." 

$files = Get-ChildItem -Path C:\Users\Helen\Documents\Scripts\OtherThings\sweetnsalty -Include "*.config", "*.conf", "*.ini" -Recurse | Where-Object { $_.Attributes -ne "Directory"} | 
ForEach-Object {
    If (Get-Content $_.FullName | Select-String -Pattern "Username", "Password"){
        $interesting +=$_.FullName
    }
}


if ($interesting) {
    
    Write-Output " [*] Found something interesting in:" 
    $interesting 
} else {
    Write-Output "[-] Found nothing interesting:"
}