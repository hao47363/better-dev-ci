# Universal Repo Template Docs

A governance-first template system for framework projects that keeps application ownership at root while enforcing consistent engineering standards.

## What this includes

- Branch naming, commit message, and PR title validation
- Config-driven `install`/`lint`/`test`/`build` execution
- Optional PR automation, labeler, and stale management workflows
- Local git hooks with Lefthook
- Stack-aware command defaults for Laravel, Next.js, Flutter, and Python
- Structured governance docs, release policy, and quality playbook

This template intentionally avoids owning root `README.md` and `CHANGELOG.md` so framework-generated project files can remain the primary source of truth.

## Quick start

1. Create a new repository from this template in GitHub.
2. Clone it locally.
3. Initialize your framework safely from template context:

```bash
sh ./governance-pack/scripts/init_project.sh <laravel|nextjs|flutter|python>
```

Examples:

```bash
sh ./governance-pack/scripts/init_project.sh laravel
sh ./governance-pack/scripts/init_project.sh nextjs
sh ./governance-pack/scripts/init_project.sh flutter
sh ./governance-pack/scripts/init_project.sh python "uv init \"$INIT_TARGET_DIR\""
```

4. Set stack and options in `.template/repo-settings.yml`.
5. Install hooks:

```bash
lefthook install
```

6. Push a feature branch and open a PR.

## Setup modes

- **Framework-first mode (recommended)**  
  Use `init_project.sh` to scaffold framework files without breaking governance assets.

- **Custom mode**  
  Set `project.stack: custom` and define all `commands.*` manually in `.template/repo-settings.yml`.

- **Preset mode**  
  Set stack to one of `laravel`, `nextjs`, `flutter`, `python` and leave `commands.*` empty to use built-in defaults.

## Stack behavior

- **`laravel`** defaults:
  - `install`: `composer install`
  - `lint`: `vendor/bin/pint --test`
  - `test`: `php artisan test`
  - `build`: empty
- **`nextjs`** defaults:
  - `install`: `npm ci`
  - `lint`: `npm run lint`
  - `test`: `npm test`
  - `build`: `npm run build`
- **`flutter`** defaults:
  - `install`: `flutter pub get`
  - `lint`: `flutter analyze`
  - `test`: `flutter test`
  - `build`: `flutter build apk`
- **`python`** defaults:
  - `install`: `pip install -r requirements.txt`
  - `lint`: `ruff check .`
  - `test`: `pytest -q`
  - `build`: empty

Any `commands.*` value you set manually overrides stack defaults.

## Documentation map

- Bootstrap and migration flow: `governance-pack/docs/operations/bootstrap-flow.md`
- CI and DevX flow: `governance-pack/docs/operations/ci-devx-flow.md`
- Configuration reference: `governance-pack/docs/reference/configuration-reference.md`
- Naming conventions: `governance-pack/docs/governance/naming-conventions.md`
- Linting strategy: `governance-pack/docs/governance/linting-strategy.md`
- Code quality playbook: `governance-pack/docs/governance/code-quality-playbook.md`
- Changelog guidelines: `governance-pack/docs/governance/changelog-guidelines.md`
- Release/versioning policy: `governance-pack/docs/governance/release-versioning.md`
- Community best-practice report: `governance-pack/docs/governance/community-best-practices-report.md`
- Template changelog: `governance-pack/docs/governance/template-changelog.md`

## Required GitHub settings

- Repository Actions enabled
- Workflow permissions aligned with enabled automations
- If using auto PR features, allow Actions to create pull requests

## Structure policy

- Keep root minimal and framework-owned where possible
- Keep GitHub-native files under `.github/`
- Keep template-owned docs/scripts/templates under `governance-pack/`
