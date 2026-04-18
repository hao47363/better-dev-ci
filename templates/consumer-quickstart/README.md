# Consumer quick-start (copy into your app repository)

These folders are **examples only**: nothing here runs in the tooling repo. Copy the two paths into an **application** repository that calls `universal-ci` with `use_project_commands: true` (the default).

| Stack | Copy these files into your repo |
| --- | --- |
| **Next.js** (npm preset) | [`nextjs/…`](nextjs/) (includes `ci.yml` plus PR automation, stale, labeler, and PR intelligence callers in `.github/workflows/`) |
| **Laravel** | [`laravel/…`](laravel/) (same bundled workflow layout as Next.js) |
| **Flutter** | [`flutter/…`](flutter/) (same bundled workflow layout as Next.js) |
| **Custom** | [`custom/…`](custom/) — set non-empty `commands.*` (no stack presets); same bundled workflow layout as Next.js. |
| **Optional automations** (PR automation, stale, labeler, PR intelligence) | [`optional-workflows/`](optional-workflows/README.md) — standalone copies of the same callers if you want to mix into an existing setup. |

## Before you copy

1. **Pin the same ref everywhere** — the `@stable` (or **tag** / **SHA**) on `uses: …/universal-ci.yml@…` must match **`tooling_ref`** (and exist on **`tooling_repository`**).
2. **Replace owner/repo** if your published tooling is not **`hao47363/better-dev-ci`**.
3. **Optional** — uncomment `runtime_version` in `ci.yml` to pin Node, PHP, or Flutter.
4. **pnpm / Yarn** — keep `stack: nextjs` but set `commands.install`, `commands.lint`, etc. in `repo-settings.yml` (presets assume **npm**).

## Validate bundled workflow values

All stack quickstarts now bundle `ci.yml`, `pr-automation.yml`, `pr-intelligence.yml`, `labeler.yml`, and `stale.yml`.

Check these values after copy:

1. **`uses:` + `tooling_repository` + `tooling_ref`** point to your published tooling repo/ref in every workflow file.
2. **`tooling_auth_mode`** is `none` for public tooling; use `pat` for private tooling and add `GH_CI_REPO_TOKEN`.
3. **`automation.auto_pr_base_branch`** in `.template/repo-settings.yml` matches your real default branch (for example `main` or `master`).
4. **`.github/labeler.yml`** is present (quickstarts include a starter file; customize labels/globs for your repo).

## Private tooling repository

If the tooling repo is private, set `tooling_auth_mode: pat`, add **`GH_CI_REPO_TOKEN`** on the app repo, and use the same pattern as [README.md](../../README.md) (private tooling section).
