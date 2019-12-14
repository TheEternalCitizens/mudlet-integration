#This script will be turned into an exe for installation.
#future upgrade options, check if mudlet is running.

#Edit below-----------------------------------------------------------------------------------------------------------------
$binpath = $env:TEMP + "\The Eternal City Installation"
$TECClientURL = "https://github.com/TheEternalCitizens/mudlet-integration/releases/download/tecLatest/The.Eternal.City.zip"
$TECClientZIP = $binpath + "\The.Eternal.City.zip"
$mudletInstallerURL = "https://www.mudlet.org/download/Mudlet-4.4.0-windows-installer.exe"
$mudletInstaller = "$binpath\mudletInstaller.msi"
$mudletProfilePath = $env:USERPROFILE + "\.config\mudlet\profiles"
$TECProfileVerificationPath = $mudletProfilePath + "\The Eternal City"
$mudletEXE = $env:LOCALAPPDATA + "\Mudlet\mudlet.exe"
#Edit above-----------------------------------------------------------------------------------------------------------------

#Functions----------------------------------------------
Add-Type -AssemblyName System.IO.Compression.FileSystem

function installTECProfile {
    'Downloading The Eternal City Mudlet Profile'
    Invoke-WebRequest -UseBasicParsing -Uri "$TECClientURL" -OutFile $TECClientZIP

    'Checking if a Mudlet profile for The Eternal City already exists'
    if (Test-Path -Path $TECProfileVerificationPath -PathType Container) {
        'A mudlet profile for The Eternal City already exists'
        'Backing up the old player profile.'
        $BackupTime = Get-Date -f "MM-dd-yyyy-HH-mm-ss"
        $BackupDirectory = $binpath + "\The Eternal City " + $BackupTime
        Move-Item -Path $TECProfileVerificationPath -Destination $BackupDirectory -Force

        'Verifing that the profile moved correctly.'
        if (Test-Path -Path $TECProfileVerificationPath -PathType Container) {
            'Error profile was not moved.'
            'If mudlet is open, please close it and try again.'
            Write-Output "If you have a file explorer window open to any folder in $TECProfileVerificationPath please close it and try again."
            Write-Output "If you have a file explorer quick access link to any folder in $TECProfileVerificationPath please remove the link and try again."
            pause
            Exit
        }

        else {

        #'Removing old profile.'
        #Remove-Item –path "$mudletProfilePath\The Eternal City" –recurse

        'Extracting the Mudlet profile for The Eternal City.'
        [System.IO.Compression.ZipFile]::ExtractToDirectory($TECClientZIP, $mudletProfilePath)

        $UserBackupDirectory = $binpath + "\The Eternal City " + $BackupTime + "\settings\Your_*"
        'Moving player created scripts from old profile to fresh profile.'
        Write-Output "For any reason you would like to recover additional data a backup of the previous profile is in:`n`t$binpath\The Eternal City $BackupTime"
        Copy-Item -Path $UserBackupDirectory -Destination "$TECProfileVerificationPath\settings"
        }
    }
    else {
        'No existing Mudlet profile for The Eternal City found.'
        'Extracting the Mudlet profile for The Eternal City.'
        [System.IO.Compression.ZipFile]::ExtractToDirectory($TECClientZIP, $mudletProfilePath)
    }

    if (Test-Path -Path $TECProfileVerificationPath -PathType Container) {
        'The Eternal City Mudlet profile installed correctly.'
    }
    else { 'The Eternal City Mudlet profile did NOT install correctly.' }
}
#End Functions------------------------------------------

'Making directories'
$directories = @($binpath)
ForEach ($direcotory in $directories) { if( -Not (Test-Path -Path $direcotory ) ) { New-Item -ItemType directory -Path $direcotory } }

'Checking if mudlet is installed.'
if (-not (Test-Path -Path $mudletEXE -PathType leaf)) {
    'Mudlet is not installed.'
    
    installTECProfile

    'Downloading mudlet installer, normally this takes less than a minute. In rare instances it could take up to five minutes.'
    Invoke-WebRequest -UseBasicParsing -Uri $mudletInstallerURL -OutFile $mudletInstaller

    'Installing Mudlet now, please wait this is a silent installation. No splash screens or progress bars will appear. It should be completed within five minutes.'
    Start-Process -FilePath $mudletInstaller -ArgumentList "--silent" -Wait -NoNewWindow

    'Verifing mudlet installed.'
    if (Test-Path -Path $mudletEXE -PathType leaf) {
        'Mudlet installed correctly'
        Start-Process -FilePath $mudletEXE
    }
    else { 'Mudlet did not install correctly.' }
}
else {
    'Mudlet installation detected.'
    installTECProfile 
    Start-Process -FilePath $mudletEXE 
}

'If you are using a cloud sync application to backup your mudlet profile, you will need to wait for it to complete syncing the fresh profile before loggin in.'
pause