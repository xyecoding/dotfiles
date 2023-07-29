#~/anaconda3/bin/conda install latexindent.pl -c conda-forge
#mv ~/anaconda3/lib/perl5/vendor_perl/LatexIndent/defaultSettings.yaml ~/anaconda3/lib/perl5/vendor_perl/LatexIndent/defaultSettings.yaml_b
#ln -s ~/dotfiles/conf_files/latexindent/defaultSettings.yaml ~/anaconda3/lib/perl5/vendor_perl/LatexIndent/defaultSettings.yaml
#ln -s ~/anaconda3/bin/latexindent.pl ~/anaconda3/bin/latexindent

sudo apt install golang-go -y
export GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn
go get -u mvdan.cc/sh/cmd/shfmt
npm install -g remark-cli
npm install prettier remark-prettier -g
