{ lib, ... }:

let
  entries = builtins.readDir ./.;
  names = lib.attrNames entries;
  isNixFile = name:
    entries.${name} == "regular" && lib.hasSuffix ".nix" name && name != "default.nix";
  imports = map (name: ./. + "/${name}") (lib.filter isNixFile names);
in {
  inherit imports;
}
