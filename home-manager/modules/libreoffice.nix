{ pkgs, ... }: {

    home.packages = with pkgs; [
        libreoffice # Office suite
    ];

    home.sessionVariables = {
        SAL_USE_VCLPLUGIN = "gtk3";
    };
}