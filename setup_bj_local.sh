ip=$1

ssh $ip <<EOF
rm -r ~/config/
rm -r ~/tmux-powerline/
rm -r ~/.vim/
rm -r ~/.config/htop
EOF

scp -r ~/config $ip:~/
scp -r ~/tmux-powerline $ip:~/
scp -r ~/.vim $ip:~/
scp -r ~/.config/htop $ip:~/.config/
scp -r ~/.curlrc $ip:~/
scp -r ~/.wgetrc $ip:~/
scp -r ~/.condarc $ip:~/
scp ~/.oh-my-zsh/themes/robbyrussell_cust.zsh-theme $ip:~/.oh-my-zsh/themes/

ssh $ip <<EOF
cd ~
ln -s ~/config/.zshrc ./
cp ./config/.bashrc ./
cp ./config/.profile ./
rm ~/tmux-powerline/themes/default.sh
ln -s ~/config/tmux/default.sh ~/tmux-powerline/themes/default.sh
ln -s ~/config/tmux/.tmux.conf

rm .vimrc
ln -s ~/config/.vimrc
EOF

