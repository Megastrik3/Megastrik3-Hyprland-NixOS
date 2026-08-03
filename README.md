# 🌌 Megastrik3's NixOS & Hyprland Flake Configuration

A modern, reproducible, and aesthetic **NixOS** & **Hyprland** desktop configuration managed with Nix Flakes, Home Manager, UWSM, and Noctalia Shell.

---

## 🌟 Highlights

- **Compositor**: [Hyprland](https://hyprland.org) running via **UWSM** (Universal Wayland Session Manager) for systemd user service management.
- **Desktop Shell**: [Noctalia Shell](https://github.com/noctalia-dev/noctalia) & [Quickshell](https://outfoxxed.me/quickshell) overview & dynamic widget suite.
- **GTK Styling**: [Colloid Dark](https://github.com/vinceliuice/Colloid-gtk-theme) theme with custom dark/black tweaks.
- **Display Manager**: SDDM paired with the Astronaut theme.
- **Terminal & Shell**: Kitty with Zsh, Oh-My-Zsh, Fastfetch, and FZF integration.
- **Privacy & Security**: Decoupled user identity configuration (`local-config.nix` pattern) to keep personal details off public repositories.
- **Multi-Host Ready**: Modular structure supporting desktop workstations (`centari`) and portable devices (`voyager`).

---

## 📁 Repository Structure

```text
.
├── flake.nix                  # Flake entry point & system outputs
├── flake.lock                 # Pinned dependencies
├── local-config.nix.example   # Template for local user settings (git-ignored)
├── hosts/
│   ├── centari/              # Workstation host configuration
│   └── voyager/              # Secondary/laptop host configuration
└── modules/
    ├── nixos/                # Core system modules (drivers, audio, virtualization)
    └── home-manager/         # User environment & application dotfiles
```

---

## 🚀 Installation & Usage

### 1. Clone the Repository
```bash
git clone https://github.com/Megastrik3/Megastrik3-Hyprland-NixOS.git ~/dotfiles
cd ~/dotfiles
```

### 2. Configure Local User Identity (Optional)
Create your local `local-config.nix` file (this file is ignored by Git to keep your credentials private):

```nix
# local-config.nix
{
  username = "yourusername";
  gitUsername = "YourName";
  gitEmail = "your.email@example.com";
}
```

### 3. Build & Apply System
Rebuild your system for the target host (`centari` or `voyager`):

```bash
# Using nixos-rebuild
sudo nixos-rebuild switch --flake .#centari

# Or using nh helper
nh os switch .
```

---

## 🛠️ Included Applications & Utilities

- **Launcher & Widgets**: Quickshell, Rofi
- **Screenshots & Clipboard**: Swappy, Cliphist, wl-clipboard
- **Audio & Media**: Pipewire, Wireplumber, MPV
- **System Monitoring**: BTOP, Fastfetch
- **Idle & Screen Lock**: Hypridle, Hyprlock, Noctalia ScreenLock

---

## 📜 License

Distributed under the MIT License. Feel free to fork, adapt, and use in your own NixOS configurations!
