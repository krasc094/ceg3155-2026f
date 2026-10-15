{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
    nix-fpga-openxc7 = {
      url = "github:Quantum-Serendipity/nix-fpga-openxc7";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    flake-utils,
    nix-fpga-openxc7,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [nix-fpga-openxc7.overlays.default];
      };
      inherit (pkgs.openxc7) nextpnr-xilinx chipdb-artix7 prjxray;
    in {
      devShell = with pkgs;
        mkShell {
          buildInputs = [
            git
            gnumake # make
            vhdl-ls # language server

            ghdl # compile / simulate vhdl
            gtkwave # waveform visualizer

            yosys
            yosys-ghdl
            nextpnr-xilinx
            prjxray
            chipdb-artix7
            openfpgaloader

            fasm

            (python3.withPackages (python-pkgs:
              with python-pkgs; [
                fasm
              ]))

            netlistsvg
            mermaid-cli
          ];

          shellHook = ''
            export CHIPDB="$HOME/.cache/openxc7-chipdb/artix7"
            mkdir -p "$CHIPDB"
            for f in ${chipdb-artix7}/*.bin; do
              ln -sf "$f" "$CHIPDB/"
            done
            export PRJXRAY_DB_DIR="${nextpnr-xilinx}/share/nextpnr/external/prjxray-db"
            export NEXTPNR_XILINX_PYTHON_DIR="${nextpnr-xilinx}/share/nextpnr/python"
          '';
        };
    });
}
