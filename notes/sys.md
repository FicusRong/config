# Nvidia
`$export CUDA_VISIBLE_DEVICES=1,2`

# FileBrowser
https://github.com/filebrowser/filebrowser
port: 8080

# VSCode
ps aux | grep .vscode-server | awk '{print $2}' | xargs kill

# Misc
change keyboard rate:
sudo xset r rate 200 40

get file name without ext:
${f%.*}
${f#.*}

back trace
addr2line 0x6051d1 -e binary

tar -zcvf /tmp/etc.tar.gz /etc
tar -zxvf /tmp/etc.tar.gz

rsync -avzhP /disks/disk0/wanda/video_done/20140817/ wanda@202.120.58.133:/home/renren/wanda/20140817/
--include '*/' --include '*.js' --exclude '*'

ss-local -s 106.185.38.172 -p 8100 -l 1080 -k sakuya -m aes-256-cfb

numactl --cpunodebind= --membind=

sudo mount -t tmpfs -o size=10240M tmpfs ./data

python -m SimpleHTTPServer 7800
python3 -m http.server 7800
