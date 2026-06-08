FROM mcr.microsoft.com/playwright:v1.60.0-noble

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
