#This script will be turned into an exe for installation.
#future upgrade options, check if mudlet is running.

#Edit below-----------------------------------------------------------------------------------------------------------------
$binpath = $env:TEMP + "\TECMudletInstallation"
$TECClientURL = "https://github.com/TheEternalCitizens/mudlet-integration/releases/download/tecLatest/The.Eternal.City.zip"
$TECClientZIP = $binpath + "\The.Eternal.City.zip"
$mudletInstallerURL = "https://www.mudlet.org/download/Mudlet-4.2.1-windows-installer.exe"
$mudletInstaller = "$binpath\mudletInstaller.msi"
$mudletProfilePath = $env:USERPROFILE + "\.config\mudlet\profiles"
$TECProfileVerificationPath = $mudletProfilePath + "\The Eternal City\settings"
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
        $BackupTime = Get-Date -f MM-dd-yyyy_HH_mm_ss
        Move-Item -Path $TECProfileVerificationPath "$binpath\Settings $BackupTime"

        'Removing old profile.'
        Remove-Item –path "$mudletProfilePath\The Eternal City" –recurse

        'Extracting the Mudlet profile for The Eternal City.'
        [System.IO.Compression.ZipFile]::ExtractToDirectory($TECClientZIP, $mudletProfilePath)

        'Moving player created scripts from old profile to fresh profile.'
        'Code here once player scripts method is completed.'
        #Move-Item -Path "$binpath\$BackupTime\Something" $TECProfileVerificationPath
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