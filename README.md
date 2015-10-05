# install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#~./bashrc
export TERM=xterm-256color

#upgrade vim
sudo add-apt-repository ppa:fcwu-tw/ppa
sudo apt-get update
sudo apt-get install vim

#upgrade cmake
sudo apt-get install build-essential
wget http://www.cmake.org/files/v3.2/cmake-3.2.2.tar.gz
tar xf cmake-3.2.2.tar.gz
cd cmake-3.2.2
sudo ./configure
sudo make
sudo make install

#install clang
sudo apt-get install clang-3.4
sudo apt-get install libclang-3.4-dev

#install ycm
https://github.com/Valloric/YouCompleteMe
