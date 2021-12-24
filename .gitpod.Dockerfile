FROM gitpod/workspace-full

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN sudo -E apt -y update && sudo -E apt -y full-upgrade && sudo -E apt -y install curl git build-essential \
    autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev \
    libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1

RUN echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
RUN echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc

RUN $HOME/.asdf/bin/asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
RUN $HOME/.asdf/bin/asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git

RUN $HOME/.asdf/bin/asdf install erlang latest
RUN $HOME/.asdf/bin/asdf install elixir latest