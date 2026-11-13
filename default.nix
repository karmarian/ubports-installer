# SPDX-FileCopyrightText: 2026 karmar <karmar@posteo.de>
# SPDX-License-Identifier: CC-BY-SA-4.0

{
  system ? builtins.currentSystem,
  sources ? import ./npins,
  pkgs ? import sources.nixpkgs-tarball {
    inherit system;
    config = {
      allowUnfree = true;
    };
    overlays = [ ];
  },
}:
let
  inherit (pkgs) lib;

in
lib.makeScope pkgs.newScope (final: {
  ubports-installer = pkgs.callPackage ./ubports-installer.nix { };

  shell = pkgs.mkShell {
    packages = with pkgs; [
      androidenv.androidPkgs_9_0.platform-tools
      electron
      just
      nodejs-18_x
      reuse
    ];
  };
})
