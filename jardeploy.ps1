$sourceFilePath = "C:\Users\apa16\Documents\JARExport\CustomAPIPPBjira.jar"
$destinationFolderPath = "E$\Tomcat\webapps\identityiq\WEB-INF\lib"
$remoteServers = @("gueasptsprd01", "gueasptsprd02", "gueaspuiprd01", "gueaspuiprd02")
$serviceName = "Apache Tomcat 9.0 Tomcat9"

foreach ($remoteServer in $remoteServers) {
    Write-Host "Copying file to $remoteServer"
    $uncPath = "\\$remoteServer\$destinationFolderPath"
    
    try {
        Copy-Item -Path $sourceFilePath -Destination $uncPath -Force -ErrorAction Stop
        Write-Host "File copied successfully to $remoteServer"
    } catch {
        Write-Host "Failed to copy file to $remoteServer"
        Write-Host "Error: $_"
    }
}
