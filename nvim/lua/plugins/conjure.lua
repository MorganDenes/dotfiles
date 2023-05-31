return {
  'Olical/conjure',
  ft = {'clojure','lua'},
  keys={
      {"<leader>cb", "<cmd>ConjureEvalBuf<cr>"},
      {"<leader>ce", "<cmd>ConjureEvalCurrentForm<cr>"},
      {"<leader>c!", "<cmd>ConjureEvalReplaceForm<cr>"},
      {"<leader>cr", "<cmd>ConjureEvalRootForm<cr>"},
      {"<leader>C", "<cmd>ConjureEvalMotion<cr>"},
      {"<leader>C", "<cmd>ConjureEvalVisual<cr>", mode='v'},
      {"<leader>cm", "<cmd>ConjureEvalMarkedForm<cr>"},
      {"<leader>cl", "<cmd>ConjureLogSplit<cr>"},
      {"<leader>ct", "<cmd>ConjureLogToggle<cr>"},
  },
}
