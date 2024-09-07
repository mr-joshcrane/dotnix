{ pkgs }:
{
  enable = true;
  shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };
  
  environment.variables = {
    GOPATH = "$HOME/go";
  };
}
