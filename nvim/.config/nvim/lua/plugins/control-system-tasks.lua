vim.keymap.set('n', '<leader>rb', function()
  local yaml = vim.fn.system "yq -r '.product[].define' ~/rad/code/control-system/radbus.yml"
  local items = vim.split(vim.trim(yaml), '\n')

  vim.ui.select(items, {
    prompt = 'Select Product',
  }, function(choice)
    if choice then
      vim.cmd(':vsplit | term python ~/rad/code/control-system/build.py ' .. vim.fn.shellescape(choice))
    end
  end)
end, { desc = '[R]un [B]uild' })

vim.keymap.set('n', '<leader>rf', function()
  local yaml = vim.fn.system "yq -r '.product[].define' ~/rad/code/control-system/radbus.yml"
  local items = vim.split(vim.trim(yaml), '\n')

  vim.ui.select(items, {
    prompt = 'Select Product',
  }, function(choice)
    if choice then
      vim.cmd(
        ':vsplit | term python ~/rad/code/control-system/build.py '
          .. vim.fn.shellescape(choice)
          .. '&& /opt/st/stm32cubeide_2.1.0/plugins/com.st.stm32cube.ide.mcu.externaltools.cubeprogrammer.linux64_2.2.400.202601091506/tools/bin/STM32_Programmer_CLI --connect port=swd --optionbytes BFB2=0 --download Build/main.bin 0x08000000 --verify --rst --start'
      )
    end
  end)
end, { desc = '[R]un [F]lash' })

vim.keymap.set('n', '<leader>rc', function()
  vim.cmd ':vsplit | term make clean ARCH=NONE'
end, { desc = '[R]un [C]lean' })

vim.keymap.set('n', '<leader>ru', function()
  vim.cmd '!python ~/scripts/control-system/update-clangd.py'
end, { desc = '[R]un [U]pdate clangd' })
