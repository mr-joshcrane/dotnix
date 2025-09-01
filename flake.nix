{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux"; # change if needed
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true; # optional
    };
  in {
    # install with: nix profile install .#
    packages.${system}.default = pkgs.buildEnv {
      name  = "josh-packages";
      paths = with pkgs; [
        # --- Shell & terminal ---
        "zsh"
        "starship"
        "tmux"
        "direnv"
        "stow"

        # --- VCS & repo tooling ---
        "git"
        "gh"
        "lazygit"

        # --- Core CLI utilities ---
        "ripgrep"
        "gnugrep"
        "jq"
        "yq-go"
        "wget"
        "unzip"

        # --- Cloud / Ops / Security ---
        "flyctl"
        "yubikey-manager"

        # --- Go toolchain ---
        "go"
        "gopls"
        "delve"
        "golangci-lint"

        # --- Rust toolchain ---
        "rustc"
        "cargo"
        "rust-analyzer"
        "rustPackages.clippy"

        # --- BEAM (Elixir/Erlang) ---
        "elixir_1_16"
        "erlang"

        # --- Node (for Mason/LSP etc.) ---
        "nodejs_22"
      ];
    };
  };
}

