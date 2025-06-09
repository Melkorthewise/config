# zen-override.nix
{ zenBrowserPackages, system }:

let
  latestVersion = "1.12b";
  latestSha256 = "13873clb14albhjlrk5rmd58ii75p4qhr96736hmp403ibsi24y1";
in
zenBrowserPackages.${system}.specific.overrideAttrs (old: {
  version = latestVersion;
  src = builtins.fetchTarball {
    url = "https://github.com/zen-browser/desktop/releases/download/${latestVersion}/zen.linux-x86_64.tar.xz";
    sha256 = latestSha256;
  };
})
