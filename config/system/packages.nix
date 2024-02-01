{ pkgs, config, inputs, ... }:

let
  my-python-packages = ps: with ps; [
    pandas
    requests
  ];
in {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List System Programs
  environment.systemPackages = with pkgs; [
        _1password-gui
        brightnessctl
        btop
        curl
        cmatrix
        cowsay
        dunst
        eza
        font-awesome
        git
        gnumake
        go
        htop
        hugo
        hyprpaper
        kitty
        libsForQt5.sddm
        libnotify
        #libvirt
        lm_sensors
        lolcat
        lsd
        lshw
        material-icons
        meson
        nano
        neofetch
        neovim
        ninja
        noto-fonts-color-emoji
        pavucontrol
        pipewire
        pkg-config
        polkit_gnome
        rofi-wayland
        socat
        toybox
        unrar
        unzip
        v4l-utils
        vim
        virt-viewer
        waybar
        wget
        wireplumber
        wl-clipboard
        xdg-desktop-portal-hyprland
        ydotool

        (pkgs.python3.withPackages my-python-packages)
  ];

  programs.steam.gamescopeSession.enable = true;
  programs.dconf.enable = true;
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };
  
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
