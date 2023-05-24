{ pkgs, ... }:

let
  script = pkgs.writeShellScriptBin "setup-tmux-plugins" ''
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ~/.tmux/plugins/tpm/bin/install_plugins
  '';
in
{
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    terminal = "screen-256color";

    plugins = with pkgs.tmuxPlugins; [
      # vim-tmux-navigator
    ];

    extraConfig = builtins.readFile ./tmux/tmux.conf;

    extraPackages = [ script ];
  };
}
