{ pkgs, ... }:
{
    enable = true;
    prefix = "C-a";
    terminal = "screen-256color";

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.resurrect
      tmuxPlugins.catppuccin
];

    extraConfig = builtins.readFile ./tmux/tmux.conf;
}
