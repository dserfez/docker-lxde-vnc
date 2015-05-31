# cycomf/docker-lxde-vnc
Based on: **sidirius/docker-lxde-vnc**

* Added pipework to have control over container interface networking.
* Added curl postal links2 iputils-tracepath
* Replaced nano with vim
* Removed openssh-server sudo nodejs
* Changed resolution to 800x600x16


TODO: update README.md
Manual Build:
--
    git clone https://github.com/Sidirius/docker-lxde-vnc.git
    cd docker-lxde-vnc
    ./build.sh

Run:
--
    docker run -dt --net=none --name subscriber -e passwd="*your_password_for_vnc*" -p 127.0.0.1:5900:5900 cycomf/docker-lxde-vnc
    pipework subs -i eth0 subscriber <container_ip>/24@<gateway_ip>

Connect:
--
    ssh -L 127.0.0.1:5999:192.168.9.19:5900 user@server
