# Add user to docker group if not already member
if ! groups | grep -q '\bdocker\b'; then
  echo "Adding user to docker group..."
  sudo usermod -aG docker $USER
  echo "Warning: You need to log out and back in for group changes to take effect!"
  echo "Alternatively, run 'newgrp docker' in your current shell after this script completes."
fi

# Create DevKitPro directory
mkdir -p ~/.devkitpro

# Run DevKitPro installer in Docker container
echo "Installing DevKitPro via Docker..."
docker run --rm -v "$HOME/.devkitpro:/opt/devkitpro" ubuntu:22.04 \
  bash -c "apt-get update -qq && \
  apt-get install -y curl > /dev/null && \
  curl -sSL https://github.com/devkitPro/installer/releases/latest/download/devkitproupdater-linux-x86_64.run -o dkp-installer.run && \
  chmod +x dkp-installer.run && \
  ./dkp-installer.run --prefix=/opt/devkitpro --accept-licenses --confirm"

# Add environment variables to bashrc if not present
ENV_VARS=(
  "export DEVKITPRO=\"\$HOME/.devkitpro\""
  "export DEVKITARM=\"\$DEVKITPRO/devkitARM\""
  "export PATH=\"\$DEVKITPRO/tools/bin:\$PATH\""
)

for var in "${ENV_VARS[@]}"; do
  if ! grep -qF "$var" ~/.bashrc; then
    echo "$var" >> ~/.bashrc
  fi
done

# Verify installation
echo "Verifying installation..."
source ~/.bashrc
if command -v arm-none-eabi-gcc &> /dev/null; then
  arm-none-eabi-gcc --version | head -n 1
  echo "DevKitPro installed successfully!"
else
  echo "Installation verification failed. Please check the installation steps."
  exit 1
fi