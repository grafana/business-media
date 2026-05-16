FROM node@sha256:f6f9fae352b319e817eec5efc7721b3f06bc53104f2f800d0f778f3915835804

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