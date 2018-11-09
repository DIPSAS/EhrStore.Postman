function Exec([scriptblock]$cmd, [string]$errorMessage = "Error executing command: " + $cmd) {
    & $cmd
    if ($LastExitCode -ne 0) {
        throw $errorMessage
    }
}
exec { & npm install -g newman newman-reporter-teamcity }

exec { & newman run ./src/EhrStore.postman_collection.json -r teamcity}
