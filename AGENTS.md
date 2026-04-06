# AGENTS.md — Business Media (Grafana Panel Plugin)

## Project Overview

Grafana panel plugin (TypeScript + React 18) that displays base64-encoded and URL-based
media files (images, video, audio, PDF) in Grafana dashboards.

- **Plugin ID:** `volkovlabs-image-panel`
- **Plugin type:** `panel`
- **Owner:** `@grafana/dataviz-squad`
- **Node version:** 24 (see `.nvmrc`)
- **Grafana dependency:** `>=12.0.0`

## Critical Rules

- **Do not use `volkovlabs.io` URLs** anywhere in the
  codebase. This project was forked from Volkov Labs
  and all references should point to Grafana equivalents
  (e.g., `grafana.com`).
- **Never modify anything inside `.config/`** —
  managed by Grafana plugin tooling.
- **Never change `id` or `type`** in `src/plugin.json`.
- Changes to `plugin.json` require a
  **Grafana server restart**.
- Use webpack from `.config/` for builds;
  do not add a custom bundler.
- Use `@grafana/plugin-e2e` for E2E tests.
- Grafana API docs:
  <https://grafana.com/developers/plugin-tools/llms.txt>
- **Always run `npx markdownlint-cli2`** on any `.md`
  file you create or modify (including `AGENTS.md`,
  `README.md`, `CHANGELOG.md`) and fix all reported
  issues before committing.
- **Always run `npm run typecheck`** when `src/` files
  are changed and fix any type errors before committing.
- **Always run cspell** after making changes:
  `npx cspell -c cspell.config.json
  "**/*.{ts,tsx,js,go,md,mdx,yml,yaml,json,scss,css}"`
  and fix any issues before committing. Add new words
  to `cspell.config.json` if they are legitimate.
- **Always update `CHANGELOG.md`** when committing any
  change. Include the changelog update in the same commit.
- **NEVER commit unless the user explicitly asks.**
  Do not commit as part of completing a task.
- **NEVER push unless the user explicitly asks.**
  Do not push as part of completing a task.
  Never chain `git commit && git push` in one command.
  Always wait for the user to explicitly ask to push.
- **After pushing, always update the PR summary** if a
  PR exists for the current branch. Treat push and PR
  update as an atomic pair — never stop between them.
  Use `gh pr edit` to update the title and body with
  well-formatted text that reflects all changes across
  the entire branch. **Wrap PR summary lines at 120
  characters** — use the full width, do not wrap
  shorter than necessary.
- **PR summaries must use categories** to organize
  changes. Group bullet points under headings like
  `### Added`, `### Fixed`, `### Changed`,
  `### Removed`, `### Dependencies`, `### CI/CD`,
  `### Documentation`, etc. Always include a
  `## Test plan` section with a checklist.
- **Never add "Generated with Claude" or similar
  attribution lines** to PR summaries, commit messages,
  or any other output.
- **Prefer subagents** for research, code exploration,
  and multi-step work. Use the Task tool with
  `explore` or `general` agents rather than running
  many search/read commands directly. Launch multiple
  agents in parallel when tasks are independent.

## Build / Lint / Test Commands

```bash
# Install dependencies
npm install

# Production build (webpack)
npm run build

# Dev build with watch mode
npm run dev

# Start local Grafana with plugin (Docker)
npm start                # default profile (grafana-enterprise:12.4.0)
npm run start:dev        # dev profile (grafana-enterprise-dev)
npm run start:dev:update # dev profile — fetch latest image tag first
npm run start:main       # main profile (grafana-enterprise:main)

# Stop all running containers
npm run stop

# Update grafana-enterprise-dev tag in .env (auto-fetches from Docker Hub)
bash scripts/update-grafana-dev.sh

# Type-check without emitting
npm run typecheck

# Lint
npm run lint
npm run lint:fix

# Unit tests — watch mode (default)
npm test

# Unit tests — CI mode with coverage
npm run test:ci

# Run a SINGLE test file
npx jest src/utils.test.ts
npx jest src/components/ImagePanel/ImagePanel.test.tsx

# Run tests matching a file path pattern
npx jest --testPathPattern="ImagePanel"

# Run a single test by name
npx jest -t "Should convert base64 to blob"

# E2E tests (Playwright)
npm run test:e2e           # headless
npm run test:e2e:dev       # with Playwright UI
npm run test:e2e:docker    # via Docker Compose
```

## Project Structure

```text
src/
  module.ts                       # PanelPlugin entry point
  plugin.json                     # Grafana plugin manifest
  migration.ts                    # Panel options version migration
  utils.ts                        # Shared utility functions
  components/
    ImagePanel/                   # Main panel component
    MediaSourcesEditor/           # Editor for media source configs
    Toolbar/                      # Toolbar with zoom/download/nav
  constants/
    default.ts                    # DEFAULT_OPTIONS
    media.ts                      # Media type constants, regex
    tests.ts                      # TEST_IDS for data-testid attrs
    toolbar.ts                    # Button/zoom option definitions
  hooks/
    useMediaData.tsx              # Processes media data from panel data
    useImageElementProperties.ts  # Computes image CSS from size mode
  types/
    image.ts                      # Enums: SupportedFileType, ImageSizeMode, MediaFormat
    panel.ts                      # PanelOptions interface, ImageScale enum
    toolbar.ts                    # ButtonType, ZoomType enums
  __mocks__/                      # Manual Jest mocks (@grafana/ui, @grafana/scenes, etc.)
test/                             # Playwright E2E tests
.config/                          # Grafana scaffolded config — DO NOT EDIT
```

## Code Style Guidelines

### Formatting (Prettier)

- Print width: 120, tab width: 2, no tabs
- Single quotes, trailing commas (`es5`), semicolons
- JSX uses double quotes
- End of line: auto

### Imports

1. **External packages first**, then internal modules — separated by a blank line.
2. Within each group, sort alphabetically.
3. External examples: `@emotion/css`, `@grafana/data`, `@grafana/ui`, `react`.
4. Internal imports use relative paths: `../../constants`, `../types`.
5. Every directory exports through a barrel `index.ts` — import from the barrel.

```typescript
import { css, cx } from '@emotion/css';
import { PanelProps } from '@grafana/data';
import { Alert, useStyles2 } from '@grafana/ui';
import React, { useCallback, useEffect, useMemo, useRef, useState } from 'react';

import { TEST_IDS } from '../../constants';
import { useImageElementProperties, useMediaData } from '../../hooks';
import { ImageSizeMode, MediaFormat, PanelOptions } from '../../types';
```

### Naming Conventions

| Kind             | Convention       | Example                                    |
|------------------|------------------|--------------------------------------------|
| Component files  | PascalCase       | `ImagePanel.tsx`                           |
| Style files      | `Name.styles.ts` | `ImagePanel.styles.ts`                     |
| Test files       | `Name.test.tsx`  | `ImagePanel.test.tsx`                      |
| Utility files    | camelCase        | `utils.ts`, `migration.ts`                 |
| Hooks            | `use` prefix     | `useMediaData.tsx`                         |
| Enums            | PascalCase name  | `enum MediaFormat { IMAGE = 'image' }`     |
| Enum values      | UPPER_SNAKE      | `ImageSizeMode.AUTO`                       |
| Interfaces       | PascalCase       | `PanelOptions`, `MediaSourceConfig`        |
| Constants        | UPPER_SNAKE      | `DEFAULT_OPTIONS`, `TEST_IDS`              |
| Functions        | camelCase        | `getMediaValue`, `base64toBlob`            |
| React components | PascalCase const | `export const ImagePanel: React.FC<Props>` |

### Component Patterns

- **Functional components only** with `React.FC<Props>` typing.
- **Styles:** Use `@emotion/css` with Grafana's `useStyles2(getStyles)` pattern.
- Style functions accept `GrafanaTheme2`:

  ```typescript
  export const getStyles = (theme: GrafanaTheme2) => ({
    wrapper: css` ... `,
  });
  ```

- Each component directory contains:
  `Component.tsx`, `Component.styles.ts`, `Component.test.tsx`, `index.ts`.

### Documentation

- Use `/** ... */` JSDoc comments on all exported functions, interfaces,
  enums, and constants.
- Use inline `/** Section Name */` comments to delineate logical sections
  within components.
- Document interface properties with `@type` annotations.

### Types

- Prefer **enums** for fixed option sets (`ImageSizeMode`, `MediaFormat`).
- Use **discriminated unions** when types have different shapes
  (see `MediaSourceElement`).
- Use generics for reusable utility functions:
  `const reorder = <T>(list: T[], ...) => ...`.

### Error Handling

- No try/catch — use null checks and optional chaining (`field?.getLinks`).
- Return `null` or `{ type: null }` for missing/invalid data.
- Show user-facing errors with Grafana's `<Alert severity="warning">`.

### Testing

- Colocate test files next to source (`Component.test.tsx` beside
  `Component.tsx`).
- Centralize test IDs in `src/constants/tests.ts` (`TEST_IDS` object).
- Select elements via `data-testid` attributes and `screen.getByTestId()`.
- Use `renderHook()` from `@testing-library/react` for hook tests.
- Use `jest.mock()` at the top of test files for external dependencies.
- Manual mocks live in `src/__mocks__/`.
- Factory pattern for test rendering:

  ```typescript
  const getComponent = (props: Partial<Props> = {}) =>
    <ImagePanel {...defaultProps} {...props} />;
  ```

- Use `@volkovlabs/jest-selectors` (`getJestSelectors`) for editor tests.

### CI/CD

- **CI** (`.github/workflows/push.yml`): Runs on push to `main` and all PRs. Lints, tests, builds, signs, and uploads artifacts.
- **CD** (`.github/workflows/publish.yml`): Release and publish workflow.
- The `.config/` directory is **scaffolded by Grafana** — do not edit files in it.

### ESLint

Flat config (ESLint 9) extending `@grafana/eslint-config/flat.js`,
`@volkovlabs/eslint-config`, and `eslint-config-prettier`. Custom rule:
`@typescript-eslint/no-empty-object-type: off`. Test files, mocks, config
files, and server dirs are excluded from linting.

### Additional Rules

- `no-console` and `no-debugger` are errors
- `@typescript-eslint/no-deprecated` is a warning — avoid
  using deprecated APIs
- Unused variables are errors (except rest siblings)

## Changelog Policy

**Always update `CHANGELOG.md` when making changes.** Every commit that
modifies code, documentation, dependencies, or configuration must have a
corresponding entry in the changelog under the current unreleased version
section. Add entries as part of the same commit or as a follow-up commit
before pushing.

## Branching Policy

- **Never commit directly to `main`**. Always create a new branch for changes.
- Use descriptive branch names (e.g., `feat/add-feature`, `fix/bug-description`).
- When pushing new commits to a PR, always update the PR summary to reflect all
  changes.
- **Always create pull requests as drafts**
  (`gh pr create --draft`).

## Important

Always create a branch before making any changes. Never commit directly to `main`.

Do not add a `Co-Authored-By` line to commit messages.

When checking out a branch or `main`, always `git fetch` and `git pull` to ensure you have the latest changes.
