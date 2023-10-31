FROM ubuntu:latest

# Update and upgrade the system
RUN apt-get update -y && apt-get upgrade -y

# Install necessary packages
RUN apt-get install -y wget sudo

# Download the file from Google Drive
RUN wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2" -O /install-udp && rm -rf /tmp/cookies.txt && chmod +x /install-udp

# Create a new user 'malindu' with the specified expiration date
RUN useradd -m -s /bin/false malindu -e 2023-12-31

# Set a password for the 'malindu' user
RUN echo "malindu:darkdevil" | chpasswd
