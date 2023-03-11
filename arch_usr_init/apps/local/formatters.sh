#~/anaconda3/bin/conda install latexindent.pl=3.17.0 -c conda-forge
#mv ~/anaconda3/lib/perl5/vendor_perl/LatexIndent/defaultSettings.yaml ~/anaconda3/lib/perl5/vendor_perl/LatexIndent/defaultSettings.yaml_b
#ln -s ~/dotfiles/conf_files/latexindent/defaultSettings.yaml ~/anaconda3/lib/perl5/vendor_perl/LatexIndent/defaultSettings.yaml
#ln -s ~/anaconda3/bin/latexindent.pl ~/anaconda3/bin/latexindent

sudo pacman -S go
go install mvdan.cc/sh/cmd/shfmt@latest
npm install -g remark-cli
npm install prettier remark-prettier -g
