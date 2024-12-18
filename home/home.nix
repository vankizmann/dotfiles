{ config, pkgs, ...}: {

    imports = [
        #./environment
        #./programs
        #./scripts
        #./themes
    ];

    home.username = "kizmann";
    #home.homeDirectory = "/home/kizmann";

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            update = "cd $HOME/.dotfiles && sh install.sh";
        };

        history = {
            size = 10000;
            path = "${config.xdg.dataHome}/zsh/history";
        };

        oh-my-zsh = {
            enable = true;
            plugins = [ "git" "thefuck" ];
            theme = "robbyrussell";
        };
    };

    home.packages = (with pkgs; [

    ]);

    dconf.settings = {
        "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
        };

#        "org/gnome/shell/extensions/user-theme" = {
#            name = "Tokyonight-Dark-B-LB";
#        };
    };

    programs.home-manager.enable = true;

    home.stateVersion = "24.11";
}