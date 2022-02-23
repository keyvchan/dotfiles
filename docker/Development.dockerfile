FROM archlinux:latest

# Install sudo 
RUN pacman -Syu sudo git base-devel wget --noconfirm
# Add user to sudoers
RUN echo "keyv ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Add user then change its password
RUN useradd keyv && mkdir /home/keyv && chown keyv:keyv /home/keyv && echo "keyv:keyv" | chpasswd
# Warning: change to your own password later

# Switch user
USER keyv
WORKDIR /home/keyv

RUN git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm
RUN yay -S neovim-git --noconfirm


ENV APPIMAGE_EXTRACT_AND_RUN=1

RUN wget https://github.com/keyvchan/dotfiles/releases/download/latest/config-linux -O config-linux && sudo chmod a+w /usr/local/bin && chmod a+x config-linux && ./config-linux
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim && nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
