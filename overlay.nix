# SPDX-FileCopyrightText: 2026 karmar <karmar@posteo.de>
# SPDX-License-Identifier: CC-BY-SA-4.0

{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
}:

buildNpmPackage (finalAttrs: {
  pname = "ubports-installer";
  version = "0.11.2";

  src = fetchFromGitHub {
    owner = "ubports";
    repo = "ubports-installer";
    tag = finalAttrs.version;
    hash = "";
  };

  npmDepsHash = "";

  # The prepack script runs the build script, which we'd rather do in the build phase.
  #npmPackFlags = [ "--ignore-scripts" ];

  #NODE_OPTIONS = "--openssl-legacy-provider";

  meta = {
    description = "Modern web UI for various torrent clients with a Node.js backend and React frontend";
    homepage = "https://flood.js.org";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ winter ];
  };
})
