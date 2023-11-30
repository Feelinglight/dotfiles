FROM ubuntu:22.04

RUN apt-get update

RUN apt-get install -y git language-pack-en curl libfuse2 host xz-utils fontconfig
RUN update-locale

RUN git clone https://github.com/Feelinglight/tools_tuning "/root/tools_tuning"

# zsh
WORKDIR "/root/tools_tuning/linux/zsh"
COPY ./key-bindings.zsh /usr/share/doc/fzf/examples/key-bindings.zsh
RUN sed -i 's/\bsudo \b//g' setup.sh
RUN ./setup.sh
# RUN chsh -s $(which zsh)

# nvim
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
RUN chmod +x nvim.appimage
RUN mv nvim.appimage /usr/local/bin/nvim

# Nerd fonts
RUN curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
RUN tar xf "./JetBrainsMono.tar.xz"
RUN mkdir -p "/root/.local/share/fonts"
RUN mv *.ttf "/root/.local/share/fonts"
RUN fc-cache "/root/.local/share/fonts"

WORKDIR /root
RUN rm -rf "/root/tools_tuning"

CMD /bin/zsh

