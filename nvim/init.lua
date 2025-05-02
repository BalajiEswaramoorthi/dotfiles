local plugins = require("plugins")

require("bootstrap")
require("keymaps")
require("options")
require("filetype")
require("lazy").setup(plugins.plugins)
