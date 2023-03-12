cd ~
set name "Anaconda3-2022.10-Linux-x86_64.sh"
wget https://repo.anaconda.com/archive/$name
bash $name
~/anaconda3/bin/conda init fish
rm -rf $name
