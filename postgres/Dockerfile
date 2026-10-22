FROM node@sha256:a98e6fda54fdbb22d4238054cca9a2a113bcd1191c09193a535aae22f400aa8e

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