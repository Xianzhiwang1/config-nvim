FROM ubuntu:18.04

RUN yes y | unminimize

RUN apt-get -qq update && apt-get install -yq \
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

# This hasn't hit apt yet
# Install neovim
RUN curl -LO "https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.tar.gz" \
  && tar -xzvf nvim-linux64.tar.gz

# Add neovim to path
ENV PATH="/nvim-linux64/bin/:${PATH}"

# RUN mkdir -p /root/.config/nvim

ADD . /root/.config/nvim

# Install packer
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim /root/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install pakcer packages
# RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

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

ENTRYPOINT /bin/zsh

# Gets read of GDB warnings
ENV LC_ALL=C
