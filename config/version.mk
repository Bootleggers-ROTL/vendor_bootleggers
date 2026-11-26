PRODUCT_VERSION_MAJOR = 8
PRODUCT_VERSION_MINOR = 6

ifneq ($(BOOTLEGGERS_BUILDTYPE), Shishufied)
    BOOTLEGGERS_BUILD_DATE := $(shell date +%Y%m%d-%H%M%S)
else
    BOOTLEGGERS_BUILD_DATE := $(shell date +%Y%m%d)
endif

# Set BOOTLEGGERS_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef BOOTLEGGERS_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "BOOTLEGGERS_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^BOOTLEGGERS_||g')
        BOOTLEGGERS_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Filter out random types, so it'll reset to UNOFFICIAL (a.k.a Unshishufied)
ifeq ($(filter Shishufied Unshishufied Testing,$(BOOTLEGGERS_BUILDTYPE)),)
    BOOTLEGGERS_BUILDTYPE := Testing
    BOOTLEGGERS_EXTRAVERSION :=
endif

ifeq ($(BOOTLEGGERS_BUILDTYPE), Unshishufied)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        BOOTLEGGERS_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

BOOTLEGGERS_VERSION_SUFFIX := $(BOOTLEGGERS_BUILD_DATE)-$(BOOTLEGGERS_BUILDTYPE)$(BOOTLEGGERS_EXTRAVERSION)-$(BOOTLEGGERS_BUILD)

# Internal version
BOOTLEGGERS_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(BOOTLEGGERS_VERSION_SUFFIX)

# Display version
BOOTLEGGERS_DISPLAY_VERSION := $(PRODUCT_VERSION_MAJOR)-$(BOOTLEGGERS_VERSION_SUFFIX)

# Bootleggers version properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.bootleggers.version=$(BOOTLEGGERS_VERSION) \
    ro.bootleggers.display.version=$(BOOTLEGGERS_DISPLAY_VERSION) \
    ro.bootleggers.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.bootleggers.releasetype=$(BOOTLEGGERS_BUILDTYPE)
