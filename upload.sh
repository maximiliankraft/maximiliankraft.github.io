#!/bin/bash

CONFIG_FILE="./secrets.sh"
if [ -f "$CONFIG_FILE" ]; then
    # due to this it needs to be started with `bash upload.sh`
    source "$CONFIG_FILE"
else
    echo "Configuration file $CONFIG_FILE not found. Please create it with the necessary variables."
    exit 1
fi


# Build the Jekyll site
echo "Building Jekyll site..."
cd "$SITE_DIR"
bundle exec jekyll build

# Check if the build was successful
if [ $? -ne 0 ]; then
    echo "Jekyll build failed. Exiting."
    exit 1
fi

# Upload to server via SFTP using identity file
echo "Uploading to server via SFTP..."
sftp -i "$IDENTITY_FILE" "$REMOTE_USER@$REMOTE_HOST" <<EOF
cd "$REMOTE_DIR"
put -r "$BUILD_DIR/"
bye
EOF

# Check if the upload was successful
if [ $? -ne 0 ]; then
    echo "SFTP upload failed. Exiting."
    exit 1
fi

echo "Build and upload completed successfully!"