## Project

Flutter IPTV player. Cross-platform (mobile + web). Sources data from [iptv-org/api](https://iptv-org.github.io/api).

## Commands

```bash
flutter pub get
flutter analyze
flutter test
dart run build_runner build --delete-conflicting-outputs   # Drift codegen
```

## Architecture

- **State**: Riverpod (`ProviderScope` in `main.dart` overrides `appDatabaseProvider` and `sharedPreferencesProvider`)
- **Routing**: GoRouter `StatefulShellRoute.indexedStack` — 2 tabs (Home, Favorites) via `ShellScaffold`
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
    models/    — Channel, ChannelFeed, ChannelStream, Country, Language, Category, LogoEntry
    repositories/ — ChannelRepository, FavoritesRepository
    providers.dart — top-level providers (DB, DAOs, repos)
  features/
    home/      — HomeScreen (embedded player + browse/streams modes), providers, widgets
    favorites/ — FavoritesScreen
    settings/  — ThemeNotifier, ThemeMode selector
  shared/
    widgets/   — ShellScaffold, ChannelTile, Loading
.docs/         — gitignored dev docs (requirements, audits, impl plans)
```

## Testing

- Widget test uses `FakeIptvClient` (override `iptvClientProvider`) + `NativeDatabase.memory()` (override `appDatabaseProvider`).
- `MediaKit.ensureInitialized()` required before any test using player.

## Gotchas

- **`MediaKit.ensureInitialized()`** must be called before any `Player()` creation (both in app and tests).
- **Provider overrides required in tests** — `appDatabaseProvider`, `iptvClientProvider` (and potentially `sharedPreferencesProvider`). Otherwise they throw `StateError`.
- **Drift DB schema changes** require re-running `dart run build_runner build`.
- **`.docs/` is gitignored** — dev scratch space, not authoritative.
- **Search debounced at 300ms** via Timer in HomeScreen.

<!-- CODEGRAPH_START -->
## CodeGraph

In repositories indexed by CodeGraph (a `.codegraph/` directory exists at the repo root), reach for it BEFORE grep/find or reading files when you need to understand or locate code:

- **MCP tool** (when available): `codegraph_explore` answers most code questions in one call — the relevant symbols' verbatim source plus the call paths between them, including dynamic-dispatch hops grep can't follow. Name a file or symbol in the query to read its current line-numbered source. If it's listed but deferred, load it by name via tool search.
- **Shell** (always works): `codegraph explore "<symbol names or question>"` prints the same output.

If there is no `.codegraph/` directory, skip CodeGraph entirely — indexing is the user's decision.
<!-- CODEGRAPH_END -->
