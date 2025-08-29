{ pkgs, ... }: {

    home.packages = with pkgs; [
        neovim-nightly
    ];

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    programs.neovim = {
        enable = true;
        packages = pkgs.neovim-nightly;
        vimAlias = true;
        vimdiffAlias = true;
        withNodeJs = true;
    };

}