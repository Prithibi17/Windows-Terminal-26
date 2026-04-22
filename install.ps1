#Requires -Version 5.1
<#
.SYNOPSIS
    Anime Terminal Themes Installer for Windows 10/11
.DESCRIPTION
    Installs anime-themed Oh-My-Posh prompts + Windows Terminal color schemes.
    One command. Zero hassle. Maximum anime power.
.PARAMETER Theme
    Skip the menu and install a specific theme directly.
    Values: dragonballz | scifi | fantasy | romcom | sliceoflife | minimal | mecha
.PARAMETER Uninstall
    Remove all anime terminal themes and restore defaults.
.EXAMPLE
    irm https://raw.githubusercontent.com/Prithibi17/Windows-Terminal-26/main/install.ps1 | iex
.EXAMPLE
    irm https://raw.githubusercontent.com/Prithibi17/Windows-Terminal-26/main/install.ps1 -OutFile install.ps1; .\install.ps1 -Theme dragonballz
#>

param(
    [Parameter()]
    [ValidateSet("dragonballz","scifi","fantasy","romcom","sliceoflife","minimal","mecha","")]
    [string]$Theme = "",

    [switch]$Uninstall
)

# ═══════════════════════════════════════════════════════════════════
#  CONFIG — Update REPO_URL after uploading to GitHub
# ═══════════════════════════════════════════════════════════════════
$REPO_URL   = "https://raw.githubusercontent.com/Prithibi17/Windows-Terminal-26/main"
$FONT_NAME  = "CascadiaCode"   # Nerd Font to install
$OMP_DIR    = "$env:LOCALAPPDATA\Programs\oh-my-posh"
$THEMES_DIR = "$env:POSH_THEMES_PATH"

# ═══════════════════════════════════════════════════════════════════
#  COLORS & HELPERS
# ═══════════════════════════════════════════════════════════════════
function Write-Color {
    param([string]$Text, [ConsoleColor]$Color = "White", [switch]$NoNewLine)
    $old = $Host.UI.RawUI.ForegroundColor
    $Host.UI.RawUI.ForegroundColor = $Color
    if ($NoNewLine) { Write-Host $Text -NoNewline } else { Write-Host $Text }
    $Host.UI.RawUI.ForegroundColor = $old
}

function Write-Step { param([string]$Msg)
    Write-Color "  ❯ " "Cyan" -NoNewLine; Write-Color $Msg "White" }

function Write-OK { param([string]$Msg)
    Write-Color "  ✔ " "Green" -NoNewLine; Write-Color $Msg "Gray" }

function Write-Fail { param([string]$Msg)
    Write-Color "  ✘ " "Red" -NoNewLine; Write-Color $Msg "Red" }

function Write-Banner { param([string]$Art, [ConsoleColor]$Color)
    $Art.Split("`n") | ForEach-Object { Write-Color $_ $Color } }

# ═══════════════════════════════════════════════════════════════════
#  THEME DEFINITIONS (embedded — no extra downloads needed!)
# ═══════════════════════════════════════════════════════════════════
$THEMES = @{

    dragonballz = @{
        Name        = "Dragon Ball Z"
        Emoji       = "⚡"
        Description = "POWER LEVEL: OVER 9000! Orange fire, Saiyan blue & Super Saiyan gold."
        BgColor     = "#0A0A1A"
        FgColor     = "#FFD700"
        WTScheme    = "AnimeDBZ"
        AsciiArt    = @"
     ___  ___  ___  ___ ___  _  _   ___   _   _    _     ____
    |   \| _ \/ _ \/ __/ _ \| \| | | _ ) /_\ | |  | |   |_  /
    | |) |   / (_) | (_| (_) | .` | | _ \/ _ \| |__| |__  / /
    |___/|_|_\\___/ \___\___/|_|\_| |___/_/ \_|____|____//___|
                ⚡ POWER LEVEL: OVER 9000 ⚡
"@
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "console_title_template": "⚡ {{ .Shell }} :: {{ .Folder }} | POWER LEVEL: OVER 9000 ⚡",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        {
          "type": "text",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b0",
          "foreground": "#FFFFFF",
          "background": "#FF6B00",
          "template": " ⚡ SAIYAN "
        },
        {
          "type": "os",
          "style": "powerline",
          "powerline_symbol": "\ue0b0",
          "foreground": "#FF6B00",
          "background": "#1A1A2E",
          "properties": { "windows": "\uf17a " }
        },
        {
          "type": "path",
          "style": "powerline",
          "powerline_symbol": "\ue0b0",
          "foreground": "#1A1A2E",
          "background": "#FFD700",
          "properties": {
            "style": "folder",
            "folder_separator_icon": " 龍 ",
            "folder_icon": "\uf07b",
            "home_icon": "\uf015"
          }
        },
        {
          "type": "git",
          "style": "powerline",
          "powerline_symbol": "\ue0b0",
          "foreground": "#FFFFFF",
          "background": "#1E3A8A",
          "foreground_templates": ["{{ if or (.Working.Changed) (.Staging.Changed) }}#FFD700{{ end }}"],
          "background_templates": ["{{ if or (.Working.Changed) (.Staging.Changed) }}#FF4500{{ end }}"],
          "properties": { "branch_icon": "⚡ ", "fetch_status": true }
        },
        {
          "type": "exit",
          "style": "diamond",
          "leading_diamond": "\ue0b0",
          "trailing_diamond": "\ue0b4",
          "foreground": "#FFFFFF",
          "background": "#8B0000",
          "template": "{{ if gt .Code 0 }} ✘ {{ .Code }} {{ end }}",
          "properties": { "always_enabled": false }
        }
      ]
    },
    {
      "type": "rprompt",
      "overflow": "hidden",
      "segments": [
        {
          "type": "battery",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b4",
          "foreground": "#FF6B00",
          "background": "#1A1A2E",
          "foreground_templates": [
            "{{ if lt .Percentage 20 }}#FF0000{{ end }}",
            "{{ if and (ge .Percentage 20) (lt .Percentage 50) }}#FFD700{{ end }}",
            "{{ if ge .Percentage 50 }}#00FF41{{ end }}"
          ],
          "template": " {{ if .Error }}N/A{{ else }}⚡ {{ .Percentage }}%{{ end }} ",
          "properties": { "charged_icon": "⚡ ", "charging_icon": "↑ ", "discharging_icon": "↓ " }
        },
        {
          "type": "time",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b4",
          "foreground": "#FFD700",
          "background": "#0A0A1A",
          "properties": { "time_format": "15:04:05" },
          "template": " \uf017 {{ .CurrentDate | date .Format }} "
        }
      ]
    },
    {
      "type": "prompt",
      "alignment": "left",
      "segments": [
        {
          "type": "text",
          "style": "plain",
          "foreground": "#FF6B00",
          "template": "❯❯❯ "
        }
      ]
    }
  ],
  "final_space": true,
  "version": 2
}
'@
        WTColors = @{
            background = "#0A0A1A"; foreground = "#FFD700"; cursorColor = "#FF6B00"
            black="#0A0A0A"; blue="#1E3A8A"; brightBlack="#333333"; brightBlue="#4169E1"
            brightCyan="#00BFFF"; brightGreen="#32CD32"; brightPurple="#9B59B6"; brightRed="#FF4500"
            brightWhite="#FFFFFF"; brightYellow="#FFD700"; cyan="#00BFFF"; green="#32CD32"
            purple="#9B59B6"; red="#FF6B00"; white="#E0E0E0"; yellow="#FFA500"
        }
    }

    scifi = @{
        Name        = "Sci-Fi: Ghost Protocol"
        Emoji       = "◈"
        Description = "Cyberpunk cyan/matrix green. Hack the planet. Ghost in the Shell vibes."
        BgColor     = "#000D1A"
        FgColor     = "#00FFFF"
        WTScheme    = "AnimeSciFi"
        AsciiArt    = @"
     ___  ___ _____      ___ ___   ___ ___  ___ _____ ___   ___  ___  _
    / __|/ __|_ _\ \    / / | __| | _ \ _ \/ _ \_   _/ _ \ / __|/ _ \| |
    \__ \ (__ | | \ \/\/ /  | _|  |  _/   / (_) || || (_) | (__| (_) | |__
    |___/\___|___|  \_/\_/   |_|  |_| |_|_\\___/ |_| \___/ \___|\___/|____|
                    [ SYS://ONLINE ] [ HACK: READY ] ◈
"@
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "console_title_template": "[ SYS://{{ .Shell }} ] [ PATH://{{ .Folder }} ] [ STATUS: ONLINE ]",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        {
          "type": "text",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b4",
          "foreground": "#00FFFF",
          "background": "#001122",
          "template": " ◈ SYS "
        },
        { "type": "text", "style": "plain", "foreground": "#003355", "template": " " },
        {
          "type": "os",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b4",
          "foreground": "#00FFFF",
          "background": "#002244",
          "properties": { "windows": "\uf17a " }
        },
        { "type": "text", "style": "plain", "foreground": "#003355", "template": " " },
        {
          "type": "path",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b4",
          "foreground": "#00FF41",
          "background": "#001A33",
          "properties": { "style": "full", "folder_separator_icon": " ▸ " }
        },
        { "type": "text", "style": "plain", "foreground": "#003355", "template": " " },
        {
          "type": "git",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b4",
          "foreground": "#00FFFF",
          "background": "#001A2E",
          "foreground_templates": ["{{ if or (.Working.Changed) (.Staging.Changed) }}#FF00FF{{ end }}"],
          "background_templates": ["{{ if or (.Working.Changed) (.Staging.Changed) }}#1A0033{{ end }}"],
          "properties": { "branch_icon": "◈ ", "fetch_status": true }
        },
        {
          "type": "exit",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b4",
          "foreground": "#FF0044",
          "background": "#1A0011",
          "template": "{{ if gt .Code 0 }} ERR:{{ .Code }} {{ end }}",
          "properties": { "always_enabled": false }
        }
      ]
    },
    {
      "type": "rprompt",
      "overflow": "hidden",
      "segments": [
        {
          "type": "battery",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b4",
          "foreground": "#00FFFF",
          "background": "#001122",
          "foreground_templates": [
            "{{ if lt .Percentage 20 }}#FF0044{{ end }}",
            "{{ if and (ge .Percentage 20) (lt .Percentage 50) }}#FF8800{{ end }}",
            "{{ if ge .Percentage 50 }}#00FFFF{{ end }}"
          ],
          "template": " {{ if .Error }}N/A{{ else }}PWR:{{ .Percentage }}%{{ end }} "
        },
        {
          "type": "time",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b4",
          "foreground": "#00FF41",
          "background": "#001122",
          "properties": { "time_format": "15:04:05" },
          "template": " ◈ {{ .CurrentDate | date .Format }} "
        }
      ]
    },
    {
      "type": "prompt",
      "alignment": "left",
      "segments": [
        { "type": "text", "style": "plain", "foreground": "#00FFFF", "template": "▸▸ " }
      ]
    }
  ],
  "final_space": true,
  "version": 2
}
'@
        WTColors = @{
            background="#000D1A"; foreground="#00FFFF"; cursorColor="#00FF41"
            black="#000D1A"; blue="#0066FF"; brightBlack="#003355"; brightBlue="#00AAFF"
            brightCyan="#00FFFF"; brightGreen="#00FF41"; brightPurple="#FF00FF"; brightRed="#FF0044"
            brightWhite="#E0FFFF"; brightYellow="#FFFF00"; cyan="#00CCCC"; green="#00CC33"
            purple="#8800FF"; red="#FF0044"; white="#CCDDEE"; yellow="#CCCC00"
        }
    }

    fantasy = @{
        Name        = "Fantasy: Dungeon Quest"
        Emoji       = "⚔"
        Description = "Deep dungeon purple, arcane gold & emerald. Overlord / SAO / Re:Zero magic."
        BgColor     = "#0D0520"
        FgColor     = "#E8D5FF"
        WTScheme    = "AnimeFantasy"
        AsciiArt    = @"
    ___   _   _  _ _____ _   ___ _____   ___  _   _ ___ ___ _____
   | __| /_\ | \| |_   _/_\ / __|_   _| / _ \| | | | __/ __|_   _|
   | _| / _ \| .` | | |/ _ \\__ \ | |  | (_) | |_| | _|\__ \ | |
   |_| /_/ \_|_|\_| |_/_/ \_|___/ |_|   \__\_\\___/|___|___/ |_|
               ⚔ Enter the Dungeon — Magic Awaits ⚔
"@
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "console_title_template": "⚔ {{ .Shell }} | Dungeon: {{ .Folder }} | Quest Active ⚔",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        {
          "type": "text",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b0",
          "foreground": "#FFD700",
          "background": "#2D1B69",
          "template": " ⚔ HERO "
        },
        {
          "type": "os",
          "style": "powerline",
          "powerline_symbol": "\ue0b0",
          "foreground": "#E8D5FF",
          "background": "#1A0A3C",
          "properties": { "windows": "\uf17a " }
        },
        {
          "type": "path",
          "style": "powerline",
          "powerline_symbol": "\ue0b0",
          "foreground": "#FFD700",
          "background": "#3D1A78",
          "properties": { "style": "folder", "folder_separator_icon": " ✦ " }
        },
        {
          "type": "git",
          "style": "powerline",
          "powerline_symbol": "\ue0b0",
          "foreground": "#1A0A3C",
          "background": "#00C853",
          "foreground_templates": ["{{ if or (.Working.Changed) (.Staging.Changed) }}#FFD700{{ end }}"],
          "background_templates": ["{{ if or (.Working.Changed) (.Staging.Changed) }}#FF6600{{ end }}"],
          "properties": { "branch_icon": "✦ ", "fetch_status": true }
        },
        {
          "type": "exit",
          "style": "diamond",
          "leading_diamond": "\ue0b0",
          "trailing_diamond": "\ue0b4",
          "foreground": "#FFD700",
          "background": "#8B0000",
          "template": "{{ if gt .Code 0 }} ☠ {{ .Code }} {{ end }}",
          "properties": { "always_enabled": false }
        }
      ]
    },
    {
      "type": "rprompt",
      "overflow": "hidden",
      "segments": [
        {
          "type": "battery",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b4",
          "foreground": "#FFD700",
          "background": "#2D1B69",
          "foreground_templates": [
            "{{ if lt .Percentage 20 }}#FF0000{{ end }}",
            "{{ if and (ge .Percentage 20) (lt .Percentage 50) }}#FFA500{{ end }}",
            "{{ if ge .Percentage 50 }}#00C853{{ end }}"
          ],
          "template": " {{ if .Error }}N/A{{ else }}♥ MP: {{ .Percentage }}%{{ end }} "
        },
        {
          "type": "time",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b4",
          "foreground": "#E8D5FF",
          "background": "#1A0A3C",
          "properties": { "time_format": "15:04:05" },
          "template": " ✦ {{ .CurrentDate | date .Format }} "
        }
      ]
    },
    {
      "type": "prompt",
      "alignment": "left",
      "segments": [
        { "type": "text", "style": "plain", "foreground": "#FFD700", "template": "⚔ ❯ " }
      ]
    }
  ],
  "final_space": true,
  "version": 2
}
'@
        WTColors = @{
            background="#0D0520"; foreground="#E8D5FF"; cursorColor="#FFD700"
            black="#0D0520"; blue="#2D1B69"; brightBlack="#3D2579"; brightBlue="#6A3DE8"
            brightCyan="#00E5FF"; brightGreen="#00C853"; brightPurple="#CE93D8"; brightRed="#FF3D00"
            brightWhite="#FFFFFF"; brightYellow="#FFD700"; cyan="#00B8D4"; green="#00C853"
            purple="#9C27B0"; red="#D32F2F"; white="#E8D5FF"; yellow="#FFC107"
        }
    }

    romcom = @{
        Name        = "Rom-Com: Kawaii Mode"
        Emoji       = "♡"
        Description = "Deep pink hearts & sakura blossoms. Kaguya-sama / Toradora maximum sweetness."
        BgColor     = "#1A000D"
        FgColor     = "#FFB6C1"
        WTScheme    = "AnimeRomCom"
        AsciiArt    = @"
    _  __   ___  _ _ _   ___  _  _     _  _ ___  ___  ___
   | |/ /  / _ \| | | | |_ _|| \| |   | \| / _ \| _ \|_  )
   | ' <  | (_) |_|_|_|  | | | .` |   | .` \(_) |   / / /
   |_|\_\  \___/         |_| |_|\_|   |_|\_|\___/|_|_/___|
                   ♡  Doki Doki Terminal  ♡
"@
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "console_title_template": "♡ {{ .Shell }} ♡ {{ .Folder }} ♡ Sugoi!!",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        {
          "type": "text",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b0",
          "foreground": "#FFFFFF",
          "background": "#FF1493",
          "template": " ♡ KAWAII "
        },
        {
          "type": "os",
          "style": "powerline",
          "powerline_symbol": "\ue0b0",
          "foreground": "#FF1493",
          "background": "#FFB6C1",
          "properties": { "windows": "\uf17a " }
        },
        {
          "type": "path",
          "style": "powerline",
          "powerline_symbol": "\ue0b0",
          "foreground": "#4A0028",
          "background": "#FF85A1",
          "properties": { "style": "folder", "folder_separator_icon": " ✿ " }
        },
        {
          "type": "git",
          "style": "powerline",
          "powerline_symbol": "\ue0b0",
          "foreground": "#FFFFFF",
          "background": "#C71585",
          "foreground_templates": ["{{ if or (.Working.Changed) (.Staging.Changed) }}#FFD700{{ end }}"],
          "background_templates": ["{{ if or (.Working.Changed) (.Staging.Changed) }}#FF4500{{ end }}"],
          "properties": { "branch_icon": "♡ ", "fetch_status": true }
        },
        {
          "type": "exit",
          "style": "diamond",
          "leading_diamond": "\ue0b0",
          "trailing_diamond": "\ue0b4",
          "foreground": "#FFFFFF",
          "background": "#8B0000",
          "template": "{{ if gt .Code 0 }} ✗ {{ .Code }} {{ end }}",
          "properties": { "always_enabled": false }
        }
      ]
    },
    {
      "type": "rprompt",
      "overflow": "hidden",
      "segments": [
        {
          "type": "battery",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b4",
          "foreground": "#FF1493",
          "background": "#FFF0F5",
          "foreground_templates": [
            "{{ if lt .Percentage 20 }}#FF0000{{ end }}",
            "{{ if and (ge .Percentage 20) (lt .Percentage 50) }}#FF8C00{{ end }}",
            "{{ if ge .Percentage 50 }}#FF1493{{ end }}"
          ],
          "template": " {{ if .Error }}N/A{{ else }}♡ {{ .Percentage }}%{{ end }} "
        },
        {
          "type": "time",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b4",
          "foreground": "#FF1493",
          "background": "#FFF0F5",
          "properties": { "time_format": "15:04" },
          "template": " ✿ {{ .CurrentDate | date .Format }} "
        }
      ]
    },
    {
      "type": "prompt",
      "alignment": "left",
      "segments": [
        { "type": "text", "style": "plain", "foreground": "#FF69B4", "template": "♡ ❯ " }
      ]
    }
  ],
  "final_space": true,
  "version": 2
}
'@
        WTColors = @{
            background="#1A000D"; foreground="#FFB6C1"; cursorColor="#FF1493"
            black="#1A000D"; blue="#C71585"; brightBlack="#3D0020"; brightBlue="#FF69B4"
            brightCyan="#FFB6C1"; brightGreen="#FF85A1"; brightPurple="#EE82EE"; brightRed="#FF1493"
            brightWhite="#FFF0F5"; brightYellow="#FFD700"; cyan="#FF69B4"; green="#FF85A1"
            purple="#DA70D6"; red="#FF1493"; white="#FFB6C1"; yellow="#FFCBA4"
        }
    }

    sliceoflife = @{
        Name        = "Slice of Life: Cozy Café"
        Emoji       = "☕"
        Description = "Warm sage greens & coffee browns. K-On! / Barakamon / Yotsuba maximum chill."
        BgColor     = "#0D0A07"
        FgColor     = "#FFFACD"
        WTScheme    = "AnimeSliceOfLife"
        AsciiArt    = @"
     ___ _    ___ ___ ___        ___  ___   _    ___ _____ ___
    / __| |  |_ _/ __| __|      / _ \| __| | |  |_ _|  __|_  )
    \__ \ |__ | | (__| _|      | (_) | _|  | |__ | || _|  / /
    |___/____|___\___|___|      \___/|_|   |____|___|_|  /___|
                   ☕  Just Vibing. No Rush.  ☕
"@
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "console_title_template": "☕ {{ .Shell }} ~ {{ .Folder }} ~ Just vibing...",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        {
          "type": "text",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b0",
          "foreground": "#FFFACD",
          "background": "#6F4E37",
          "template": " ☕ COZY "
        },
        {
          "type": "os",
          "style": "powerline",
          "powerline_symbol": "\ue0b0",
          "foreground": "#FFFACD",
          "background": "#5C4033",
          "properties": { "windows": "\uf17a " }
        },
        {
          "type": "path",
          "style": "powerline",
          "powerline_symbol": "\ue0b0",
          "foreground": "#3E2723",
          "background": "#87A96B",
          "properties": { "style": "folder", "folder_separator_icon": " ♪ " }
        },
        {
          "type": "git",
          "style": "powerline",
          "powerline_symbol": "\ue0b0",
          "foreground": "#FFFACD",
          "background": "#4A7C59",
          "foreground_templates": ["{{ if or (.Working.Changed) (.Staging.Changed) }}#FFD700{{ end }}"],
          "background_templates": ["{{ if or (.Working.Changed) (.Staging.Changed) }}#8B6914{{ end }}"],
          "properties": { "branch_icon": "♪ ", "fetch_status": true }
        },
        {
          "type": "exit",
          "style": "diamond",
          "leading_diamond": "\ue0b0",
          "trailing_diamond": "\ue0b4",
          "foreground": "#FFFACD",
          "background": "#8B2500",
          "template": "{{ if gt .Code 0 }} ✗ {{ .Code }} {{ end }}",
          "properties": { "always_enabled": false }
        }
      ]
    },
    {
      "type": "rprompt",
      "overflow": "hidden",
      "segments": [
        {
          "type": "battery",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b4",
          "foreground": "#6F4E37",
          "background": "#FFFACD",
          "foreground_templates": [
            "{{ if lt .Percentage 20 }}#CC0000{{ end }}",
            "{{ if and (ge .Percentage 20) (lt .Percentage 50) }}#B8860B{{ end }}",
            "{{ if ge .Percentage 50 }}#4A7C59{{ end }}"
          ],
          "template": " {{ if .Error }}N/A{{ else }}☕ {{ .Percentage }}%{{ end }} "
        },
        {
          "type": "time",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b4",
          "foreground": "#3E2723",
          "background": "#FFE4B5",
          "properties": { "time_format": "15:04" },
          "template": " ☕ {{ .CurrentDate | date .Format }} "
        }
      ]
    },
    {
      "type": "prompt",
      "alignment": "left",
      "segments": [
        { "type": "text", "style": "plain", "foreground": "#87A96B", "template": "~ ❯ " }
      ]
    }
  ],
  "final_space": true,
  "version": 2
}
'@
        WTColors = @{
            background="#0D0A07"; foreground="#FFFACD"; cursorColor="#87A96B"
            black="#0D0A07"; blue="#5B8A72"; brightBlack="#3E2723"; brightBlue="#87A96B"
            brightCyan="#87CEEB"; brightGreen="#8BC34A"; brightPurple="#CE93D8"; brightRed="#FF7043"
            brightWhite="#FFFACD"; brightYellow="#FFE4B5"; cyan="#7EB8C5"; green="#6D9E4F"
            purple="#9575CD"; red="#E64A19"; white="#F5F5DC"; yellow="#F9A825"
        }
    }

    minimal = @{
        Name        = "Minimal: Zen / Wabi-Sabi"
        Emoji       = "·"
        Description = "Black, white & one red accent. Japanese minimalism. 侘び寂び."
        BgColor     = "#0F0F0F"
        FgColor     = "#E8E8E8"
        WTScheme    = "AnimeMinimal"
        AsciiArt    = @"


    ┌──────────────────────────────────────┐
    │  M I N I M A L   /   侘 び 寂 び    │
    │  wabi-sabi · less is more · 和       │
    └──────────────────────────────────────┘

"@
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "console_title_template": "{{ .Folder }}",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        {
          "type": "path",
          "style": "diamond",
          "leading_diamond": "[",
          "trailing_diamond": "]",
          "foreground": "#E8E8E8",
          "background": "transparent",
          "properties": {
            "style": "folder",
            "folder_separator_icon": "/",
            "home_icon": "~"
          }
        },
        { "type": "text", "style": "plain", "foreground": "#333333", "template": " " },
        {
          "type": "git",
          "style": "plain",
          "foreground": "#CC0000",
          "foreground_templates": ["{{ if or (.Working.Changed) (.Staging.Changed) }}#FF4444{{ end }}"],
          "properties": { "branch_icon": "", "fetch_status": true }
        }
      ]
    },
    {
      "type": "rprompt",
      "overflow": "hidden",
      "segments": [
        {
          "type": "time",
          "style": "plain",
          "foreground": "#555555",
          "properties": { "time_format": "15:04" },
          "template": "{{ .CurrentDate | date .Format }}"
        }
      ]
    },
    {
      "type": "prompt",
      "alignment": "left",
      "segments": [
        {
          "type": "exit",
          "style": "plain",
          "foreground": "#CC0000",
          "foreground_templates": ["{{ if eq .Code 0 }}#E8E8E8{{ end }}"],
          "template": "❯ ",
          "properties": { "always_enabled": true }
        }
      ]
    }
  ],
  "final_space": true,
  "version": 2
}
'@
        WTColors = @{
            background="#0F0F0F"; foreground="#E8E8E8"; cursorColor="#CC0000"
            black="#0F0F0F"; blue="#444444"; brightBlack="#333333"; brightBlue="#777777"
            brightCyan="#AAAAAA"; brightGreen="#CCCCCC"; brightPurple="#999999"; brightRed="#FF4444"
            brightWhite="#FFFFFF"; brightYellow="#DDDDDD"; cyan="#888888"; green="#AAAAAA"
            purple="#888888"; red="#CC0000"; white="#E8E8E8"; yellow="#CCCCCC"
        }
    }

    mecha = @{
        Name        = "Mecha: NERV / EVA Unit-01"
        Emoji       = "▲"
        Description = "Purple/orange/green EVA colors. NERV MAGI system. Evangelion terminal."
        BgColor     = "#080808"
        FgColor     = "#00FF00"
        WTScheme    = "AnimeMecha"
        AsciiArt    = @"
    _  _ ___ _____   _____ ___ ___ __  __ ___ _  _   _   _
   | \| | __| _ \ \ / / __| __| _ \  \/  |_ _| \| | /_\ | |
   | .` | _||   /\ V /| _|| _||   / |\/| || || .` |/ _ \| |__
   |_|\_|___|_|_\ \_/ |___|___|_|_\_|  |_|___|_|\_/_/ \_|____|
          ▲ MAGI SYSTEM — TERMINAL ACTIVE — SYNC: 100% ▲
"@
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "console_title_template": "NERV // MAGI SYSTEM // {{ .Shell }} // NODE: {{ .Folder }} // SYNC: ACTIVE",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        {
          "type": "text",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b0",
          "foreground": "#FF4500",
          "background": "#1A0000",
          "template": " ▲ NERV "
        },
        {
          "type": "os",
          "style": "powerline",
          "powerline_symbol": "\ue0b0",
          "foreground": "#00FF00",
          "background": "#0A0A0A",
          "properties": { "windows": "\uf17a " }
        },
        {
          "type": "path",
          "style": "powerline",
          "powerline_symbol": "\ue0b0",
          "foreground": "#FF4500",
          "background": "#150000",
          "properties": { "style": "folder", "folder_separator_icon": " // " }
        },
        {
          "type": "git",
          "style": "powerline",
          "powerline_symbol": "\ue0b0",
          "foreground": "#00FF00",
          "background": "#0A0A0A",
          "foreground_templates": ["{{ if or (.Working.Changed) (.Staging.Changed) }}#FF4500{{ end }}"],
          "background_templates": ["{{ if or (.Working.Changed) (.Staging.Changed) }}#1A0000{{ end }}"],
          "properties": { "branch_icon": "▲ ", "fetch_status": true }
        },
        {
          "type": "exit",
          "style": "diamond",
          "leading_diamond": "\ue0b0",
          "trailing_diamond": "\ue0b4",
          "foreground": "#FF0000",
          "background": "#2A0000",
          "template": "{{ if gt .Code 0 }} ALERT:{{ .Code }} {{ end }}",
          "properties": { "always_enabled": false }
        }
      ]
    },
    {
      "type": "rprompt",
      "overflow": "hidden",
      "segments": [
        {
          "type": "battery",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b4",
          "foreground": "#00FF00",
          "background": "#0A0A0A",
          "foreground_templates": [
            "{{ if lt .Percentage 20 }}#FF0000{{ end }}",
            "{{ if and (ge .Percentage 20) (lt .Percentage 50) }}#FF4500{{ end }}",
            "{{ if ge .Percentage 50 }}#00FF00{{ end }}"
          ],
          "template": " {{ if .Error }}N/A{{ else }}SYNC:{{ .Percentage }}%{{ end }} "
        },
        {
          "type": "time",
          "style": "diamond",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b4",
          "foreground": "#FF4500",
          "background": "#0A0A0A",
          "properties": { "time_format": "15:04:05" },
          "template": " ▲ {{ .CurrentDate | date .Format }} "
        }
      ]
    },
    {
      "type": "prompt",
      "alignment": "left",
      "segments": [
        { "type": "text", "style": "plain", "foreground": "#FF4500", "template": "▲▲ " }
      ]
    }
  ],
  "final_space": true,
  "version": 2
}
'@
        WTColors = @{
            background="#080808"; foreground="#00FF00"; cursorColor="#FF4500"
            black="#080808"; blue="#4B0082"; brightBlack="#1A0000"; brightBlue="#800080"
            brightCyan="#00FFFF"; brightGreen="#00FF00"; brightPurple="#9400D3"; brightRed="#FF4500"
            brightWhite="#E0E0E0"; brightYellow="#FFD700"; cyan="#00AAAA"; green="#00CC00"
            purple="#6B0FBB"; red="#CC3300"; white="#CCCCCC"; yellow="#CCAA00"
        }
    }
}

# ═══════════════════════════════════════════════════════════════════
#  HELPERS
# ═══════════════════════════════════════════════════════════════════

function Test-Admin {
    $identity  = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal]$identity
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Install-OhMyPosh {
    Write-Step "Checking Oh-My-Posh..."
    if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
        Write-OK "Oh-My-Posh already installed."
        return
    }
    Write-Step "Installing Oh-My-Posh via winget..."
    try {
        winget install JanDeDobbeleer.OhMyPosh -s winget --accept-package-agreements --accept-source-agreements -e | Out-Null
        Write-OK "Oh-My-Posh installed!"
    } catch {
        Write-Fail "winget failed. Trying manual install..."
        Set-ExecutionPolicy Bypass -Scope Process -Force
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
    }
}

function Install-Fastfetch {
    Write-Step "Checking for Fastfetch (system info tool)..."
    if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
        Write-OK "Fastfetch already installed."
        return
    }
    Write-Step "Installing Fastfetch via winget..."
    try {
        winget install fastfetch -s winget --accept-package-agreements --accept-source-agreements -e | Out-Null
        Write-OK "Fastfetch installed!"
    } catch {
        Write-Color "  ⚠ " "Yellow" -NoNewLine
        Write-Color "Fastfetch install failed. You can install it manually for the full look." "Yellow"
    }
}

function Install-NerdFont {
    Write-Step "Installing $FONT_NAME Nerd Font (this may take a moment)..."
    try {
        oh-my-posh font install $FONT_NAME 2>&1 | Out-Null
        Write-OK "Nerd Font installed! (Set it in Windows Terminal: Settings → Profiles → Font)"
    } catch {
        Write-Color "  ⚠ " "Yellow" -NoNewLine
        Write-Color "Font install failed. Download manually from: https://www.nerdfonts.com/font-downloads" "Yellow"
    }
}

function Get-WTSettingsPath {
    $paths = @(
        "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json",
        "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json",
        "$env:LOCALAPPDATA\Microsoft\Windows Terminal\settings.json"
    )
    foreach ($p in $paths) { if (Test-Path $p) { return $p } }
    return $null
}

function Update-WTSettings {
    param([string]$SchemeName, [hashtable]$Colors)

    $settingsPath = Get-WTSettingsPath
    if (-not $settingsPath) {
        Write-Color "  ⚠ " "Yellow" -NoNewLine
        Write-Color "Windows Terminal settings not found. Apply color scheme manually." "Yellow"
        return
    }

    Write-Step "Updating Windows Terminal color scheme..."
    try {
        $json = Get-Content $settingsPath -Raw | ConvertFrom-Json

        # Build scheme object
        $scheme = [ordered]@{ name = $SchemeName }
        foreach ($k in $Colors.Keys) { $scheme[$k] = $Colors[$k] }
        $schemeObj = [PSCustomObject]$scheme

        # Add or replace scheme
        if (-not $json.schemes) { $json | Add-Member -NotePropertyName "schemes" -NotePropertyValue @() }
        $existingIdx = -1
        for ($i = 0; $i -lt $json.schemes.Count; $i++) {
            if ($json.schemes[$i].name -eq $SchemeName) { $existingIdx = $i; break }
        }
        if ($existingIdx -ge 0) {
            $json.schemes[$existingIdx] = $schemeObj
        } else {
            $json.schemes += $schemeObj
        }

        # Apply scheme to default profile
        if ($json.profiles.defaults) {
            $json.profiles.defaults | Add-Member -NotePropertyName "colorScheme" -NotePropertyValue $SchemeName -Force
            $json.profiles.defaults | Add-Member -NotePropertyName "font" -NotePropertyValue ([PSCustomObject]@{ face = "CaskaydiaCove Nerd Font" }) -Force
            
            # Add -nologo to hide the copyright banner
            $currentCmd = $json.profiles.defaults.commandline
            if ($null -eq $currentCmd) { $currentCmd = "powershell.exe" }
            if ($currentCmd -notmatch "-nologo") {
                $json.profiles.defaults | Add-Member -NotePropertyName "commandline" -NotePropertyValue "$currentCmd -nologo" -Force
            }
        }

        $json | ConvertTo-Json -Depth 20 | Set-Content $settingsPath -Encoding UTF8
        Write-OK "Windows Terminal updated with $SchemeName scheme and -nologo flag!"
    } catch {
        Write-Color "  ⚠ " "Yellow" -NoNewLine
        Write-Color "Could not auto-update settings: $_" "Yellow"
    }
}

function Set-OmpTheme {
    param([string]$ThemeKey, [PSCustomObject]$ThemeDef)

    # Determine themes path
    if (-not $env:POSH_THEMES_PATH) {
        $env:POSH_THEMES_PATH = "$env:LOCALAPPDATA\Programs\oh-my-posh\themes"
    }
    $themesDir = $env:POSH_THEMES_PATH
    if (-not (Test-Path $themesDir)) { New-Item -ItemType Directory -Path $themesDir -Force | Out-Null }

    $outFile = Join-Path $themesDir "anime-$ThemeKey.omp.json"
    Write-Step "Writing theme to: $outFile"
    $ThemeDef.OmpJson | Set-Content $outFile -Encoding UTF8
    Write-OK "Theme file saved."
    return $outFile
}

function Update-PSProfile {
    param([string]$ThemeFile, [string]$AsciiArt)

    Write-Step "Updating PowerShell profile..."

    # Ensure profile directory exists
    $profileDir = Split-Path $PROFILE
    if (-not (Test-Path $profileDir)) { New-Item -ItemType Directory -Path $profileDir -Force | Out-Null }
    
    # Ensure profile file exists
    if (-not (Test-Path $PROFILE)) {
        New-Item -ItemType File -Path $PROFILE -Force | Out-Null
    }

    $profileContent = Get-Content $PROFILE -Raw -ErrorAction SilentlyContinue
    if ($null -eq $profileContent) { $profileContent = "" }

    $ompLine = "oh-my-posh init pwsh --config `"$ThemeFile`" | Invoke-Expression"
    $fetchLine = "if (Get-Command fastfetch -ErrorAction SilentlyContinue) { fastfetch } elseif (Get-Command winfetch -ErrorAction SilentlyContinue) { winfetch }"
    $marker  = "# [ANIME-TERMINAL]"
    $endMarker = "# [/ANIME-TERMINAL]"

    # Clean up ASCII art for profile inclusion
    $asciiBlock = "`$animeArt = @'`n$AsciiArt`n'@"

    $block = @"
$marker
# Generated by anime-terminal installer — https://github.com/Prithibi17/Windows-Terminal-26
if (`$Host.Name -eq 'ConsoleHost') { [console]::Clear() } else { Clear-Host }
$asciiBlock
Write-Host `$animeArt -ForegroundColor Cyan
$ompLine
$fetchLine
$endMarker
"@

    # ROBUST CLEANUP: Remove ALL previous instances of the block
    $cleanContent = $profileContent -replace "(?s)$([regex]::Escape($marker)).*?$([regex]::Escape($endMarker))", ""
    $cleanContent = $cleanContent.Trim()

    # Write the new block
    if ($cleanContent.Length -gt 0) {
        $cleanContent + "`n`n" + $block | Set-Content $PROFILE -Encoding UTF8 -Force
    } else {
        $block | Set-Content $PROFILE -Encoding UTF8 -Force
    }

    Write-OK "PowerShell profile updated and cleaned at: $PROFILE"
}

# ═══════════════════════════════════════════════════════════════════
#  MENU
# ═══════════════════════════════════════════════════════════════════

function Show-Menu {
    Clear-Host
    Write-Color @"

  █████╗ ███╗   ██╗██╗███╗   ███╗███████╗    ████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗
 ██╔══██╗████╗  ██║██║████╗ ████║██╔════╝    ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║
 ███████║██╔██╗ ██║██║██╔████╔██║█████╗         ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║
 ██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══╝         ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║
 ██║  ██║██║ ╚████║██║██║ ╚═╝ ██║███████╗       ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗
 ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚══════╝       ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝

"@ "Magenta"

    Write-Color "  CHOOSE YOUR ANIME TERMINAL THEME:" "Yellow"
    Write-Color "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" "DarkGray"
    Write-Color ""

    $keys = @("dragonballz","scifi","fantasy","romcom","sliceoflife","minimal","mecha")
    $nums = @("1","2","3","4","5","6","7")

    for ($i = 0; $i -lt $keys.Length; $i++) {
        $t = $THEMES[$keys[$i]]
        Write-Color "  [$($nums[$i])] " "Cyan" -NoNewLine
        Write-Color "$($t.Emoji) " "Yellow" -NoNewLine
        Write-Color "$($t.Name)" "White" -NoNewLine
        Write-Color " — $($t.Description)" "DarkGray"
    }

    Write-Color ""
    Write-Color "  [Q] Quit without installing" "DarkGray"
    Write-Color ""
    Write-Color "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" "DarkGray"
    Write-Color ""

    $choice = Read-Host "  Enter number (1-7)"
    Write-Color ""

    switch ($choice) {
        "1" { return "dragonballz" }
        "2" { return "scifi" }
        "3" { return "fantasy" }
        "4" { return "romcom" }
        "5" { return "sliceoflife" }
        "6" { return "minimal" }
        "7" { return "mecha" }
        default { return "" }
    }
}

# ═══════════════════════════════════════════════════════════════════
#  UNINSTALL
# ═══════════════════════════════════════════════════════════════════

function Invoke-Uninstall {
    Write-Color "`n  Removing anime-terminal themes..." "Yellow"
    if (Test-Path $PROFILE) {
        $content = Get-Content $PROFILE -Raw
        $content = $content -replace "(?s)# \[ANIME-TERMINAL\].*?# \[/ANIME-TERMINAL\]", ""
        $content.Trim() | Set-Content $PROFILE -Encoding UTF8
        Write-OK "Removed OMP config from PowerShell profile."
    }
    if ($env:POSH_THEMES_PATH) {
        Get-ChildItem "$env:POSH_THEMES_PATH\anime-*.omp.json" -ErrorAction SilentlyContinue | Remove-Item -Force
        Write-OK "Removed anime theme JSON files."
    }
    Write-Color "`n  Done! Restart your terminal." "Green"
}

# ═══════════════════════════════════════════════════════════════════
#  MAIN
# ═══════════════════════════════════════════════════════════════════

if ($Uninstall) { Invoke-Uninstall; exit 0 }

# Pick theme
$selectedKey = $Theme
if (-not $selectedKey) { $selectedKey = Show-Menu }
if (-not $selectedKey -or -not $THEMES.ContainsKey($selectedKey)) {
    Write-Color "  Cancelled. No changes made." "DarkGray"
    exit 0
}

$selectedTheme = $THEMES[$selectedKey]

# Show theme banner
Clear-Host
Write-Color ""
Write-Banner $selectedTheme.AsciiArt "Cyan"
Write-Color ""
Write-Color "  Installing: $($selectedTheme.Emoji) $($selectedTheme.Name)" "Yellow"
Write-Color "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" "DarkGray"
Write-Color ""

# Step 1 — Oh-My-Posh
Install-OhMyPosh

# Step 2 — Fastfetch (System Info)
Install-Fastfetch

# Step 3 — Nerd Font
Install-NerdFont

# Step 3 — Write theme JSON
$themeFile = Set-OmpTheme -ThemeKey $selectedKey -ThemeDef $selectedTheme

# Step 4 — Update PS Profile
Update-PSProfile -ThemeFile $themeFile -AsciiArt $selectedTheme.AsciiArt

# Step 5 — Windows Terminal colors
Update-WTSettings -SchemeName $selectedTheme.WTScheme -Colors $selectedTheme.WTColors

# Done!
Write-Color ""
Write-Color "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" "DarkGray"
Write-Color ""
Write-Color "  ✔  $($selectedTheme.Emoji) $($selectedTheme.Name) installed!" "Green"
Write-Color ""
Write-Color "  NEXT STEPS:" "Yellow"
Write-Color "  1. Restart Windows Terminal (or run: . `$PROFILE)" "White"
Write-Color "  2. In Settings → Profiles → Appearance → Font:" "White"
Write-Color "     Set font to: CaskaydiaCove Nerd Font  (or Meslo LGM NF)" "Cyan"
Write-Color "  3. The color scheme '$($selectedTheme.WTScheme)' has been auto-applied." "White"
Write-Color ""
Write-Color "  Switch themes anytime:" "Yellow"
Write-Color "  irm $REPO_URL/install.ps1 | iex" "Cyan"
Write-Color ""
Write-Color "  To uninstall:" "Yellow"
Write-Color "  irm $REPO_URL/install.ps1 -OutFile i.ps1; .\i.ps1 -Uninstall" "Cyan"
Write-Color ""
