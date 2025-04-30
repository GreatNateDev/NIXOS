
# Minimal GitHub Setup
read -p "GitHub Email: " email
read -p "GitHub Username: " username

# Git Config
git config --global user.name "$username"
git config --global user.email "$email"
git config --global init.defaultBranch main

# SSH Setup
SSH_DIR="$HOME/.ssh"
mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

# Generate Key
KEY_FILE="$SSH_DIR/id_ed25519"
rm "$KEY_FILE"
ssh-keygen -t ed25519 -C "$email" -N "" -f "$KEY_FILE"
chmod 600 "$KEY_FILE"
# Agent & Test
eval "$(ssh-agent -s)" && ssh-add "$KEY_FILE"
echo -e "\nPublic Key:\n$(cat "$KEY_FILE.pub")\n"
read -p "copy this and press enter"
xdg-open "https://github.com/settings/ssh/new"
read -p "paste and press enter"
ssh -T git@github.com