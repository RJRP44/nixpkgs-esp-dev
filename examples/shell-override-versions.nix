# A standalone shell definition that overrides the versions of ESP-IDF and the ESP32 toolchain.

let
  nixpkgs-esp-dev = builtins.fetchGit {
    url = "https://github.com/RJRP44/nixpkgs-esp-dev.git";
  };

  pkgs = import <nixpkgs> { overlays = [ (import "${nixpkgs-esp-dev}/overlay.nix") ]; };
in
pkgs.mkShell {
  name = "esp-project";

  buildInputs = with pkgs; [
    (esp-idf-esp32.override {
      rev = "64b9d85a766f182c571fd1f515ce127dfcdc9a46";
      sha256 = "sha256-ooHjHcD8N0nJMa9mfF3SOkM8ddwbwptOitl1IBiExdw=";
    })
  ];
}
