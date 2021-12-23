FROM gitpod/workspace-base

RUN sudo apt -y update && apt -y full-upgrade && apt -y install curl git build-essential

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1

RUN echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
RUN echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc

