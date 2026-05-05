TERMUX_PKG_HOMEPAGE=https://github.com/ImL1s/termux-flutter-wsl
TERMUX_PKG_DESCRIPTION="Termux Flutter WSL tooling repackaged for android.zero.studio"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="zero studio"
TERMUX_PKG_VERSION=1.0.0
TERMUX_PKG_SRCURL=https://github.com/ImL1s/termux-flutter-wsl/archive/refs/heads/main.tar.gz
TERMUX_PKG_SHA256=SKIP_CHECKSUM
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="bash, git, curl"
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure() {
	cd "$TERMUX_PKG_SRCDIR"
	if [ -f android/app/build.gradle ]; then
		sed -i 's/applicationId[[:space:]]\+"[^"]*"/applicationId "android.zero.studio"/g' android/app/build.gradle
	fi
	if [ -f android/app/src/main/AndroidManifest.xml ]; then
		sed -i 's/package="[^"]*"/package="android.zero.studio"/g' android/app/src/main/AndroidManifest.xml
	fi
}

termux_step_make_install() {
	install -Dm700 "$TERMUX_PKG_BUILDER_DIR/files/pull-termux-flutter-wsl.sh" "$TERMUX_PREFIX/bin/pull-termux-flutter-wsl"
	install -Dm700 "$TERMUX_PKG_BUILDER_DIR/files/build-termux-flutter-wsl.sh" "$TERMUX_PREFIX/bin/build-termux-flutter-wsl"
	install -d "$TERMUX_PREFIX/share/termux-flutter-wsl"
	cp -a "$TERMUX_PKG_SRCDIR"/. "$TERMUX_PREFIX/share/termux-flutter-wsl/"
}
