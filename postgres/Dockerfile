FROM node@sha256:6d2c7d5d074bf72f81ddc252b4fbb5d625bc028eeda49cb4b8c2ff8eda1ee617

WORKDIR /app

# Install dependencies
RUN npm install pg

# Copy all assets and script
COPY ./load.ts .
COPY ./postgresql-14-US.pdf .
COPY ./image-panel.png .
COPY ./9.mp4 .
COPY ./call.mp3 .
COPY ./jupiter.jpg .
COPY ./jupiter.mp4 .
COPY ./saturn.jpg .
COPY ./saturn.mp4 .

# Run script
CMD ["node", "./load.ts"]