# Override host metadata to make builds more reproducible and avoid leaking info
export BUILD_HOSTNAME=lighthouse-build
export BUILD_USERNAME=lighthouse
export KBUILD_BUILD_USER=lighthouse
export KBUILD_BUILD_HOST=lighthouse-build