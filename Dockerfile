FROM ubuntu:18.04

RUN yes y | unminimize

RUN apt-get -qq update && apt-get install -yq \
    man-db \
    manpages-posix \
    manpages-dev \
    manpages-posix-dev \
    build-essential \
    cmake \
    git \
    zsh \
    openssh-server \
    gdb \
    valgrind \
    curl

RUN curl -q -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o /bin/nvim > /dev/null
RUN chmod u+x /bin/nvim

RUN chsh -s $(which zsh)

RUN mkdir -p /root/.config/nvim

ADD . /root/.config/nvim

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim /root/.local/share/nvim/site/pack/packer/start/packer.nvim

RUN touch root/.zshrc && cat /root/.config/nvim/zshrc >> /root/.zshrc

ENTRYPOINT /bin/zsh

ENV LC_ALL=C
