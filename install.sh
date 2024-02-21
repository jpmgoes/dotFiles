# executar tudo em sudo su
echo "[01] - Iniciando script"
apt update -y && apt upgrade -y

echo "[02] - Instalando dependencias"
apt install net-tools -y
apt install fd-find -y
apt install git -y

curl -LO https://github.com/sharkdp/fd/releases/download/v9.0.0/fd-musl_9.0.0_amd64.deb
sudo dpkg -i fd-musl_9.0.0_amd64.deb

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb

echo "[03] - Ativando login com root pelo ssh"
passwd root
passwd -u root

echo "[04] - Configurando root no ssh"
SSH_CONF="PermitRootLogin yes
$(cat /etc/ssh/sshd_config)"
echo "$SSH_CONF" >/etc/ssh/sshd_config

service ssh restart

echo "[05] - Instalando zsh"
apt install zsh -y

echo "[06] - Preparando zsh"
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "[07] - Recuperando dotFiles"
cd ~/
git clone https://github.com/jpmourag/dotFiles.git

echo "[08] - Adicionando e configurando asdf"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

echo "[09] - Configurando zsh"
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
cp ~/dotFiles/zsh_config/.zshrc ~/

echo "[10] - Adicionando NodeJS"
asdf plugin add nodejs
asdf install nodejs $INSTALL_NODE_VERSION
asdf global nodejs $INSTALL_NODE_VERSION

# asdf plugin add (nodejs, python, java)
# asdf list all (nodejs, python, java)
# asdf install (nodejs, python, java) (version)
# asdf global (nodejs, python, java) (version)

echo "[11] - Adicionando Libs Úteis"
npm i -g fkill
npm i -g npkill

echo "[12] - Instalando e configurando lazyvim e nvim"
apt install build-essential -y
apt remove neovim -y
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
export PATH="$PATH:/opt/nvim-linux64/bin"

echo "[13] - Movendo nvim config"
mkdir -p ~/.config/nvim
cp -r ~/dotFiles/nvim/lazyvim_config/nvim ~/.config/

systemctl disable network-manager.service
systemctl stop network-manager.service

echo "[14] Instalando Cockpit"
. /etc/os-release
sudo apt install -t ${VERSION_CODENAME}-backports cockpit

echo "[15] - Script finalizado"

zsh

# INSTALL_NODE_VERSION=20.11.1 && curl https://raw.githubusercontent.com/jpmourag/dotFiles/master/install.sh > install.sh && sh install.sh
