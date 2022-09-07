FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN yes y | unminimize

RUN apt-get -qq update && apt-get install -yq \
    software-properties-common \
    build-essential \
    cmake \
    curl \
    git \
    gdb \
    man-db \
    manpages-dev \
    manpages-posix \
    manpages-posix-dev \
    openssh-server \
    valgrind \
    zsh

RUN add-apt-repository ppa:deadsnakes/ppa

RUN apt-get install -yq \
  zip \
  python3.9 \
  python3.9-distutils \
  python3-distutils \
  python3-venv \
  python3-wheel \
  && curl https://bootstrap.pypa.io/get-pip.py | python3.9

RUN python3.9 -m pip install neovim clang-format
# This hasn't hit apt yet
# Install neovim
RUN curl -LO "https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.tar.gz" \
  && tar -xzvf nvim-linux64.tar.gz

# Add neovim to path
ENV PATH="/nvim-linux64/bin/:${PATH}"

ADD . /root/.config/nvim

# Install packer
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim /root/.local/share/nvim/site/pack/packer/start/packer.nvim

RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
RUN nvim --headless +TSUpdateSync +qa

# generate zshrc
RUN touch /root/.zshrc && cat /root/.config/nvim/zshrc >> /root/.zshrc

# default to zsh
RUN chsh -s $(which zsh)

# container should be run with `-v $(pwd):/home`
WORKDIR /home

# Add ssh keys

RUN mkdir -p /root/.ssh && \
  chmod 0700 /root/.ssh && \
  ssh-keyscan github.com > /root/.ssh/known_hosts

# Add the keys and set permissions
RUN mv /root/.config/nvim/ssh/id_* /root/.ssh \
  && chmod 600 /root/.ssh/id_*

# git configurations
RUN git config --global user.email "stevenjin8@gmail.com" \
  && git config --global user.name "stevenjin8"

ENTRYPOINT /bin/zsh

RUN useradd -s /bin/zsh -m vscode \
 && groupadd docker \
 && usermod -aG docker vscode

# Gets read of GDB warnings
ENV LC_ALL=C
