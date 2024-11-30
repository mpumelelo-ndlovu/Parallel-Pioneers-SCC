#!/bin/bash

# Function to log messages
log_message() {
  echo "$(date +"%Y-%m-%d %T") - $1"
}

log_message "Starting Intel oneAPI repository setup..."

# Step 1: Download the Intel GPG key and add it to the system keyring
log_message "Downloading Intel GPG key and adding it to the system keyring..."
wget -qO- https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB | gpg --dearmor | sudo tee /usr/share/keyrings/oneapi-archive-keyring.gpg > /dev/null
if [ $? -eq 0 ]; then
  log_message "Successfully added the Intel GPG key to the keyring."
else
  log_message "Failed to add the Intel GPG key to the keyring. Exiting."
  exit 1
fi

# Step 2: Add the Intel repository to the APT sources list
log_message "Adding Intel repository to APT sources list..."
echo "deb [signed-by=/usr/share/keyrings/oneapi-archive-keyring.gpg] https://apt.repos.intel.com/oneapi all main" | sudo tee /etc/apt/sources.list.d/oneAPI.list > /dev/null
if [ $? -eq 0 ]; then
  log_message "Successfully added Intel repository to APT sources list."
else
  log_message "Failed to add Intel repository to APT sources list. Exiting."
  exit 1
fi

# Step 3: Update the package index
log_message "Updating the APT package index..."
sudo apt update -y
if [ $? -eq 0 ]; then
  log_message "APT package index updated successfully."
else
  log_message "Failed to update the APT package index. Exiting."
  exit 1
fi

log_message "Intel oneAPI repository setup completed successfully."
