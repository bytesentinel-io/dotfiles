[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding
$env:STARSHIP_DISTRO = ""
Invoke-Expression (&starship init powershell)
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
# Import-Module PSFzf
# Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias photoshop 'D:\Applications\Program Files\Adobe Photoshop 2022\Photoshop.exe'
Set-Alias rufus "D:\Applications\Program Files\Rufus\rufus-3.19.exe"

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Custom Utilities
# Import-Module C:\Tools\generate_secret.ps1
# Import-Module C:\Tools\load_secret.ps1

function touch ($file) {
  if (!($null -eq $file)) {
    try {
      New-Item -Name $file -ItemType File -ErrorAction Stop
      # Write-Host -ForegroundColor Green "File $($file) created successfully!"
    } catch {
      Write-Host -ForegroundColor Red "ERROR: File couldn't created!"
      exit 0
    }
  } else {
    Write-Host -ForegroundColor Red "ERROR: File name must not empty!"
  }
}
