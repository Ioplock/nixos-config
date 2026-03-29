{ inputs, ... }: {
  perSystem = { system, ... }: {
    packages.myNvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
      module = {
        colorschemes.catppuccin = {
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
            flavour = "macchiato";
            no_bold = false;
            no_italic = false;
            no_underline = false;
            transparent_background = true;
          };
        };

        globals.mapleader = " ";

        opts = {
          number = true;
          relativenumber = true;
          tabstop = 2;
          softtabstop = 2;
          showtabline = 2;
          expandtab = true;
          smartindent = true;
          shiftwidth = 2;
          breakindent = true;
          cursorline = true;
          scrolloff = 8;
          mouse = "a";
          foldmethod = "manual";
          foldenable = false;
          linebreak = true;
          spell = false;
          swapfile = false;
          timeoutlen = 300;
          termguicolors = true;
          showmode = false;
          splitbelow = true;
          splitkeep = "screen";
          splitright = true;
          cmdheight = 0;
          fillchars.eob = " ";
        };

        extraConfigLua = ''
          require("telescope").setup{
            pickers = {
              colorscheme = {
                enable_preview = true
              }
            }
          }
        '';

        keymaps = [
          {
            mode = "n";
            key = "<leader>sd";
            action = "<cmd>Telescope diagnostics bufnr=0<cr>";
            options.desc = "Document diagnostics";
          }
          {
            mode = "n";
            key = "<leader>fe";
            action = "<cmd>Telescope file_browser<cr>";
            options.desc = "File browser";
          }
          {
            mode = "n";
            key = "<leader>fE";
            action = "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>";
            options.desc = "File browser";
          }
        ];

        plugins = {
          markdown-preview = {
            enable = true;
            settings = {
              auto_close = 1;
              theme = "dark";
            };
          };

          telescope = {
            enable = true;
            extensions = {
              file-browser.enable = true;
              fzf-native.enable = true;
            };
            settings = {
              defaults = {
                layout_config.horizontal.prompt_position = "top";
                sorting_strategy = "ascending";
              };
            };
            keymaps = {
              "<leader><space>" = {
                action = "find_files";
                options.desc = "Find project files";
              };
              "<leader>/" = {
                action = "live_grep";
                options.desc = "Grep (root dir)";
              };
              "<leader>:" = {
                action = "command_history";
                options.desc = "Command History";
              };
              "<leader>b" = {
                action = "buffers";
                options.desc = "+buffer";
              };
              "<leader>ff" = {
                action = "find_files";
                options.desc = "Find project files";
              };
              "<leader>fr" = {
                action = "live_grep";
                options.desc = "Find text";
              };
              "<leader>fR" = {
                action = "resume";
                options.desc = "Resume";
              };
              "<leader>fg" = {
                action = "oldfiles";
                options.desc = "Recent";
              };
              "<leader>fb" = {
                action = "buffers";
                options.desc = "Buffers";
              };
              "<C-p>" = {
                action = "git_files";
                options.desc = "Search git files";
              };
              "<leader>gc" = {
                action = "git_commits";
                options.desc = "Commits";
              };
              "<leader>gs" = {
                action = "git_status";
                options.desc = "Status";
              };
              "<leader>sa" = {
                action = "autocommands";
                options.desc = "Auto Commands";
              };
              "<leader>sb" = {
                action = "current_buffer_fuzzy_find";
                options.desc = "Buffer";
              };
              "<leader>sc" = {
                action = "command_history";
                options.desc = "Command History";
              };
              "<leader>sC" = {
                action = "commands";
                options.desc = "Commands";
              };
              "<leader>sD" = {
                action = "diagnostics";
                options.desc = "Workspace diagnostics";
              };
              "<leader>sh" = {
                action = "help_tags";
                options.desc = "Help pages";
              };
              "<leader>sH" = {
                action = "highlights";
                options.desc = "Search Highlight Groups";
              };
              "<leader>sk" = {
                action = "keymaps";
                options.desc = "Keymaps";
              };
              "<leader>sM" = {
                action = "man_pages";
                options.desc = "Man pages";
              };
              "<leader>sm" = {
                action = "marks";
                options.desc = "Jump to Mark";
              };
              "<leader>so" = {
                action = "vim_options";
                options.desc = "Options";
              };
              "<leader>sR" = {
                action = "resume";
                options.desc = "Resume";
              };
              "<leader>uC" = {
                action = "colorscheme";
                options.desc = "Colorscheme preview";
              };
            };
          };

          treesitter = {
            enable = true;
            settings.highlight.enable = true;
          };

          web-devicons.enable = true;
          which-key.enable = true;
        };
      };
    };
  };
}
