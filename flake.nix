{
	description = "Golang SSR Site for Wyatt James's Resume";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = { self, nixpkgs, flake-utils, ... }:
		flake-utils.lib.eachDefaultSystem (system:
			let
				pkgs = nixpkgs.legacyPackages.${system};
				title = "Golang Resume Site Project";
			in
			{
				devShells.default = pkgs.mkShell {
					buildInputs = with pkgs; [
						go
						git
					];

					shellHook = ''
						echo "Loaded ${title}"
					'';
				};
			}
		);
}
