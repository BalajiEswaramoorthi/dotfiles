local plugins = require("plugins")

require("bootstrap")
require("keymaps")
require("options")
require("custom-opts")
require("filetype")
require("lazy").setup(plugins.plugins)
