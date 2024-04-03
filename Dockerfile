# cat /etc/os-release
# https://github.com/susers/Writeups/blob/2b7977525e55889777895ac24b38ec87ca923d70/2017/NUAACTF/misc/pillow/deploy/Dockerfile#L6
# https://github.com/firstBitMarksistskaya/onec-docker
FROM ubuntu:24.04
RUN set -x \
    && echo "deb http://archive.ubuntu.com/ubuntu noble-proposed main" >> /etc/apt/sources.list \
    && apt update \
    && apt install -y apt-utils curl \
    && apt install -y build-essential pkg-config

RUN set -x \
    && apt install -y libcolord2 libcups2 libvulkan1 dialog zip \
    && echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
    && apt install -y libgtk-4-common/noble-proposed libglib2.0-dev/noble-proposed libgirepository-2.0-0/noble-proposed \
    && apt install -y gir1.2-glib-2.0/noble-proposed gir1.2-glib-2.0-dev/noble-proposed libglib2.0-0/noble-proposed \
    && apt install -y pango1.0-tools/noble-proposed libpango-1.0-0/noble-proposed libpangocairo-1.0-0/noble-proposed libpangoft2-1.0-0/noble-proposed libpango1.0-dev/noble-proposed \
    && apt install -y gir1.2-freedesktop-dev/noble-proposed gir1.2-graphene-1.0/noble-proposed libgraphene-1.0-dev/noble-proposed gir1.2-gdkpixbuf-2.0/noble-updates libcups2t64 libpng16-16t64

RUN set -x \
    && apt install -y libgtk-4-1/noble-proposed \
    && apt install -y libpng-dev/noble-proposed libpango1.0-dev/noble-proposed libgtk-4-dev/noble-proposed libnma-gtk4-0/noble-proposed gnome-desktop3-data/noble-proposed libgtk-3-common/noble-proposed gnome-settings-daemon/noble-proposed libxt6

RUN set -x \
    && apt install -y e2fsprogs/noble-proposed ubuntu-advantage-tools/noble-proposed nano mc htop && apt update && apt upgrade -y && apt clean all

RUN set -xe \
    # https://cloudzy.com/blog/gnome-remote-desktop/
    # http://mech.math.msu.su/~vvb/2course/Borisenko/CppProjects/GWindow/xintro.html
    # https://gist.github.com/ryot4/0712f02f709be90bd5d6812b85e3b529
    # https://github.com/bombasticbob/X11workbenchProject
    && apt install -y gnome-shell-common/noble-updates gnome-shell/noble-updates colord/noble-updates

RUN set -xe \
    && apt install -y gnupg/noble-proposed gvfs/noble-proposed nautilus-data/noble-proposed nautilus/noble-proposed \
    && apt download ubuntu-session/noble-proposed \
    && dpkg -i --force-all ubuntu-session_46.0-1ubuntu2_all.deb
