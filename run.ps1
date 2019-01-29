function Exec([scriptblock]$cmd, [string]$errorMessage = "Error executing command: " + $cmd) {
    & $cmd
    if ($LastExitCode -ne 0) {
        throw $errorMessage
    }
}
exec { & npm install -g newman newman-reporter-teamcity }

# Run newman tests for all json files named *collection.json in the src/ folder
exec { &  Get-ChildItem -Path "src\*collection.json" -Recurse | Sort-Object Length -Descending | ForEach-Object {
    newman run $_.FullName  --global-var "Protocol=https" --global-var
    "ServerHostname=vt-selecta-srv" --global-var "ServerPort=4443" --global-var
    "BasePath=openehr" -k -n 10 -r teamcity,cli
    }
}

# exec { &  Get-ChildItem -Path "src\*collection.json" -Recurse | Sort-Object Length -Descending | ForEach-Object {
#     newman run $_.FullName  --global-var "Protocol=https" --global-var "ServerHostname=vt-etl-selecta.etl.dips.no" --global-var "ServerPort=4443" --global-var "BasePath=openehr"  -k -r teamcity
#     }
# }
