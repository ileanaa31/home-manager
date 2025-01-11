{ lib, config, pkgs, ... }:
{
  options = {
    nixvim.enable = lib.mkEnableOption "enables nixvim";
  };


  config = lib.mkIf config.nixvim.enable {
    programs.ripgrep.enable = true; # Required for Telescope

    programs.nixvim = {
      enable = true;
      defaultEditor = true;

      colorschemes = {
	nord.enable = true;
      };

      globals.mapleader = " ";

      plugins = {
	lualine.enable = true;
	treesitter.enable = true;
	telescope.enable = true;
	copilot-vim.enable = true;
	fugitive.enable = true;
	indent-blankline.enable = true;
	web-devicons.enable = true;

	# Obsidian
	obsidian = {
	  enable = true;

	  settings = {
	    workspaces = [
	      {
		name = "Notes";
		path = "~/Nextcloud/Notes/";
	      }
	    ];
	  };
	};

	# rich presence
	presence-nvim = {
	  enable = true;

	  autoUpdate = true;
	  mainImage = "file";
	  neovimImageText = "Nixvim";
	};

	# harpoon
	harpoon = {
	  enable = true;

	  keymaps = {
	    addFile = "<leader>a";
	    toggleQuickMenu = "<C-e>";
	    navFile = {
	      "1" = "<A-1>";
	      "2" = "<A-2>";
	      "3" = "<A-3>";
	      "4" = "<A-4>";
	    };
	  };
	};

	# Language Servers
	lsp = {
	  enable = true;

	  servers = {
	    nil_ls.enable = true;
	    nixd.enable = true;
	    ts_ls.enable = true;
	    pylsp.enable = true;
	    ccls.enable = true;
	  };
	};
	
	lsp-lines = {enable = true;};
	lsp-format = {
    	  enable = true;
    	  lspServersToEnable = "all";
    	};

	# Completion
	cmp = {
	  enable = true;

	  settings = {
	    autoEnableSources = true;
	  
	    sources = [
	      { name = "nvim_lsp"; }
	      { name = "path"; }
	      { name = "buffer"; }
	    ];

	    mapping = {
	      "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              "<C-j>" = "cmp.mapping.select_next_item()";
              "<C-k>" = "cmp.mapping.select_prev_item()";
              "<C-e>" = "cmp.mapping.abort()";
              "<C-b>" = "cmp.mapping.scroll_docs(-4)";
              "<C-f>" = "cmp.mapping.scroll_docs(4)";
              "<C-Space>" = "cmp.mapping.complete()";
              "<CR>" = "cmp.mapping.confirm({ select = true })";
              "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
	    };
	  };
	};

	cmp-nvim-lsp = {
	  enable = true; # LSP
    	};

    	cmp-buffer = {
    	  enable = true;
    	};

    	cmp-path = {
    	  enable = true; # file system paths
    	};
      };

      extraPlugins = with pkgs.vimPlugins; [
	LanguageTool-nvim
      ];

      keymaps = [
	# Open zathura
	{
	  mode = "n";
	  key = "<leader>za";
	  action = "<cmd>!zathura \"$(echo '%' | sed -E 's/^(.*)\\.(tex|md)$/\\1.pdf/g')\" & disown<CR><CR>";
	}

	# Open explorer
        {
	  mode = "n";
	  key = "<leader>pv";
	  action = "<cmd>Ex<CR>";
	}

	# move lines up and down in visual mode
	{
	  mode = "v";
	  key = "J";
	  action = ":m '>+1<CR>gv=gv";
	}
	{
	  mode = "v";
	  key = "K";
	  action = ":m '<-2<CR>gv=gv";
	}

	# copy to clipboard
	{
	  mode = ["n" "v"];
	  key = "<leader>y";
	  action = "+y";
	}
	{
	  mode = "n";
	  key = "<leader>Y";
	  action = "+Y";
	}

	# LSP format
	{
	  mode = "n";
	  key = "<leader>f";
	  action = "vim.lsp.buf.format";
	  options.silent = true;
	}

	# LSP Diagnostics
	{
	  action = "<cmd>Telescope diagnostics bufnr=1<CR>";
	  key = "<leader>D";
	}

	# Telescope
	{
	  action = "<cmd>Telescope live_grep<CR>";
	  key = "<leader>fw";
    	}
    	{
    	  action = "<cmd>Telescope find_files<CR>";
    	  key = "<leader>ff";
    	}
    	{
    	  action = "<cmd>Telescope git_commits<CR>";
    	  key = "<leader>fg";
    	}
    	{
    	  action = "<cmd>Telescope oldfiles<CR>";
    	  key = "<leader>fh";
    	}
    	{
    	  action = "<cmd>Telescope colorscheme<CR>";
    	  key = "<leader>ch";
    	}
    	{
    	  action = "<cmd>Telescope man_pages<CR>";
    	  key = "<leader>fm";
    	}
      ];

      opts = {
        number = true;         # Show line numbers
        relativenumber = true; # Show relative line numbers

        shiftwidth = 2;        # Tab width should be 2
      };
    };	
  };
}
