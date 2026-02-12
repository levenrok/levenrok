{
  description = "Flake for Web Development with Astro";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          name = "astro";

          nativeBuildInputs = with pkgs; [
            bun

            astro-language-server
            svelte-language-server
            typescript-language-server
            tailwindcss-language-server
          ];

          shellHook = ''
            echo -e "\033[0;32mDone!\033[0m"
          '';
        };
      }
    );
}
