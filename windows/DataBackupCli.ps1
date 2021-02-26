# Author: Hieu Do (hieusydo@gmail.com)
# Date: Feb 2021

$SourceRoot = "D:\"
$DestRoot = "R:\REPLICA_1\"
$SubSourceDir = Get-ChildItem -Path $SourceRoot -Directory

# Number of threads for robocopy to run
$ThreadCnt = 12

# Delay time before running the script
$WaitTime = 3

# Timestamp for log file
$Ts = Get-Date -Format "yyyy-MM-ddTHHmmss"
$Log = "backup_log_$($Ts).txt"

Write-Output "Source is $($SourceRoot)"
Write-Output "Destination is $($DestRoot)"
Write-Output "Please verify the source and destination. Starting backup process in $($WaitTime) seconds..."

Start-Sleep -Seconds $WaitTime

Foreach($SubFolder in $SubSourceDir) {
    Write-Output "Mirroring $($SubFolder.FullName) to $($DestRoot)$($SubFolder)"
    robocopy "$($SubFolder.FullName)" "$($DestRoot)$($SubFolder)" /mt:$ThreadCnt /mir /np /unilog+:$Log
}