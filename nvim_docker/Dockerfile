FROM ubuntu:22.04

RUN apt-get update

RUN apt-get install -y git language-pack-en curl libfuse2
RUN update-locale

RUN git clone https://github.com/Feelinglight/tools_tuning

WORKDIR "tools_tuning/linux/zsh"
COPY ./key-bindings.zsh /usr/share/doc/fzf/examples/key-bindings.zsh
RUN sed -i 's/\bsudo \b//g' setup.sh
RUN ./setup.sh
# RUN chsh -s $(which zsh)


RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
RUN chmod +x nvim.appimage
RUN mv nvim.appimage /usr/local/bin/nvim

WORKDIR /root

CMD /bin/zsh

