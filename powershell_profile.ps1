# Prompts
oh-my-posh init pwsh | Invoke-Expression

oh-my-posh init pwsh --config 'C:\Users\shriv\AppData\Local\Programs\oh-my-posh\themes\sequoia_retro.omp.json' | Invoke-Expression

# Icons
Import-Module Terminal-Icons

# PSReadLine
Set-PsReadLineOption -PredictionSource History
Set-PsReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar


#Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PsReadlineChordReverseHistory 'Ctrl+r'

function Get-AllItems {
  Get-ChildItem -Force
}

function Run-Cpp {
  param (
      [string]$FileName
  )

  # Check if the file exists
  if (!(Test-Path $FileName)) {
      Write-Output "Error: File $FileName not found."
      return
  }

  # Get the full path of the .cpp file and set the .exe path accordingly
  $fullPath = (Get-Item $FileName).FullName
  $exePath = [System.IO.Path]::ChangeExtension($fullPath, ".exe")

  # Compile the C++ file
  g++ $FileName -o $exePath

  # Check if compilation was successful
  if ($LASTEXITCODE -eq 0) {
      Write-Output "Compilation successful. Running $exePath..."
      & $exePath  # Run the executable with full path
  } else {
      Write-Output "Compilation failed."
  }
}

# Alias
Set-Alias g git
Set-Alias which gcm
Set-Alias ll Get-AllItems
Set-Alias grep findstr
Set-Alias touch ni
Set-Alias cat gc
Set-Alias exp explorer
