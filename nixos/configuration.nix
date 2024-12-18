# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:
{
    imports = [
        ./hardware-configuration.nix
    ];

    boot.supportedFilesystems = [
        "ntfs"
        "apfs"
    ];

    nix.settings.experimental-features = [
        "nix-command"
        "flakes"
    ];

    programs.dconf.enable = true;

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "nixmann"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/Berlin";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "de_DE.UTF-8";
        LC_IDENTIFICATION = "de_DE.UTF-8";
        LC_MEASUREMENT = "de_DE.UTF-8";
        LC_MONETARY = "de_DE.UTF-8";
        LC_NAME = "de_DE.UTF-8";
        LC_NUMERIC = "de_DE.UTF-8";
        LC_PAPER = "de_DE.UTF-8";
        LC_TELEPHONE = "de_DE.UTF-8";
        LC_TIME = "de_DE.UTF-8";
    };

    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    services.xserver.enable = true;

    # Enable trash
    services.gvfs.enable = true;

    #Enable polkit security
    security.polkit.enable = true;

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORMTHEME = "qt5ct";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    };

    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${pkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
            };
            initial_session = {
                command = "Hyprland";
                user = "kizmann";
            };
        };
    };

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;

    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.kizmann = {
        isNormalUser = true;
        description = "kizmann";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    # Install firefox.
    # programs.firefox.enable = true;

    # Install hyprland.
    programs.hyprland.enable = true;

    # Install waybar
    programs.waybar.enable = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        wget
        go
        pkg-config
        glib.dev
        gtk3
        gtk-layer-shell
        zsh
        thefuck
        killall
        which
        cmake
        gnumake
        gcc
        python3
        nautilus
        nautilus-python
        tofi
        rofi-wayland
        rofi-power-menu
        libnotify
        nwg-look
        nwg-dock-hyprland
        grim
        slurp
        wl-clipboard
        mako
        polkit
        soteria
        dconf-editor
        fm
        roboto
        gnome-tweaks
        font-awesome
        fira-code-nerdfont
        jetbrains-mono
        git
        docker
        kitty
        quickemu
        gitkraken
        dunst
        chromium
        jetbrains.phpstorm
        jetbrains.clion
    ];
  

    fonts.packages = with pkgs; [
        font-awesome
        fira-code-nerdfont
        jetbrains-mono
        roboto
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #     enable = true;
    #     enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.11"; # Did you read the comment?

}
