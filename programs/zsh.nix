{ pkgs }:
{
  enable = true;
  shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };
  ## initExtra = ". ~/code/rolesanywherev4/cmd/env.sh && eval $(cd ~/code/rolesanywherev4 && go run cmd/main.go)
  ## export PINECONE_URL=https://knowledge-cfef6dc.svc.gcp-starter.pinecone.io";
}
