curl -fsSL https://fnm.vercel.app/install | bash
source ~/.config/fish/conf.d/fnm.fish
fnm completions --shell fish
fnm install 17.9.0
npm i hexo-cli -g
