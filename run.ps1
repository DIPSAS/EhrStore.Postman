function Exec([scriptblock]$cmd, [string]$errorMessage = "Error executing command: " + $cmd) {
    & $cmd
    if ($LastExitCode -ne 0) {
        throw $errorMessage
    }
}
exec { & npm install -g newman newman-reporter-teamcity }

exec { &  Get-ChildItem -Path "src\*collection.json" -Recurse | Sort-Object Length -Descending | ForEach-Object {
    newman run $_.FullName -r teamcity
}
}

