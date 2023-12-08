FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive
ENV UDEV off

# ------------------ Changes from here -----------------------------------------------------
ARG NEWUSER=pi
ARG TIMEZONE=Europe/Berlin
# ------------------ Changes to here -----------------------------------------------------

RUN apt update && apt upgrade --yes && apt install --yes --no-install-recommends locales
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV LANGUAGE=en
ENV TZ=$TIMEZONE

RUN apt install --yes --no-install-recommends \
    sudo \
    ca-certificates \
    gnupg \
    dirmngr \
    udev \
    procps \
    htop \
    findutils \
    bzip2 \
    unzip \
    zip \
    bash-completion \
    openssh-client \
    netbase \
    net-tools \
    inetutils-ping \
    traceroute \
    wget \
    curl \
    ncurses-term

RUN apt install --yes --no-install-recommends \
    git \
    nano \
    mc \
    perl \
    cpp \
    g++ \
    gcc \
    gdb \
    make \
    cmake \
    python3 \
    python3-pip \
    python3-venv \
    python3-tk \
    manpages \
    manpages-dev \
    man-db \
    git-man

RUN apt install --yes --no-install-recommends \
    notification-daemon \
    upower \
    chromium\
    fontconfig \
    fonts-freefont-ttf \
    fonts-liberation2 \
    fonts-dejavu-core \
    fonts-quicksand \
    fonts-noto-mono \
    fonts-droid-fallback \
    libsecret-1-0 \
    gnome-keyring \
    hicolor-icon-theme

RUN useradd --create-home --shell /bin/bash --user-group --groups adm,dialout,cdrom,floppy,sudo,audio,dip,video,plugdev $NEWUSER && \
    passwd -d $NEWUSER && \
    echo "$NEWUSER ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers && \
    echo "[boot]" >/etc/wsl.conf && \
    echo "systemd=true" >>/etc/wsl.conf && \
    echo "[user]" >>/etc/wsl.conf && \
    echo "default=$NEWUSER" >>/etc/wsl.conf && \
    mkdir /home/$NEWUSER/.ssh && \
    chown $NEWUSER:$NEWUSER /home/$NEWUSER/.ssh && \
    chmod 700 /home/$NEWUSER/.ssh && \
    touch /home/$NEWUSER/.ssh/id_rsa && \
    chown $NEWUSER:$NEWUSER /home/$NEWUSER/.ssh/id_rsa && \
    chmod 600 /home/$NEWUSER/.ssh/id_rsa && \
    echo "export LC_ALL=C.UTF-8" >> /home/$NEWUSER/.bashrc && \
    echo "export LANG=C.UTF-8" >> /home/$NEWUSER/.bashrc && \
    echo "export LANGUAGE=en" >> /home/$NEWUSER/.bashrc


USER $NEWUSER

WORKDIR /home/$NEWUSER
