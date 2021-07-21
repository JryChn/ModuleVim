local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path))>0 
then
	vim.fn.system({'git','clone','https://github.com/wbthomason/packer.nvim',install_path})
end

return require('packer').init{
    display = {
        open_fn = function()
            return require'packer.util'.float{border = "single"}
        end
    },
    git = {
        clone_timeout = 600
    }
}
