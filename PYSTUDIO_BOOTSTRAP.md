# PyStudio bootstrap build

This fork builds a PyStudio bootstrap for:

- Package name: `com.vchangxiao.pystudio`
- Prefix: `/data/data/com.vchangxiao.pystudio/files/usr`
- Default architecture: `aarch64`
- Build method: `termux-generator` with the F-Droid bootstrap patches

## GitHub Actions

Use the `Build PyStudio Bootstrap` workflow. The default dispatch builds only `aarch64` and publishes a release.

Expected artifacts:

- `bootstrap-aarch64.tar.xz`
- `com.vchangxiao.pystudio-f-droid-bootstrap-aarch64.tar.xz`
- `xz-aarch64/xz`
- `xz-aarch64/liblzma.so.5`
- `pystudio-bootstrap-assets-aarch64.tar.gz`
- `SHA256SUMS.txt`

The `pystudio-bootstrap-assets-*.tar.gz` archive preserves the asset layout needed by the `local-bootstraps.patch` installer logic.
