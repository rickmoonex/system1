<h1 align="center">System1</h2>

> ✨ Very much inspired by [Rudra](https://github.com/vasujain275/rudra) 🌟

## 🍖 Requirements

- You must be running on NixOS.
- The rudra folder (this repo) is expected to be in your home directory.
- Must have installed using GPT & UEFI. Grub is what is supported, for SystemD you will have to brave the internet for a how-to. ☺️
- Manually editing your host specific files. The host is the specific computer your installing on.

### ⬇️ Install

Run this command to ensure Git & Vim are installed:

```
nix-shell -p git vim
```

Clone this repo & enter it:

```
git clone https://github.com/vasujain275/rudra
cd rudra
```

- _You should stay in this folder for the rest of the install_

Create the host folder for your machine(s)

```
cp -r hosts/default hosts/<your-desired-hostname>
```

**🪧🪧🪧 Edit options.nix 🪧🪧🪧**

Generate your hardware.nix like so:

```
nixos-generate-config --show-hardware-config > hosts/<your-desired-hostname>/hardware-configuration.nix
```

- _Edit All the instances of my name "vasu" and replace it with your name_

- _Remove ciscoPacketTracker from system pkgs in configuration.nix_

- _Change to amd modules from nvidia one in configuration.nix_

- _Remove asusd services from configuration.nix if not using a asus laptop_

Run this to enable flakes and install the flake replacing hostname with whatever you put as the hostname:

```
NIX_CONFIG="experimental-features = nix-command flakes"
sudo nixos-rebuild switch --flake .#hostname
```

Now when you want to rebuild the configuration you can execute the last command, that will rebuild the flake!

Hope you enjoy!
