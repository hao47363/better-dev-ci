# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Added DRY principle guidance to `docs/governance/code-quality-playbook.md` with practical application notes and references.
- Added atomic component folder structure guidance (`atoms`/`molecules`/`organisms`/`templates`/`pages`) to `docs/governance/code-quality-playbook.md`.

### Changed

- Replaced Reddit-based references in `docs/governance/community-best-practices-report.md` with Stack Overflow and engineering-reference sources.
- Updated `README.md` wording for `docs/governance/community-best-practices-report.md` to use source-neutral phrasing.
- Added stack-based command presets so `project.stack` values (`nextjs`, `laravel`, `flutter`, `python`) resolve default install/lint/test/build commands when `commands.*` are empty.
- Updated template and reference docs to clarify that only `custom` requires manual `commands.*` configuration.

### Deprecated

### Removed

### Fixed

### Security

## [0.1.0] - 2026-04-17

### Added

- Added `docs/README.md` as a centralized documentation index with task-based navigation.
- Added governance documentation set under `docs/governance/`:
  - `naming-conventions.md`
  - `linting-strategy.md`
  - `changelog-guidelines.md`
  - `code-quality-playbook.md`
  - `release-versioning.md`
  - `community-best-practices-report.md`
- Added structured docs for operations/reference:
  - `docs/operations/ci-devx-flow.md`
  - `docs/reference/configuration-reference.md`
- Added code quality and review guidance (mandatory vs recommended rules, review checklist, exceptions policy).
- Added release/tagging policy for SemVer-based `vMAJOR.MINOR.PATCH` releases.
- Added community-backed best-practice report based on Stack Overflow and Reddit references.

### Changed

- Updated `README.md` documentation links to reflect the new folder-based documentation architecture.
- Expanded naming conventions to include variable naming defaults (`camelCase`) and constant naming (`UPPER_SNAKE_CASE`), with JS/TS declaration guidance (`const`/`let`, no `var`).
- Reorganized docs to keep repository root clean and move policy/process docs into dedicated subfolders.

### Removed

- Removed legacy flat docs files from `docs/` after migration to structured folders:
  - `docs/naming-conventions.md`
  - `docs/linting-strategy.md`
  - `docs/changelog-guidelines.md`
  - `docs/ci-devx-flow.md`
  - `docs/configuration-reference.md`
