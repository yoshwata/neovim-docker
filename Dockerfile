FROM ubuntu:xenial

SHELL ["/bin/bash", "-c"]

RUN apt-get update && echo hoge && apt-get install -y \
    git \
    rsync \
    ncurses-dev \
    make \
    gcc \
    curl \
    zlib1g-dev \
    libssl-dev \
    libffi-dev \
    silversearcher-ag

# universal-ctags
RUN apt-get install autoconf pkg-config -y \
    && git clone https://github.com/universal-ctags/ctags.git \
    && cd ctags \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install

RUN cd \
    && curl -L -O https://github.com/neovim/neovim/releases/download/v0.3.4/nvim-linux64.tar.gz \
    && tar zxvf nvim-linux64.tar.gz \
    && ln -s /root/nvim-linux64/bin/nvim /usr/local/bin/nvim

# install neovim from ppa
# RUN apt-get install software-properties-common -y
# RUN add-apt-repository ppa:neovim-ppa/stable
# RUN apt-get update
# RUN apt-get install neovim -y
# RUN apt-get install python-dev python-pip python3-dev python3-pip -y
# RUN apt-get install python3-dev python3-pip -y
# RUN pip3 install --user pynvim

RUN curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh \
    && sh ./installer.sh ~/.cache/dein

COPY .config/ /root/.config/
COPY .vimrc /root/.config/nvim/.vimrc

# RUN /bin/bash -c 'nvim -c ":silent! call dein#install() | :q"'
RUN nvim +PlugInstall +qa

RUN cd \
    && git clone https://github.com/yoshwata/dotfiles.git \
    && cd dotfiles \
    && ./bootstrap.sh -f \
    && ./installfzf.sh

RUN git clone https://github.com/anyenv/anyenv ~/.anyenv \
    && echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile \
    && source ~/.bash_profile \
    && anyenv install --force-init \
    && echo 'eval "$(anyenv init -)"' >> ~/.bash_profile \
    && source ~/.bash_profile \
    && anyenv install nodenv \
    && source ~/.bash_profile \
    && nodenv install 8.15.1 \
    && nodenv global 8.15.1 \
    && nodenv local 8.15.1 \
    && npm install -g eslint
    # && anyenv install pyenv \
    # && source ~/.bash_profile \ 
    # && pyenv install 3.6.1 \
    # && pyenv global 3.6.1 \
    # && pyenv local 3.6.1 \
    # && pip3 install --user pynvim
