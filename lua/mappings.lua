require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

-- Seus mappings existentes
map("n", ":", ":")
map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- ===== CONFIGURAÇÕES PARA COPILOT E AUTOCOMPLETION =====

-- Copilot mappings (usando Tab como você quer)
map("i", "<Tab>", function()
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").accept()
  else
    return "<Tab>"
  end
end, { expr = true, silent = true, desc = "Accept Copilot suggestion" })

map("i", "<M-]>", function()
  require("copilot.suggestion").next()
end, { silent = true, desc = "Next Copilot suggestion" })

map("i", "<M-[>", function()
  require("copilot.suggestion").prev()
end, { silent = true, desc = "Previous Copilot suggestion" })

map("i", "<C-\\>", function()
  require("copilot.suggestion").dismiss()
end, { silent = true, desc = "Dismiss Copilot suggestion" })

-- nvim-cmp mappings (removendo Tab para deixar livre para Copilot)
map("i", "<C-j>", function()
  local cmp = require("cmp")
  if cmp.visible() then
    cmp.select_next_item()
  else
    return "<C-j>"
  end
end, { expr = true, silent = true, desc = "Next completion item" })

map("i", "<C-k>", function()
  local cmp = require("cmp")
  if cmp.visible() then
    cmp.select_prev_item()
  else
    return "<C-k>"
  end
end, { expr = true, silent = true, desc = "Previous completion item" })

map("i", "<C-d>", function()
  local cmp = require("cmp")
  if cmp.visible() then
    cmp.scroll_docs(4)
  else
    return "<C-d>"
  end
end, { expr = true, silent = true, desc = "Scroll docs down" })

map("i", "<C-u>", function()
  local cmp = require("cmp")
  if cmp.visible() then
    cmp.scroll_docs(-4)
  else
    return "<C-u>"
  end
end, { expr = true, silent = true, desc = "Scroll docs up" })

map("i", "<C-Space>", function()
  require("cmp").complete()
end, { silent = true, desc = "Trigger completion" })

map("i", "<C-e>", function()
  require("cmp").close()
end, { silent = true, desc = "Close completion" })

-- Enter para aceitar completion (com fallback)
map("i", "<CR>", function()
  local cmp = require("cmp")
  if cmp.visible() then
    return cmp.confirm({ select = true })
  else
    return "<CR>"
  end
end, { expr = true, silent = true, desc = "Confirm completion" })

-- ===== MAPPINGS EXTRAS ÚTEIS =====

-- Copilot Chat (se você tiver instalado)
map("n", "<leader>cc", ":CopilotChat ", { desc = "Copilot Chat" })
map("v", "<leader>cc", ":CopilotChatExplain<CR>", { desc = "Copilot Chat Explain" })

-- Toggle Copilot
map("n", "<leader>ct", ":Copilot toggle<CR>", { desc = "Toggle Copilot" })

-- ===== RESUMO DOS KEYBINDS =====
--
-- COPILOT:
-- Tab           -> Aceitar sugestão do Copilot
-- Alt+]         -> Próxima sugestão do Copilot
-- Alt+[         -> Sugestão anterior do Copilot
-- Ctrl+\        -> Dispensar sugestão do Copilot
-- <leader>ct    -> Toggle Copilot on/off
-- <leader>cc    -> Copilot Chat
--
-- AUTOCOMPLETION (nvim-cmp):
-- Ctrl+j        -> Próximo item de completion
-- Ctrl+k        -> Item anterior de completion
-- Ctrl+d        -> Scroll docs para baixo
-- Ctrl+u        -> Scroll docs para cima
-- Ctrl+Space    -> Trigger manual de completion
-- Ctrl+e        -> Fechar completion
-- Enter         -> Confirmar completion
--
