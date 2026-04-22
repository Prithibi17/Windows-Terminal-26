# ⚡ Windows-Terminal-26: Anime Terminal Themes

> Seven anime-inspired terminal themes for Oh-My-Posh + Windows Terminal.  
> One command. Zero config. **System info (fastfetch) included.**
> Full anime power.

---

## 🚀 One-Command Install

Open **PowerShell** or **Windows Terminal** and paste:

```powershell
irm https://raw.githubusercontent.com/Prithibi17/Windows-Terminal-26/main/install.ps1 | iex
```

An interactive menu will appear — pick your theme and everything installs automatically!

---

## ⚡ Install a Specific Theme Directly

Skip the menu with the `-Theme` flag:

```powershell
# Dragon Ball Z
irm https://raw.githubusercontent.com/Prithibi17/Windows-Terminal-26/main/install.ps1 -OutFile i.ps1; .\i.ps1 -Theme dragonballz

# Sci-Fi / Cyberpunk
irm https://raw.githubusercontent.com/Prithibi17/Windows-Terminal-26/main/install.ps1 -OutFile i.ps1; .\i.ps1 -Theme scifi

# Fantasy / Dungeon
irm https://raw.githubusercontent.com/Prithibi17/Windows-Terminal-26/main/install.ps1 -OutFile i.ps1; .\i.ps1 -Theme fantasy

# Rom-Com / Kawaii
irm https://raw.githubusercontent.com/Prithibi17/Windows-Terminal-26/main/install.ps1 -OutFile i.ps1; .\i.ps1 -Theme romcom

# Slice of Life / Cozy
irm https://raw.githubusercontent.com/Prithibi17/Windows-Terminal-26/main/install.ps1 -OutFile i.ps1; .\i.ps1 -Theme sliceoflife

# Minimal / Zen
irm https://raw.githubusercontent.com/Prithibi17/Windows-Terminal-26/main/install.ps1 -OutFile i.ps1; .\i.ps1 -Theme minimal

# Mecha / Evangelion
irm https://raw.githubusercontent.com/Prithibi17/Windows-Terminal-26/main/install.ps1 -OutFile i.ps1; .\i.ps1 -Theme mecha
```

---

## 🎨 The Seven Themes

| # | Key | Name | Inspiration | Colors |
|---|-----|------|-------------|--------|
| 1 | `dragonballz` | ⚡ Dragon Ball Z | DBZ | Orange · Gold · Saiyan Blue |
| 2 | `scifi` | ◈ Sci-Fi: Ghost Protocol | Ghost in the Shell · Psycho-Pass | Cyan · Matrix Green · Electric Blue |
| 3 | `fantasy` | ⚔ Fantasy: Dungeon Quest | Overlord · SAO · Re:Zero | Deep Purple · Arcane Gold · Emerald |
| 4 | `romcom` | ♡ Rom-Com: Kawaii Mode | Kaguya-sama · Toradora | Deep Pink · Sakura · Cream |
| 5 | `sliceoflife` | ☕ Slice of Life: Cozy Café | K-On! · Barakamon · Yotsuba | Sage Green · Coffee Brown · Sky Blue |
| 6 | `minimal` | · Minimal: Zen / Wabi-Sabi | Japanese minimalism (侘び寂び) | Black · Off-White · Red accent |
| 7 | `mecha` | ▲ Mecha: NERV / EVA Unit-01 | Neon Genesis Evangelion | Purple · Orange · MAGI Green |

---

## 📋 What Gets Installed

1. **Oh-My-Posh** — prompt engine (via `winget`)
2. **Fastfetch** — system info display (via `winget`)
3. **CaskaydiaCove Nerd Font** — for icons and powerline symbols
4. **Theme JSON** — saved to `%LOCALAPPDATA%\Programs\oh-my-posh\themes\`
5. **PowerShell Profile** — updated with the theme loader and auto-fetch
6. **Windows Terminal Color Scheme** — auto-applied to `settings.json`

---

## 🔧 After Installing

> **Required:** Set your Windows Terminal font to `CaskaydiaCove Nerd Font`

1. Open Windows Terminal → `Settings` (Ctrl+,)
2. Go to **Profiles → Defaults → Appearance**
3. Change **Font face** to: `CaskaydiaCove Nerd Font`
4. Save and restart the terminal

---

## 🔄 Switch Themes

Run the installer again — it will safely replace your previous theme:

```powershell
irm https://raw.githubusercontent.com/Prithibi17/Windows-Terminal-26/main/install.ps1 | iex
```

---

## 🗑 Uninstall

```powershell
irm https://raw.githubusercontent.com/Prithibi17/Windows-Terminal-26/main/install.ps1 -OutFile i.ps1; .\i.ps1 -Uninstall
```

This removes the OMP config from your profile and deletes theme JSON files. Oh-My-Posh itself remains.

---

## 📁 File Structure

```
Windows-Terminal-26/
├── install.ps1           ← One-liner installer
├── README.md             ← Documentation
├── color-schemes.json    ← All 7 color schemes (manual)
├── dragonballz.omp.json  ← OMP theme files
├── fantasy.omp.json
├── mecha.omp.json
├── minimal.omp.json
├── romcom.omp.json
├── scifi.omp.json
└── sliceoflife.omp.json
```

> **Note:** The `install.ps1` has all 7 themes embedded inside it, so it works standalone without downloading additional files. The `themes/` folder files are provided for manual use or reference.

---

## ❓ Troubleshooting

**Icons look like boxes/squares?**  
→ Font isn't set correctly. Make sure Windows Terminal is using `CaskaydiaCove Nerd Font`.

**`oh-my-posh` not found after install?**  
→ Restart your terminal session. If still missing, check that `winget` is available on your system (Windows 10 21H2+ or Windows 11).

**Profile not loading?**  
→ Run: `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` then restart terminal.

**Windows Terminal not found?**  
→ Install it from the Microsoft Store or: `winget install Microsoft.WindowsTerminal`

---

## 🙏 Credits

- [Oh My Posh](https://ohmyposh.dev/) by Jan De Dobbeleer
- [Nerd Fonts](https://www.nerdfonts.com/) for the icon glyphs
- Anime series: Dragon Ball Z, Ghost in the Shell, Overlord, Kaguya-sama, K-On!, Neon Genesis Evangelion

---

⭐ **Star this repo if you found it useful!**
