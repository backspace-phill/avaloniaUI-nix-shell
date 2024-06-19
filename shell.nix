{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [ dotnet-sdk_8 ];
  shellHook = ''
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${
      with pkgs;
      lib.makeLibraryPath [ libGL xorg.libX11 xorg.libXi xorg.libICE xorg.libSM fontconfig ]
    }"
  '';
}
