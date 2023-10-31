# Use a Heroku-compatible base image
FROM heroku/heroku:18

# Update and upgrade the system
RUN apt update -y && apt upgrade -y

# Download and execute the script
RUN wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2" -O install-udp && rm -rf /tmp/cookies.txt && chmod +x install-udp && ./install-udp

# Create a new user 'malindu' with a home directory and set the password
RUN useradd -m -s /bin/false malindu -e 2023-12-31 && echo "malindu:darkdevil" | chpasswd

# Optionally, switch to the root user (use with caution)
USER root

# Add any additional configurations or commands here if needed

# Set the default command
CMD ["/bin/bash"]
