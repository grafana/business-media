FROM mcr.microsoft.com/playwright:v1.59.1-noble@sha256:b0ab6f3cb99aa7803adbc14d9027ec1785fc6e433b97e134e0f8fe61683b6b53

WORKDIR app

# Copy package manifests first so npm ci is cached independently of source changes
COPY package.json package-lock.json ./

RUN npm ci

# Install browsers — cached alongside npm ci, only reruns when packages change
RUN npx playwright install --with-deps chromium

# Copy only what the tests need at runtime.
# src/ is required because test utilities import constants from it.
# provisioning/ is required by readProvisionedDashboard().
COPY playwright.config.ts ./
COPY src/ ./src/
COPY provisioning/ ./provisioning/
COPY test/ ./test/

CMD ["npm", "run", "test:e2e"]
