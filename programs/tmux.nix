{ pkgs, ... }:

let
  script = pkgs.writeScript "setup-tmux-plugins" ''
    if [ ! -d "${builtins.getEnv "HOME"}/.tmux/plugins/tpm" ]; then
      git clone https://github.com/tmux-plugins/tpm ${builtins.getEnv "HOME"}/.tmux/plugins/tpm
      ${builtins.getEnv "HOME"}/.tmux/plugins/tpm/bin/install_plugins
    fi
  '';
in
{
    enable = true;
    prefix = "C-a";
    terminal = "screen-256color";

    plugins = with pkgs.tmuxPlugins; [
      # vim-tmux-navigator
    ];

    extraConfig = builtins.readFile ./tmux/tmux.conf;
}
