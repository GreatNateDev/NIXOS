#!/usr/bin/env bash

# Add user to docker group (if not already)
if ! groups | grep -q '\bdocker\b'; then
  echo "Adding user to docker group..."
  sudo usermod -aG docker "$USER"
  echo "Warning: Log out and back in or run 'newgrp docker' to apply changes!"
fi

# Create persistent directory for devkitPro
mkdir -p ~/.devkitpro

# Install devkitPro using Docker
echo "Installing devkitPro pacman..."
sudo docker run --rm -v "$HOME/.devkitpro:/opt/devkitpro" ubuntu:22.04 \
  bash -c "apt-get update -qq && \
    apt-get install -y --no-install-recommends curl bzip2 git python3 pkg-config && \
    curl -sSL https://github.com/devkitPro/installer/releases/latest/download/devkitproupdater-linux-x86_64.run -o dkp-installer.run && \
    chmod +x dkp-installer.run && \
    ./dkp-installer.run --prefix=/opt/devkitpro --accept-licenses --confirm"

# Create a Docker wrapper script for devkitPro tools
cat << 'EOF' > ~/.devkitpro/docker-run.sh
#!/usr/bin/env bash
docker run --rm -it \
  -v "$HOME/.devkitpro:/opt/devkitpro" \
  -e DEVKITPRO=/opt/devkitpro \
  -e DEVKITARM=/opt/devkitpro/devkitARM \
  -e DEVKITPPC=/opt/devkitpro/devkitPPC \
  -v "$(pwd):/workdir" \
  -w /workdir \
  ubuntu:22.04 \
  /opt/devkitpro/tools/bin/$@
EOF
chmod +x ~/.devkitpro/docker-run.sh

# Add alias to bashrc
if ! grep -qF 'alias dkp=' ~/.bashrc; then
  echo "alias dkp='~/.devkitpro/docker-run.sh'" >> ~/.bashrc
  source ~/.bashrc
fi

# Verify installation
echo "Verifying installation..."
dkp dkp-pacman --version
