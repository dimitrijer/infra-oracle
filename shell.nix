let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { overlays = [ ]; config = { }; };
  nixfiles = import sources.nixfiles { };
  neovim = nixfiles.neovim { pkgs = pkgs; };
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    git
    ansible
    terraform
    kubectl
    # Editing
    nixpkgs-fmt
    ripgrep
    fd
  ] ++ [ neovim ];
}
