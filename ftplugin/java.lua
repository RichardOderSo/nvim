    local jdtls = require('jdtls')
    local config = {
      cmd = {"jdtls"},
      root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw", "pom.xml" }, { upward = true })[1]),
      settings = {
        java = {
          -- optional: multiple JDK runtimes
          -- configuration = {
          --   runtimes = {
          --     { name = "JavaSE-17", path = "/usr/lib/jvm/java-17-openjdk" },
          --     { name = "JavaSE-21", path = "/usr/lib/jvm/java-21-openjdk" },
          --   }
          -- }
        }
      },
      capabilities = require('cmp_nvim_lsp').default_capabilities(),

      init_options = {
        bundles = {
          vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/java-test/extension/server/*.jar", true),
          vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
        }
      }
    }

    jdtls.start_or_attach(config)

    require("jdtls.dap").setup_dap_main_class_configs()
