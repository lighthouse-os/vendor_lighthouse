PRODUCT_PACKAGES += \
    ThemePicker \

# Extra tools in Lighthouse
PRODUCT_PACKAGES += \
    bash \
    curl \
    getcap \
    htop \
    libsepol \
    nano \
    setcap \
    vim

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Lighthouse packages
PRODUCT_PACKAGES += \
    MatLog \
    OpenDelta \
    PhotonCamera

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/curl \
    system/bin/getcap \
    system/bin/setcap

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/fsck.ntfs \
    system/bin/mkfs.ntfs \
    system/bin/mount.ntfs \
    system/%/libfuse-lite.so \
    system/%/libntfs-3g.so

ifneq ($(TARGET_BUILD_GAPPS),true)
PRODUCT_PACKAGES += \
    Apps \
    Etar \
    ExactCalculator \
    GmsCompat \
    Jelly \
    LatinIME \
    messaging \
    Seedvault \
    SetupWizard
endif

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Config
PRODUCT_PACKAGES += \
    SimpleDeviceConfig

# Repainter integration
PRODUCT_PACKAGES += \
    RepainterServicePriv
