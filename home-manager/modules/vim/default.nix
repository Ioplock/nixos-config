{ pkgs, ... }: {

    home.packages = with pkgs; [
        neovim
    ];

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    programs.neovim = {
        enable = true;
        packages = pkgs.neovim;
        vimAlias = true;
        vimdiffAlias = true;
        withNodeJs = true;
    };

}