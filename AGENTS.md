## Project

Flutter IPTV player. Cross-platform (mobile + web). Sources data from [iptv-org/api](https://iptv-org.github.io/api).

## Commands

```bash
flutter pub get
flutter analyze
flutter test
dart run build_runner build --delete-conflicting-outputs   # Drift codegen
dart format .
dart fix --apply
```

## Architecture

- **State**: Riverpod
- **Routing**: GoRouter
- **Database**: Drift (SQLite). Platform-specific executor via conditional export (`executor_io.dart` / `executor_web.dart`). After table changes: `dart run build_runner build`.
- **API**: Dio client (`IptvClient`) fetching JSON from iptv-org. Retry + log interceptors.
- **Player**: `media_kit` — `Player` + `VideoController` lifecycle in `HomeScreen` (ConsumerStatefulWidget, disposes in `dispose()`). Listens to `playerStateProvider` for URL changes.
- **Theme**: Material 3 dynamic color from `MaterialTheme` class. Google Fonts ('Inter Tight', 'Archivo Black'). Light/dark/system toggle via `ThemeNotifier` + `shared_preferences`.

## Structure

```
lib/
  core/        — constants, router, theme, util
  data/
    api/       — IptvClient (Dio)
    database/  — Drift tables, DAOs, executors (io + web)
    models/
    repositories/
    providers.dart — top-level providers (DB, DAOs, repos)
  features/
    home/      — HomeScreen (embedded player + browse/streams modes), providers, widgets
    favorites/ — FavoritesScreen
    settings/
  shared/
    widgets/
.docs/         — gitignored dev docs (requirements, audits, impl plans)
```

## AI Coding Rules — No Mess, No Anti-Patterns

- **No copy-paste.** Repeated logic → extract function/widget/constant. 2+ identical blocks = DRY violation.
- **No magic values.** String literals, numbers, durations → named constants in the relevant file or `core/constants/`.
- **No over-engineering.** One implementation = no abstract class/interface. One product = no factory. No config for values that never change. No "for later" scaffolding.
- **No mixing concerns.** Widgets don't write files. Providers don't render UI. Repos don't call providers. Single responsibility per file.
- **No side effects in constructors/build.** No API calls, DB writes, or navigation in initState/build. Use post-frame or async lifecycle.
- **No mutable public state.** All state through Riverpod providers. No global vars, no static mutable state. No `late` fields that can throw.
- **No lint/analyzer warnings.** `flutter analyze` must pass before commit. Fix all warnings, don't suppress them.
- **Minimal diff.** Change only what the task requires. If a file doesn't need touching, don't touch it.
- **Stdlib first.** Language built-ins > adding new dependency > writing custom code. Native platform feature > polyfill.
- **No single-use abstractions.** Don't extract a class/widget/function used exactly once unless it meaningfully improves clarity or testability.
- **One file per logical unit.** No god files >300 lines. Split when cohesion breaks, not before.

<!-- CODEGRAPH_START -->
## CodeGraph

In repositories indexed by CodeGraph (a `.codegraph/` directory exists at the repo root), reach for it BEFORE grep/find or reading files when you need to understand or locate code:

- **MCP tool** (when available): `codegraph_explore` answers most code questions in one call — the relevant symbols' verbatim source plus the call paths between them, including dynamic-dispatch hops grep can't follow. Name a file or symbol in the query to read its current line-numbered source. If it's listed but deferred, load it by name via tool search.
- **Shell** (always works): `codegraph explore "<symbol names or question>"` prints the same output.

If there is no `.codegraph/` directory, skip CodeGraph entirely — indexing is the user's decision.
<!-- CODEGRAPH_END -->
