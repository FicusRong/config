ip=$1
ssh $ip <<EOF
cd ~
rm -r .ssh
cp -r /mnt/ficusalpha/srong/config/.ssh ./

git clone https://github.com/FicusRong/config.git
cp ./config/.bashrc ./
cp ./config/.profile ./
git clone https://github.com/erikw/tmux-powerline.git
rm ~/tmux-powerline/themes/default.sh
ln -s ~/config/tmux/default.sh ~/tmux-powerline/themes/default.sh
ln -s ~/config/tmux/.tmux.conf

mkdir .vim/bundle -p
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
rm .vimrc
ln -s ~/config/.vimrc

EOF

