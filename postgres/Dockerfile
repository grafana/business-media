FROM node@sha256:2495bb8bc48c8a04438f9c8260add59c6b4a214741a3bfbe30ad237b3036a0c8

WORKDIR /app

# Install dependencies
RUN yarn add pg

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