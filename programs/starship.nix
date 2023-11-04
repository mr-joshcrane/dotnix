{ pkgs, ... }: 
{
  enable = true;
  enableZshIntegration = true;
  settings = {
  golang = { symbol = " "; };
  battery = { disabled = true; };
  format = "$all"; # Remove this line to disable the default prompt format
  palette = "catppuccin_mocha";
} // builtins.fromTOML (builtins.readFile
    (pkgs.fetchFromGitHub
        {
            owner = "catppuccin";
            repo = "starship";
            rev = "5629d2356f62a9f2f8efad3ff37476c19969bd4f"; # Replace with the latest commit hash
            sha256 = "nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
          } + /palettes/mocha.toml));
}
