# ⚡ Windows-Terminal-26: The Ultimate Anime Terminal Experience

<p align="center">
  <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" />
  <img src="https://img.shields.io/badge/Anime-7%20Themes-magenta.svg" />
  <img src="https://img.shields.io/badge/Platform-Windows%2010%2F11-blue.svg" />
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg" />
</p>

> Seven premium, anime-inspired terminal environments for **Oh-My-Posh** + **Windows Terminal**.  
> **One command. Zero configuration. Maximum aesthetic power.**

---

## 📸 Preview the Vibe
Every time you open your terminal, you get:
1.  ✨ **Big Anime Banner**: High-impact ASCII art in your face.
2.  📊 **System Intel**: `fastfetch` stats auto-loaded.
3.  🎨 **Themed Prompts**: Powerline prompts designed for each series.

---

## 🚀 Instant Installation

Open **PowerShell** or **Windows Terminal** and paste this "God-Command":

```powershell
irm https://raw.githubusercontent.com/Prithibi17/Windows-Terminal-26/main/install.ps1 | iex
```

*An interactive menu will appear — pick your destiny and everything installs automatically.*

---

## 🎨 The Collection

| ID | Theme | Inspiration | Color Palette |
|:---:|---|---|---|
| **1** | ⚡ **Dragon Ball Z** | Saiyan Power | `Orange` · `Gold` · `Saiyan Blue` |
| **2** | ◈ **Sci-Fi: Ghost Protocol** | Cyberpunk / GitS | `Cyan` · `Matrix Green` · `Neon` |
| **3** | ⚔ **Fantasy: Dungeon Quest** | Overlord / SAO | `Deep Purple` · `Arcane Gold` |
| **4** | ♡ **Rom-Com: Kawaii Mode** | Kaguya-sama | `Sakura Pink` · `Cream` · `Heart` |
| **5** | ☕ **Slice of Life: Cozy Café** | K-On! / Barakamon | `Sage Green` · `Coffee Brown` |
| **6** | · **Minimal: Zen** | Wabi-Sabi | `Black` · `Off-White` · `Red` |
| **7** | ▲ **Mecha: NERV** | Evangelion | `Purple` · `Orange` · `MAGI Green` |

---

## 📦 What's in the Box?

- 💎 **Oh-My-Posh Core**: The industry-standard prompt engine.
- ⚡ **Fastfetch**: Blazing fast system info display.
- 🔡 **CaskaydiaCove Nerd Font**: The perfect font for icons and symbols.
- 📜 **Auto-Profile**: No manual editing. Your PowerShell profile is updated safely.
- 🎨 **Sync'd Colors**: Windows Terminal colors auto-apply to match the theme.

---

## 🔧 Post-Install Check (Crucial!)

To see the icons correctly, you **must** set your terminal font:

1.  Open Windows Terminal → **Settings** (Ctrl+,)
2.  Go to **Profiles → Defaults → Appearance**
3.  Set **Font face** to: `CaskaydiaCove Nerd Font`
4.  *Optional but recommended:* Set **Acrylic opacity** to `70%` for that glass look.

---

## 📁 Repository Structure

```text
Windows-Terminal-26/
├── install.ps1           ← The Master Installer
├── README.md             ← This Beautiful Guide
├── color-schemes.json    ← Manual color references
├── dragonballz.omp.json  ← Raw Theme Files (Standalone)
├── fantasy.omp.json
├── mecha.omp.json
├── minimal.omp.json
├── romcom.omp.json
├── scifi.omp.json
└── sliceoflife.omp.json
```

---

## 🗑️ Clean Removal

Want to go back to vanilla? We've got you:
```powershell
irm https://raw.githubusercontent.com/Prithibi17/Windows-Terminal-26/main/install.ps1 -OutFile i.ps1; .\i.ps1 -Uninstall
```

---

## 🙏 Credits

- [Oh My Posh](https://ohmyposh.dev/) by Jan De Dobbeleer
- [Nerd Fonts](https://www.nerdfonts.com/) for the glyphs
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch) for the system stats

---

<p align="center">
  <b>⭐ Star this repo if your terminal finally looks cool! ⭐</b>
</p>
