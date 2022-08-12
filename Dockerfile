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

# ADD . /opt/systems-programming

# RUN mkdir ~/.config
# RUN mkdir ~/.config/nvim

# ADD ~/.config/ /

# WORKDIR /opt/systems-programming

ENTRYPOINT /bin/nvim

ENV LC_ALL=C
