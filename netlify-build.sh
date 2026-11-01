
#!/usr/bin/env bash
set -e

# Install Flutter SDK
git clone https://github.com/flutter/flutter.git --depth 1 -b stable "$HOME/flutter"
export PATH="$HOME/flutter/bin:$PATH"

flutter --version
flutter pub get
flutter build web --release
