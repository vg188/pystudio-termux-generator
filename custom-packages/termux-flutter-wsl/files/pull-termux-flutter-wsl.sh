#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

TARGET_DIR="${1:-$HOME/termux-flutter-wsl}"
if [ -d "$TARGET_DIR/.git" ]; then
  git -C "$TARGET_DIR" pull --ff-only
else
  git clone https://github.com/ImL1s/termux-flutter-wsl "$TARGET_DIR"
fi

if [ -f "$TARGET_DIR/android/app/build.gradle" ]; then
  sed -i 's/applicationId[[:space:]]\+"[^"]*"/applicationId "android.zero.studio"/g' "$TARGET_DIR/android/app/build.gradle"
fi
if [ -f "$TARGET_DIR/android/app/src/main/AndroidManifest.xml" ]; then
  sed -i 's/package="[^"]*"/package="android.zero.studio"/g' "$TARGET_DIR/android/app/src/main/AndroidManifest.xml"
fi

echo "Repository ready at: $TARGET_DIR"
