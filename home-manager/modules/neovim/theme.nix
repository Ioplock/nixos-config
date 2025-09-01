{
    programs.nixvim = {
        colorschemes = {
            catppuccin = {
                enable = true;
                settings = {
                    background = {
                        light = "macchiato";
                        dark = "mocha";
                    };
                    custom_highlights = ''
                    function(highlights)
                        return {
                        CursorLineNr = { fg = highlights.peach, style = {} },
                        NavicText = { fg = highlights.text },
                        }
                    end
                    '';
                    flavour = "macchiato"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
                    no_bold = false;
                    no_italic = false;
                    no_underline = false;
                    transparent_background = true;
                };
            };
        };
    };
}