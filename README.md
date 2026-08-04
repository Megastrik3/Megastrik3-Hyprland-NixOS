# 🌌 Megastrik3's NixOS & Hyprland Flake Configuration

A modern, reproducible, and aesthetic **NixOS** & **Hyprland** desktop configuration managed with Nix Flakes, Home Manager, UWSM, and Noctalia Shell.

---

## 🌟 Highlights

- **Compositor**: [Hyprland](https://hyprland.org) running via **UWSM** (Universal Wayland Session Manager) for systemd user service management.
- **Desktop Shell**: [Noctalia Shell](https://github.com/noctalia-dev/noctalia) & [Quickshell](https://outfoxxed.me/quickshell) overview & dynamic widget suite.
- **GTK Styling**: [Colloid Dark](https://github.com/vinceliuice/Colloid-gtk-theme) theme with custom dark/black tweaks.
- **Display Manager**: SDDM paired with the Astronaut theme.
- **Terminal & Shell**: Kitty with Zsh, Oh-My-Zsh, Fastfetch, and FZF integration.
- **Decoupled Identity**: Personal Git credentials are isolates in `~/.gitconfig.local` outside the repository tree for maximum privacy and evaluation reliability.
- **Multi-Host Ready**: Modular structure supporting desktop workstations (`centari`) and portable devices (`voyager`).

---

## 📁 Repository Structure

```text
.
├── flake.nix                  # Flake entry point & system outputs
├── flake.lock                 # Pinned dependencies
├── gitconfig.local.example    # Template for local Git identity
├── restore-user.sh            # Emergency system & user account restore tool
├── hosts/
│   ├── centari/              # Workstation host configuration
│   └── voyager/              # Secondary/laptop host configuration
└── modules/
    ├── nixos/                # Core system modules (drivers, audio, virtualization)
    └── home-manager/         # User environment & application dotfiles
```

---

## 🚀 Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/Megastrik3/Megastrik3-Hyprland-NixOS.git ~/dotfiles
cd ~/dotfiles
```

### 2. Configure Local Git Identity
To keep your name and email private in your public dotfiles repo, credentials are decoupled to `~/.gitconfig.local` (located in your home folder outside the repository):

Create `~/.gitconfig.local` using the included template:

```bash
cp gitconfig.local.example ~/.gitconfig.local
```

Edit `~/.gitconfig.local` with your details:

```ini
[user]
	name = Your Name
	email = your.email@example.com
```

Home Manager automatically includes `~/.gitconfig.local` into your main Git configuration when built.

### 3. GitHub Authentication (GitHub CLI)
Authenticate with GitHub CLI so Git can push/pull securely without prompting for passwords:

```bash
gh auth login
```

*Note: Home Manager is pre-configured to use `gh` as your Git credential helper (`credential.helper = "gh auth git-credential"`).*

### 4. Build & Apply System
Rebuild your system for the target host (`centari` or `voyager`):

```bash
# Using nixos-rebuild
sudo nixos-rebuild switch --flake .#centari

# Or using nh helper
nh os switch .
```

---

## 🛡️ Emergency Account Restoration

If a configuration change ever breaks your user login or PAM credentials, run the included emergency restoration script from terminal or TTY:

```bash
sudo ./restore-user.sh
```

This rebuilds the system, activates it as root, and resets the initial user password to `nixos`.

---

## 🛠️ Included Applications & Utilities

- **CLI Tools**: GitHub CLI (`gh`), `lsd`, `fzf`, `btop`, `fastfetch`
- **Launcher & Widgets**: Quickshell, Rofi
- **Screenshots & Clipboard**: Swappy, Cliphist, wl-clipboard
- **Audio & Media**: Pipewire, Wireplumber, MPV
- **Idle & Screen Lock**: Hypridle, Hyprlock, Noctalia ScreenLock

---

## 📜 License

Distributed under the MIT License. Feel free to fork, adapt, and use in your own NixOS configurations!
