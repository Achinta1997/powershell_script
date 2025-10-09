param($Request, $TriggerMetadata)

# Simple log
Write-Host "PowerShell Azure Function executed!"

# Extract query parameter (name)
$name = $Request.Query.name

if (-not $name) {
    $name = "world"
}

# Create response
$body = "Hello $name from PowerShell Azure Function!"

# Return response
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = 200
    Body = $body
})
