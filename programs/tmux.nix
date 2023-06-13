{ pkgs, ... }:
{
    enable = true;
    prefix = "C-a";
    terminal = "screen-256color";

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.resurrect
      tmuxPlugins.power-theme
    ];

    extraConfig = builtins.readFile ./tmux/tmux.conf;
}
