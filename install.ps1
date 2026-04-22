# Anime Terminal Themes Installer - Version 1.0.4 (Elite Edition)
#Requires -Version 5.1
<#
.SYNOPSIS
    Anime Terminal Themes Installer for Windows 10/11
.DESCRIPTION
    Installs anime-themed Oh-My-Posh prompts + Windows Terminal color schemes.
    One command. Zero hassle. Maximum anime power.
.PARAMETER Theme
    Skip the menu and install a specific theme directly.
    Values: dragonballz | scifi | fantasy | romcom | sliceoflife | minimal | mecha | naruto | onepiece | jujutsu | demonslayer | sololeveling
.PARAMETER Uninstall
    Remove all anime terminal themes and restore defaults.
.EXAMPLE
    irm https://raw.githubusercontent.com/Prithibi17/Windows-Terminal-26/main/install.ps1 | iex
#>

param(
    [Parameter()]
    [ValidateSet("dragonballz","scifi","fantasy","romcom","sliceoflife","minimal","mecha","naruto","onepiece","jujutsu","demonslayer","sololeveling","")]
    [string]$Theme = "",

    [switch]$Uninstall
)

# ═══════════════════════════════════════════════════════════════════
#  CONFIG
# ═══════════════════════════════════════════════════════════════════
$REPO_URL   = "https://raw.githubusercontent.com/Prithibi17/Windows-Terminal-26/main"
$FONT_NAME  = "CascadiaCode"
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

# ═══════════════════════════════════════════════════════════════════
#  THEME DEFINITIONS
# ═══════════════════════════════════════════════════════════════════
$THEMES = @{

    dragonballz = @{
        Name        = "Dragon Ball Z"
        Emoji       = "⚡"
        Description = "POWER LEVEL: OVER 9000! Orange fire, Saiyan blue & Super Saiyan gold."
        BgColor     = "#0A0A1A"
        FgColor     = "#FFD700"
        WTScheme    = "AnimeDBZ"
        BigName     = @'
  ██████╗ ██████╗ ███████╗ ██████╗  ██████╗ ███╗   ██╗    ██████╗  █████╗ ██╗     ██╗      ███████╗
  ██╔══██╗██╔══██╗██╔════╝██╔════╝ ██╔═══██╗████╗  ██║    ██╔══██╗██╔══██╗██║     ██║      ╚══███╔╝
  ██║  ██║██████╔╝█████╗  ██║  ███╗██║   ██║██╔██╗ ██║    ██████╔╝███████║██║     ██║        ███╔╝ 
  ██║  ██║██╔══██╗██╔══╝  ██║   ██║██║   ██║██║╚██╗██║    ██╔══██╗██╔══██║██║     ██║       ███╔╝  
  ██████╔╝██║  ██║███████╗╚██████╔╝╚██████╔╝██║ ╚████║    ██████╔╝██║  ██║███████╗███████╗███████╗
  ╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
'@
        SubTitle    = "                ⚡ [ POWER LEVEL: OVER 9000 ] [ SAIYAN: READY ] ⚡"
        AsciiArt    = ""
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "console_title_template": "⚡ {{ .Shell }} :: {{ .Folder }}",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        { "type": "text", "style": "diamond", "leading_diamond": "\ue0b6", "trailing_diamond": "\ue0b0", "foreground": "#FFFFFF", "background": "#FF6B00", "template": " ⚡ SAIYAN " },
        { "type": "os", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#FF6B00", "background": "#1A1A2E", "properties": { "windows": "\uf17a " } },
        { "type": "path", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#1A1A2E", "background": "#FFD700", "properties": { "style": "folder", "folder_separator_icon": " 龍 ", "folder_icon": "\uf07b" } },
        { "type": "git", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#FFFFFF", "background": "#1E3A8A", "properties": { "branch_icon": "⚡ ", "fetch_status": true } }
      ]
    },
    { "type": "prompt", "alignment": "left", "segments": [ { "type": "text", "style": "plain", "foreground": "#FF6B00", "template": "❯❯❯ " } ] }
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
        Description = "Cyberpunk cyan/matrix green. Hack the planet."
        BgColor     = "#000D1A"
        FgColor     = "#00FFFF"
        WTScheme    = "AnimeSciFi"
        BigName     = @'
   ██████╗ ██╗  ██╗ ██████╗ ███████╗████████╗    ██████╗ ██████╗  ██████╗ ████████╗ ██████╗  ██████╗ ██████╗ ██╗     
  ██╔════╝ ██║  ██║██╔═══██╗██╔════╝╚══██╔══╝    ██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝██╔═══██╗██╔════╝██╔═══██╗██║     
  ██║  ███╗███████║██║   ██║███████╗   ██║       ██████╔╝██████╔╝██║   ██║   ██║   ██║   ██║██║     ██║   ██║██║     
  ██║   ██║██╔══██║██║   ██║╚════██║   ██║       ██╔═══╝ ██╔══██╗██║   ██║   ██║   ██║   ██║██║     ██║   ██║██║     
  ╚██████╔╝██║  ██║╚██████╔╝███████║   ██║       ██║     ██║  ██║╚██████╔╝   ██║   ╚██████╔╝╚██████╗╚██████╔╝███████╗
   ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝       ╚═╝     ╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝
'@
        SubTitle    = "                    [ SYS://ONLINE ] [ HACK: READY ] ◈"
        AsciiArt    = ""
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        { "type": "text", "style": "diamond", "leading_diamond": "\ue0b6", "trailing_diamond": "\ue0b4", "foreground": "#00FFFF", "background": "#001122", "template": " ◈ SYS " },
        { "type": "os", "style": "diamond", "leading_diamond": "\ue0b6", "trailing_diamond": "\ue0b4", "foreground": "#00FFFF", "background": "#002244", "properties": { "windows": "\uf17a " } },
        { "type": "path", "style": "diamond", "leading_diamond": "\ue0b6", "trailing_diamond": "\ue0b4", "foreground": "#00FF41", "background": "#001A33", "properties": { "style": "full", "folder_separator_icon": " ▸ " } },
        { "type": "git", "style": "diamond", "leading_diamond": "\ue0b6", "trailing_diamond": "\ue0b4", "foreground": "#00FFFF", "background": "#001A2E", "properties": { "branch_icon": "◈ ", "fetch_status": true } }
      ]
    },
    { "type": "prompt", "alignment": "left", "segments": [ { "type": "text", "style": "plain", "foreground": "#00FFFF", "template": "▸▸ " } ] }
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
        Description = "Deep dungeon purple, arcane gold & emerald."
        BgColor     = "#0D0520"
        FgColor     = "#E8D5FF"
        WTScheme    = "AnimeFantasy"
        BigName     = @'
  ██████╗ ██╗   ██╗███╗   ██╗ ██████╗ ███████╗ ██████╗ ███╗   ██╗     ██████╗ ██╗   ██╗███████╗███████╗████████╗
  ██╔══██╗██║   ██║████╗  ██║██╔════╝ ██╔════╝██╔═══██╗████╗  ██║    ██╔═══██╗██║   ██║██╔════╝██╔════╝╚══██╔══╝
  ██║  ██║██║   ██║██╔██╗ ██║██║  ███╗█████╗  ██║   ██║██╔██╗ ██║    ██║   ██║██║   ██║█████╗  ███████╗   ██║   
  ██║  ██║██║   ██║██║╚██╗██║██║   ██║██╔══╝  ██║   ██║██║╚██╗██║    ██║ ▄█ ██║██║   ██║██╔══╝  ╚════██║   ██║   
  ██████╔╝╚██████╔╝██║ ╚████║╚██████╔╝███████╗╚██████╔╝██║ ╚████║    ╚██████╔╝╚██████╔╝███████╗███████║   ██║   
  ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝     ╚═══▀▀╝  ╚═════╝ ╚══════╝╚══════╝   ╚═╝   
'@
        SubTitle    = "               ⚔ [ Enter the Dungeon — Quest Active ] ⚔"
        AsciiArt    = ""
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        { "type": "text", "style": "diamond", "leading_diamond": "\ue0b6", "trailing_diamond": "\ue0b0", "foreground": "#FFD700", "background": "#2D1B69", "template": " ⚔ HERO " },
        { "type": "path", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#FFD700", "background": "#3D1A78", "properties": { "style": "folder", "folder_separator_icon": " ✦ " } },
        { "type": "git", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#1A0A3C", "background": "#00C853", "properties": { "branch_icon": "✦ ", "fetch_status": true } }
      ]
    },
    { "type": "prompt", "alignment": "left", "segments": [ { "type": "text", "style": "plain", "foreground": "#FFD700", "template": "⚔ ❯ " } ] }
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
        Description = "Deep pink hearts & sakura blossoms."
        BgColor     = "#1A000D"
        FgColor     = "#FFB6C1"
        WTScheme    = "AnimeRomCom"
        BigName     = @'
  ██╗  ██╗ █████╗ ██╗    ██╗ █████╗ ██╗██╗    ███╗   ███╗ ██████╗ ██████╗ ███████╗
  ██║ ██╔╝██╔══██╗██║    ██║██╔══██╗██║██║    ████╗ ████║██╔═══██╗██╔══██╗██╔════╝
  █████╔╝ ███████║██║ █╗ ██║███████║██║██║    ██╔████╔██║██║   ██║██║  ██║█████╗  
  ██╔═██╗ ██╔══██║██║███╗██║██╔══██║██║██║    ██║╚██╔╝██║██║   ██║██║  ██║██╔══╝  
  ██║  ██╗██║  ██║╚███╔███╔╝██║  ██║██║██║    ██║ ╚═╝ ██║╚██████╔╝██████╔╝███████╗
  ╚═╝  ╚═╝╚═╝  ╚═╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝╚═╝    ╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝
'@
        SubTitle    = "                   ♡ [ Doki Doki Terminal — Love Ready ] ♡"
        AsciiArt    = ""
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        { "type": "text", "style": "diamond", "leading_diamond": "\ue0b6", "trailing_diamond": "\ue0b0", "foreground": "#FFFFFF", "background": "#FF1493", "template": " ♡ KAWAII " },
        { "type": "path", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#4A0028", "background": "#FF85A1", "properties": { "style": "folder", "folder_separator_icon": " ✿ " } },
        { "type": "git", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#FFFFFF", "background": "#C71585", "properties": { "branch_icon": "♡ ", "fetch_status": true } }
      ]
    },
    { "type": "prompt", "alignment": "left", "segments": [ { "type": "text", "style": "plain", "foreground": "#FF69B4", "template": "♡ ❯ " } ] }
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
        Description = "Warm sage greens & coffee browns."
        BgColor     = "#0D0A07"
        FgColor     = "#FFFACD"
        WTScheme    = "AnimeSliceOfLife"
        BigName     = @'
   ██████╗ ██████╗ ███████╗██╗   ██╗     ██████╗ █████╗ ███████╗███████╗
  ██╔════╝██╔═══██╗╚══███╔╝╚██╗ ██╔╝    ██╔════╝██╔══██╗██╔════╝██╔════╝
  ██║     ██║   ██║  ███╔╝  ╚████╔╝     ██║     ███████║█████╗  █████╗  
  ██║     ██║   ██║ ███╔╝    ╚██╔╝      ██║     ██╔══██║██╔══╝  ██╔══╝  
  ╚██████╗╚██████╔╝███████╗   ██║       ╚██████╗██║  ██║██║     ██║     
   ╚═════╝ ╚═════╝ ╚══════╝   ╚═╝        ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝     
'@
        SubTitle    = "                   ☕ [ Cozy Cafe — Just Vibing ] ☕"
        AsciiArt    = ""
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        { "type": "text", "style": "diamond", "leading_diamond": "\ue0b6", "trailing_diamond": "\ue0b0", "foreground": "#FFFACD", "background": "#6F4E37", "template": " ☕ COZY " },
        { "type": "path", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#3E2723", "background": "#87A96B", "properties": { "style": "folder", "folder_separator_icon": " ♪ " } },
        { "type": "git", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#FFFACD", "background": "#4A7C59", "properties": { "branch_icon": "♪ ", "fetch_status": true } }
      ]
    },
    { "type": "prompt", "alignment": "left", "segments": [ { "type": "text", "style": "plain", "foreground": "#87A96B", "template": "~ ❯ " } ] }
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
        Description = "Black, white & one red accent."
        BgColor     = "#0F0F0F"
        FgColor     = "#E8E8E8"
        WTScheme    = "AnimeMinimal"
        BigName     = @'
  ███╗   ███╗██╗███╗   ██╗██╗███╗   ███╗ █████╗ ██╗     
  ████╗ ████║██║████╗  ██║██║████╗ ████║██╔══██╗██║     
  ██╔████╔██║██║██╔██╗ ██║██║██╔████╔██║███████║██║     
  ██║╚██╔╝██║██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║██║     
  ██║ ╚═╝ ██║██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║███████╗
  ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝
'@
        SubTitle    = "                [ ZEN: ACTIVE ] [ LESS IS MORE ] ·"
        AsciiArt    = ""
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        { "type": "path", "style": "diamond", "leading_diamond": "[", "trailing_diamond": "]", "foreground": "#E8E8E8", "background": "transparent", "properties": { "style": "folder", "folder_separator_icon": "/" } },
        { "type": "git", "style": "plain", "foreground": "#CC0000", "properties": { "branch_icon": "", "fetch_status": true } }
      ]
    },
    { "type": "prompt", "alignment": "left", "segments": [ { "type": "exit", "style": "plain", "foreground": "#CC0000", "foreground_templates": ["{{ if eq .Code 0 }}#E8E8E8{{ end }}"], "template": "❯ " } ] }
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
        Description = "Purple/orange/green EVA colors."
        BgColor     = "#080808"
        FgColor     = "#00FF00"
        WTScheme    = "AnimeMecha"
        BigName     = @'
  ███╗   ███╗███████╗ ██████╗██╗  ██╗ █████╗ 
  ████╗ ████║██╔════╝██╔════╝██║  ██║██╔══██╗
  ██╔████╔██║█████╗  ██║     ███████║███████║
  ██║╚██╔╝██║██╔══╝  ██║     ██╔══██║██╔══██╗
  ██║ ╚═╝ ██║███████╗╚██████╗██║  ██║██║  ██║
  ╚═╝     ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝
'@
        SubTitle    = "          ▲ [ MAGI SYSTEM: ONLINE ] [ SYNC: 100% ] ▲"
        AsciiArt    = ""
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        { "type": "text", "style": "diamond", "leading_diamond": "\ue0b6", "trailing_diamond": "\ue0b0", "foreground": "#FF4500", "background": "#1A0000", "template": " ▲ NERV " },
        { "type": "path", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#FF4500", "background": "#150000", "properties": { "style": "folder", "folder_separator_icon": " // " } },
        { "type": "git", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#FFFFFF", "background": "#4B0082", "properties": { "branch_icon": "▲ ", "fetch_status": true } }
      ]
    },
    { "type": "prompt", "alignment": "left", "segments": [ { "type": "text", "style": "plain", "foreground": "#00FF00", "template": "▲ ❯ " } ] }
  ],
  "final_space": true,
  "version": 2
}
'@
        WTColors = @{
            background="#080808"; foreground="#00FF00"; cursorColor="#FF4500"
            black="#080808"; blue="#4B0082"; brightBlack="#1A1A1A"; brightBlue="#8A2BE2"
            brightCyan="#00FFFF"; brightGreen="#00FF00"; brightPurple="#FF00FF"; brightRed="#FF4500"
            brightWhite="#FFFFFF"; brightYellow="#FFFF00"; cyan="#008080"; green="#00FF00"
            purple="#800080"; red="#FF0000"; white="#C0C0C0"; yellow="#FFA500"
        }
    }

    naruto = @{
        Name        = "Shinobi: Hidden Leaf"
        Emoji       = "🍥"
        Description = "Will of Fire. Orange fire & rasengan blue."
        BgColor     = "#0F0F0F"
        FgColor     = "#FF6600"
        WTScheme    = "AnimeNaruto"
        BigName     = @'
  ███╗   ██╗ █████╗ ██████╗ ██╗   ██╗████████╗ ██████╗ 
  ████╗  ██║██╔══██╗██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗
  ██╔██╗ ██║███████║██████╔╝██║   ██║   ██║   ██║   ██║
  ██║╚██╗██║██╔══██║██╔══██╗██║   ██║   ██║   ██║   ██║
  ██║ ╚████║██║  ██║██║  ██║╚██████╔╝   ██║   ╚██████╔╝
  ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ 
'@
        SubTitle    = "                   🍥 [ WILL OF FIRE ] [ BELIEVE IT! ] 🍥"
        AsciiArt    = ""
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        { "type": "text", "style": "diamond", "leading_diamond": "\ue0b6", "trailing_diamond": "\ue0b0", "foreground": "#FFFFFF", "background": "#FF6600", "template": " 🍥 HOKAGE " },
        { "type": "path", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#FFFFFF", "background": "#0066FF", "properties": { "style": "folder", "folder_separator_icon": " 🍥 " } },
        { "type": "git", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#FFFFFF", "background": "#FF6600", "properties": { "branch_icon": "🍥 ", "fetch_status": true } }
      ]
    },
    { "type": "prompt", "alignment": "left", "segments": [ { "type": "text", "style": "plain", "foreground": "#FF6600", "template": "🍥 ❯ " } ] }
  ],
  "final_space": true,
  "version": 2
}
'@
        WTColors = @{
            background="#0F0F0F"; foreground="#FF6600"; cursorColor="#0066FF"
            black="#0F0F0F"; blue="#0066FF"; brightBlack="#333333"; brightBlue="#3399FF"
            brightCyan="#FFCC00"; brightGreen="#00FF00"; brightPurple="#FF00FF"; brightRed="#FF4400"
            brightWhite="#FFFFFF"; brightYellow="#FFCC00"; cyan="#00CCCC"; green="#009900"
            purple="#9900CC"; red="#FF6600"; white="#E0E0E0"; yellow="#FF9900"
        }
    }

    onepiece = @{
        Name        = "Pirate: Grand Line"
        Emoji       = "👒"
        Description = "Pirate red & straw-hat yellow."
        BgColor     = "#000510"
        FgColor     = "#FF0000"
        WTScheme    = "AnimeOnePiece"
        BigName     = @'
   ██████╗ ███╗   ██╗███████╗    ██████╗ ██╗███████╗ ██████╗███████╗
  ██╔═══██╗████╗  ██║██╔════╝    ██╔══██╗██║██╔════╝██╔════╝██╔════╝
  ██║   ██║██╔██╗ ██║█████╗      ██████╔╝██║█████╗  ██║     █████╗  
  ██║   ██║██║╚██╗██║██╔══╝      ██╔═══╝ ██║██╔══╝  ██║     ██╔══╝  
  ╚██████╔╝██║ ╚████║███████╗    ██║     ██║███████╗╚██████╗███████╗
   ╚═════╝ ╚═╝  ╚═══╝╚══════╝    ╚═╝     ╚═╝╚══════╝ ╚═════╝╚══════╝
'@
        SubTitle    = "           👒 [ GRAND LINE ] [ KING OF THE PIRATES ] 👒"
        AsciiArt    = ""
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        { "type": "text", "style": "diamond", "leading_diamond": "\ue0b6", "trailing_diamond": "\ue0b0", "foreground": "#FFFFFF", "background": "#FF0000", "template": " 👒 NAKAMA " },
        { "type": "path", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#000000", "background": "#FFCC00", "properties": { "style": "folder", "folder_separator_icon": " ☠ " } },
        { "type": "git", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#FFFFFF", "background": "#0000FF", "properties": { "branch_icon": "⚓ ", "fetch_status": true } }
      ]
    },
    { "type": "prompt", "alignment": "left", "segments": [ { "type": "text", "style": "plain", "foreground": "#FFCC00", "template": "👒 ❯ " } ] }
  ],
  "final_space": true,
  "version": 2
}
'@
        WTColors = @{
            background="#000510"; foreground="#FFCC00"; cursorColor="#FF0000"
            black="#000510"; blue="#0000FF"; brightBlack="#333333"; brightBlue="#3333FF"
            brightCyan="#00FFFF"; brightGreen="#00FF00"; brightPurple="#FF00FF"; brightRed="#FF0000"
            brightWhite="#FFFFFF"; brightYellow="#FFFF00"; cyan="#00CCCC"; green="#009900"
            purple="#9900CC"; red="#FF0000"; white="#E0E0E0"; yellow="#FFCC00"
        }
    }

    jujutsu = @{
        Name        = "Cursed: Domain Expansion"
        Emoji       = "👹"
        Description = "Dark navy & crimson curse energy."
        BgColor     = "#0A0A12"
        FgColor     = "#E94560"
        WTScheme    = "AnimeJujutsu"
        BigName     = @'
        ██╗██╗  ██╗
        ██║██║ ██╔╝
        ██║█████╔╝ 
   ██   ██║██╔═██╗ 
   ╚█████╔╝██║  ██╗
    ╚════╝ ╚═╝  ╚═╝
'@
        SubTitle    = "               👹 [ DOMAIN EXPANSION — ENERGY READY ] 👹"
        AsciiArt    = ""
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        { "type": "text", "style": "diamond", "leading_diamond": "\ue0b6", "trailing_diamond": "\ue0b0", "foreground": "#FFFFFF", "background": "#E94560", "template": " 👹 SORCERER " },
        { "type": "path", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#E94560", "background": "#16213E", "properties": { "style": "folder", "folder_separator_icon": " ☠ " } },
        { "type": "git", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#FFFFFF", "background": "#0F3460", "properties": { "branch_icon": "👹 ", "fetch_status": true } }
      ]
    },
    { "type": "prompt", "alignment": "left", "segments": [ { "type": "text", "style": "plain", "foreground": "#E94560", "template": "👹 ❯ " } ] }
  ],
  "final_space": true,
  "version": 2
}
'@
        WTColors = @{
            background="#0A0A12"; foreground="#E94560"; cursorColor="#FFFFFF"
            black="#0A0A12"; blue="#0F3460"; brightBlack="#16213E"; brightBlue="#1A1A2E"
            brightCyan="#00FFFF"; brightGreen="#00FF00"; brightPurple="#FF00FF"; brightRed="#FF0044"
            brightWhite="#FFFFFF"; brightYellow="#FFFF00"; cyan="#00CCCC"; green="#009900"
            purple="#9900CC"; red="#E94560"; white="#E0E0E0"; yellow="#FFCC00"
        }
    }

    demonslayer = @{
        Name        = "Slayer: Hashira"
        Emoji       = "⚔️"
        Description = "Water breathing green & nichirin pink."
        BgColor     = "#081C15"
        FgColor     = "#16A085"
        WTScheme    = "AnimeDemonSlayer"
        BigName     = @'
  ██████╗ ███████╗███╗   ███╗ ██████╗ ███╗   ██╗    ███████╗██╗      █████╗ ██╗   ██╗███████╗██████╗ 
  ██╔══██╗██╔════╝████╗ ████║██╔═══██╗████╗  ██║    ██╔════╝██║     ██╔══██╗╚██╗ ██╔╝██╔════╝██╔══██╗
  ██║  ██║█████╗  ██╔████╔██║██║   ██║██╔██╗ ██║    ███████╗██║     ███████║ ╚████╔╝ █████╗  ██████╔╝
  ██║  ██║██╔══╝  ██║╚██╔╝██║██║   ██║██║╚██╗██║    ╚════██║██║     ██╔══██║  ╚██╔╝  ██╔══╝  ██╔══██╗
  ██████╔╝███████╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║    ███████║███████╗██║  ██║   ██║   ███████╗██║  ██║
  ╚═════╝ ╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
'@
        SubTitle    = "                  ⚔️ [ HASHIRA STYLE — SLAYER READY ] ⚔️"
        AsciiArt    = ""
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        { "type": "text", "style": "diamond", "leading_diamond": "\ue0b6", "trailing_diamond": "\ue0b0", "foreground": "#FFFFFF", "background": "#16A085", "template": " ⚔️ SLAYER " },
        { "type": "path", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#16A085", "background": "#D4AC0D", "properties": { "style": "folder", "folder_separator_icon": " ⚔️ " } },
        { "type": "git", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#FFFFFF", "background": "#F1948A", "properties": { "branch_icon": "⚔️ ", "fetch_status": true } }
      ]
    },
    { "type": "prompt", "alignment": "left", "segments": [ { "type": "text", "style": "plain", "foreground": "#16A085", "template": "⚔️ ❯ " } ] }
  ],
  "final_space": true,
  "version": 2
}
'@
        WTColors = @{
            background="#081C15"; foreground="#16A085"; cursorColor="#F1948A"
            black="#081C15"; blue="#117A65"; brightBlack="#145A32"; brightBlue="#1ABC9C"
            brightCyan="#A2D9CE"; brightGreen="#52BE80"; brightPurple="#D2B4DE"; brightRed="#EC7063"
            brightWhite="#F7F9F9"; brightYellow="#F7DC6F"; cyan="#45B39D"; green="#27AE60"
            purple="#8E44AD"; red="#C0392B"; white="#EAEDED"; yellow="#D4AC0D"
        }
    }

    sololeveling = @{
        Name        = "Monarch: Shadow"
        Emoji       = "🕶️"
        Description = "Deep shadow black & mana neon blue."
        BgColor     = "#000000"
        FgColor     = "#3498DB"
        WTScheme    = "AnimeSoloLeveling"
        BigName     = @'
  ███████╗ ██████╗ ██╗      ██████╗     ██╗     ███████╗██╗   ██╗███████╗██╗     ██╗███╗   ██╗ ██████╗ 
  ██╔════╝██╔═══██╗██║     ██╔═══██╗    ██║     ██╔════╝██║   ██║██╔════╝██║     ██║████╗  ██║██╔════╝ 
  ███████╗██║   ██║██║     ██║   ██║    ██║     █████╗  ██║   ██║█████╗  ██║     ██║██╔██╗ ██║██║  ███╗
  ╚════██║██║   ██║██║     ██║   ██║    ██║     ██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║██║╚██╗██║██║   ██║
  ███████║╚██████╔╝███████╗╚██████╔╝    ███████╗███████╗ ╚████╔╝ ███████╗███████╗██║██║ ╚████║╚██████╔╝
  ╚══════╝ ╚═════╝ ╚══════╝╚═════╝     ╚══════╝╚══════╝  ╚═══╝  ╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
'@
        SubTitle    = "                  🕶️ [ SHADOW MONARCH — ARISE READY ] 🕶️"
        AsciiArt    = ""
        OmpJson = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        { "type": "text", "style": "diamond", "leading_diamond": "\ue0b6", "trailing_diamond": "\ue0b0", "foreground": "#FFFFFF", "background": "#000000", "template": " 🕶️ ARISE " },
        { "type": "path", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#000000", "background": "#3498DB", "properties": { "style": "folder", "folder_separator_icon": " 🕶️ " } },
        { "type": "git", "style": "powerline", "powerline_symbol": "\ue0b0", "foreground": "#FFFFFF", "background": "#9B59B6", "properties": { "branch_icon": "🕶️ ", "fetch_status": true } }
      ]
    },
    { "type": "prompt", "alignment": "left", "segments": [ { "type": "text", "style": "plain", "foreground": "#3498DB", "template": "🕶️ ❯ " } ] }
  ],
  "final_space": true,
  "version": 2
}
'@
        WTColors = @{
            background="#000000"; foreground="#3498DB"; cursorColor="#9B59B6"
            black="#000000"; blue="#2980B9"; brightBlack="#2C3E50"; brightBlue="#3498DB"
            brightCyan="#85C1E9"; brightGreen="#2ECC71"; brightPurple="#AF7AC5"; brightRed="#E74C3C"
            brightWhite="#ECF0F1"; brightYellow="#F1C40F"; cyan="#5DADE2"; green="#27AE60"
            purple="#8E44AD"; red="#C0392B"; white="#BDC3C7"; yellow="#F39C12"
        }
    }
}

# ═══════════════════════════════════════════════════════════════════
#  CORE FUNCTIONS
# ═══════════════════════════════════════════════════════════════════
function Update-WTSettings {
    param([string]$SchemeName, [hashtable]$Colors)
    $settingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
    if (-not (Test-Path $settingsPath)) { return }
    try {
        $json = Get-Content $settingsPath -Raw | ConvertFrom-Json
        if (-not $json.schemes) { $json | Add-Member -MemberType NoteProperty -Name "schemes" -Value @() }
        $existing = $json.schemes | Where-Object { $_.name -eq $SchemeName }
        if ($existing) { $json.schemes = $json.schemes | Where-Object { $_.name -ne $SchemeName } }
        $newScheme = @{ name = $SchemeName }
        $Colors.Keys | ForEach-Object { $newScheme[$_] = $Colors[$_] }
        $json.schemes += $newScheme
        if ($json.profiles.defaults) { $json.profiles.defaults.colorScheme = $SchemeName }
        $json | ConvertTo-Json -Depth 10 | Set-Content $settingsPath
    } catch {}
}

function Set-OmpTheme {
    param([string]$ThemeKey, [hashtable]$ThemeDef)
    $path = Join-Path $HOME ".anime-terminal-$ThemeKey.omp.json"
    $ThemeDef.OmpJson | Set-Content $path
    return $path
}

function Update-PSProfile {
    param([string]$ThemeFile, [string]$BigName, [string]$SubTitle)
    Write-Step "Updating PowerShell profile..."
    $profilePath = $PROFILE
    if (-not (Test-Path (Split-Path $profilePath))) { New-Item -Path (Split-Path $profilePath) -ItemType Directory -Force }
    if (-not (Test-Path $profilePath)) { New-Item -Path $profilePath -ItemType File -Force }
    $marker = "# [ANIME-TERMINAL]"
    $endMarker = "# [/ANIME-TERMINAL]"
    $content = Get-Content $profilePath -Raw
    if ($content -match "(?s)$([regex]::Escape($marker)).*?$([regex]::Escape($endMarker))") {
        $content = $content -replace "(?s)$([regex]::Escape($marker)).*?$([regex]::Escape($endMarker))", ""
    }
    $ompLine = "oh-my-posh init pwsh --config '$ThemeFile' | Invoke-Expression"
    $fetchLine = "if (Get-Command fastfetch -ErrorAction SilentlyContinue) { fastfetch } elseif (Get-Command winfetch -ErrorAction SilentlyContinue) { winfetch }"
    $blockLines = @(
        $marker,
        "if (`$Host.Name -eq 'ConsoleHost') { try { [console]::Clear() } catch {} } else { Clear-Host }",
        "`$themeBanner = @'",
        $BigName,
        "'@",
        "Write-Host `$themeBanner -ForegroundColor Magenta",
        "Write-Host '$SubTitle' -ForegroundColor Cyan",
        $ompLine,
        $fetchLine,
        $endMarker
    )
    $block = $blockLines -join "`n"
    Add-Content -Path $profilePath -Value "`n$block"
}

function Show-Menu {
    Clear-Host
    Write-Color "  ✨ WINDOWS-TERMINAL-26 ✨" "Magenta"
    Write-Color "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" "DarkGray"
    $keys = @("dragonballz","scifi","fantasy","romcom","sliceoflife","minimal","mecha","naruto","onepiece","jujutsu","demonslayer","sololeveling")
    for ($i = 0; $i -lt $keys.Length; $i++) {
        $t = $THEMES[$keys[$i]]
        Write-Color "  $($i+1). $($t.Emoji) $($t.Name)" "Cyan" -NoNewLine
        Write-Color " - $($t.Description)" "Gray"
    }
    Write-Color "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" "DarkGray"
    $choice = Read-Host "  Select Theme (1-12)"
    switch ($choice) {
        "1" { return "dragonballz" }
        "2" { return "scifi" }
        "3" { return "fantasy" }
        "4" { return "romcom" }
        "5" { return "sliceoflife" }
        "6" { return "minimal" }
        "7" { return "mecha" }
        "8" { return "naruto" }
        "9" { return "onepiece" }
        "10" { return "jujutsu" }
        "11" { return "demonslayer" }
        "12" { return "sololeveling" }
        default { return "" }
    }
}

# ═══════════════════════════════════════════════════════════════════
#  MAIN EXECUTION
# ═══════════════════════════════════════════════════════════════════
if ($Uninstall) {
    Write-Step "Uninstalling..."
    $profilePath = $PROFILE
    if (Test-Path $profilePath) {
        $content = Get-Content $profilePath -Raw
        $content = $content -replace "(?s)# \[ANIME-TERMINAL\].*?# \[/ANIME-TERMINAL\]", ""
        $content | Set-Content $profilePath
    }
    Write-OK "Uninstalled. Restart terminal."
    exit
}

$selectedKey = if ($Theme) { $Theme } else { Show-Menu }
if (-not $selectedKey) { Write-Fail "Invalid choice."; exit }
$selectedTheme = $THEMES[$selectedKey]

Write-Step "Installing theme: $($selectedTheme.Name)..."
function Install-App {
    param([string]$PackageId, [string]$Name)
    Write-Step "Checking for $Name..."
    if (Get-Command $PackageId -ErrorAction SilentlyContinue) { return }
    
    try {
        if (Get-Command winget.exe -ErrorAction SilentlyContinue) {
            Write-Step "Installing $Name via Winget..."
            & "winget.exe" install $PackageId -e --accept-package-agreements --accept-source-agreements
        } elseif ($PackageId -eq "JanDeDobbeleer.OhMyPosh") {
            Write-Fail "Winget not found. Please install Oh-My-Posh manually."
        }
    } catch {
        if ($PackageId -eq "JanDeDobbeleer.OhMyPosh") { Write-Fail "Failed to install $Name automatically." }
    }
}

Install-App -PackageId "JanDeDobbeleer.OhMyPosh" -Name "Oh-My-Posh"
Install-App -PackageId "fastfetch" -Name "Fastfetch"

$themeFile = Set-OmpTheme -ThemeKey $selectedKey -ThemeDef $selectedTheme
Update-PSProfile -ThemeFile $themeFile -BigName $selectedTheme.BigName -SubTitle $selectedTheme.SubTitle
Update-WTSettings -SchemeName $selectedTheme.WTScheme -Colors $selectedTheme.WTColors

Write-OK "Installation complete! Restart Windows Terminal to see the magic."
