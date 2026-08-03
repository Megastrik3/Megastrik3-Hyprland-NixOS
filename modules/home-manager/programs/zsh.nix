{ config, pkgs, ... }:

{
  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Using native Nix attributes for cleaner management
    shellAliases = {
      ls = "lsd";
      l = "ls -l";
      la = "ls -a";
      lla = "ls -la";
      lt = "ls --tree";
    };

    history = {
      size = 10000;
      save = 10000;
      path = "$HOME/.zsh_history";
      ignoreAllDups = true;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };

    # Commands that should run on every shell start
    initContent = ''
      # Fastfetch
      if [ -f "$HOME/.config/fastfetch/config.jsonc" ]; then
        fastfetch -c "$HOME/.config/fastfetch/config.jsonc"
      fi

      # FZF integration
      source <(fzf --zsh)
      
      # Additional zsh options
      setopt appendhistory
    '';
  };
}