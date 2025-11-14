return {
  autostart = true,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  root_markers = { '.git', 'composer.json', 'index.php' },
  settings = {
    intelephense = {
      maxFileSize = 5000000, -- 5MB (default is 1MB)
    },
    codeLens = {
      references = {
        enable = true
      },
      implementations = {
        enable = true
      },
      usages = {
        enable = true
      },
      overrides = {
        enable = true
      },
      parent = {
        enable = true
      },
    },
  },
}
