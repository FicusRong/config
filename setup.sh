ip=$1
ssh $ip <<EOF
cd ~
git clone https://github.com/FicusRong/config.git
cp ./config/.bashrc ./
cp ./config/.profile ./
git clone https://github.com/erikw/tmux-powerline.git
rm ~/tmux-powerline/themes/default.sh
ln -s ~/config/tmux/default.sh ~/tmux-powerline/themes/default.sh
rm .tmux.conf
ln -s ~/config/tmux/.tmux.conf

mkdir .vim/bundle -p
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
rm .zshrc
ln -s ~/config/.zshrc
rm .vimrc
ln -s ~/config/.vimrc

EOF
scp -r ~/.oh-my-zsh $ip:~/
