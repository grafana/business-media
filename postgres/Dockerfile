FROM node@sha256:f5d1cc40abc10c2843339a2134d07817cf33c405cb16bfd052b0ed790254c3a3

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