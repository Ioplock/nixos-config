{ lib, ... }:

let
  entries = builtins.readDir ./.;
  names = lib.attrNames entries;
  isImportable = name:
    let
      entry = entries.${name};
    in
      (entry == "directory")
      || (entry == "regular" && lib.hasSuffix ".nix" name && name != "default.nix");
  imports = map (name: ./. + "/${name}") (lib.filter isImportable names);
in {
  inherit imports;
}
