# SPDX-FileCopyrightText: 2026 karmar <karmar@posteo.de>
# SPDX-License-Identifier: CC-BY-SA-4.0

{
  lib,
  pkgs,
  stdenv,
  fetchFromGitHub,
  autoPatchelfHook,
  nodejs-18_x,
}:

let
  pname = "ubports-installer";
  version = "0.11.2";

in
stdenv.mkDerivation {
  inherit pname version;

  src = fetchFromGitHub {
    owner = "ubports";
    repo = "ubports-installer";
    rev = "ba7939fe06cc99804af6466f3840bf4d776d5290";
    hash = "sha256-e3HNyOmGJ56QaLEBhuHOUgdLo+EMmhs0BU0H8Jzjzus=";
  };

  nativeBuildInputs = with pkgs; [
    androidenv.androidPkgs_9_0.platform-tools
    bash
    electron
    heimdall
    libnotify
    nodejs-18_x
  ];

  buildPhase = ''
    ./build.js -o "linux" -a "x64"
  '';

  meta = {
    description = "Installer tool for deploying Ubuntu Touch on mobile devices";
    homepage = "https://ubports.com";
    license = lib.licenses.agpl3Only;
    maintainers = [ karmar ];
  };
}
