FROM node@sha256:1b84b89ada025e3b14543cbb837ffaa1c1b5273b841c5b94dd1a8f9c1d8cf7fe

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