#! /usr/bin/env fish

echo -e "\033[41;36m installing anaconda \033[0m"
fish ./apps/local/anaconda.sh

echo -e "\033[41;36m installing fnm and node.js \033[0m"
fish ./apps/local/fnm.sh

echo -e "\033[41;36m installing and configure neovim \033[0m"
fish ./apps/local/nvim.sh

echo -e "\033[41;36m cloning my blog and my diary \033[0m"
fish ./apps/local/myblog.sh

echo -e "\033[41;36m installing formatters \033[0m"
fish ./apps/local/formatters.sh

