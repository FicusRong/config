# install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#install tmux powerline
git clone https://github.com/erikw/tmux-powerline.git
rm ~/tmux-powerline/themes/default.sh
ln -s ~/config/tmux/default.sh ~/tmux-powerline/themes/default.sh
ln -s ~/config/tmux/.tmux.conf

#upgrade vim
sudo add-apt-repository ppa:fcwu-tw/ppa
sudo apt-get update
sudo apt-get install vim

