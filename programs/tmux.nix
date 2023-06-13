{ pkgs, ... }:
let
  modern-tmux-theme = mkTmuxPlugin {
  pluginName = "modern-tmux-theme";
    version = "unstable-2023-01-06";
    src = fetchFromGitHub {
      owner = "Millrocious";
      repo = "modern-tmux-theme";
      rev = "29dad92c8a2486e5b6f116e42883906c00a1f0a2";
      sha256 = "sha256-ymmCI6VYvf94Ot7h2GAboTRBXPIREP+EB33+px5aaJk=";
    };
  };
in
{
    enable = true;
    prefix = "C-a";
    terminal = "screen-256color";

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      modern-tmux-theme
      # tmuxPlugins.catppuccin
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
    ];

    extraConfig = builtins.readFile ./tmux/tmux.conf;
}
