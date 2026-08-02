flutter build apk --split-per-abi \
--dart-define=APP_VERSION=$(grep '^version:' pubspec.yaml | sed 's/version: //') \
--dart-define=COMMIT_HASH=$(git rev-parse --short HEAD) \
--dart-define=GITHUB_REPO_URL=https://github.com/ikhsan3adi/sycorax_cressida
