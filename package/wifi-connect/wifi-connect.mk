################################################################################
#
# wifi-connect
#
################################################################################

WIFI_CONNECT_VERSION = 5bd4c1bea548fb5714bedb18bbd12f088d5fa407
WIFI_CONNECT_SOURCE = wifi_connect-$(WIFI_CONNECT_VERSION).tar.gz
WIFI_CONNECT_SITE = https://www.github.com/balena-os/wifi-connect.git
WIFI_CONNECT_SITE_METHOD = git
WIFI_CONNECT_INSTALL_TARGET = YES

$(eval $(cargo-package))

define WIFI_CONNECT_DOWNLOAD_POST_PROCESS_CUSTOM
    $(APPLY_PATCHES) $(@D) $(BR2_EXTERNAL_AMTRAK_MIDWEST_TEST_PATH)/package/wifi-connect/custom_patch/
	mkdir -p .cargo/
	cd $(WIFI_CONNECT_SRCDIR) && \
	$(TARGET_MAKE_ENV) \
		$(TARGET_CONFIGURE_OPTS) \
		$(PKG_CARGO_ENV) \
		$(WIFI_CONNECT_CARGO_ENV) \
		cargo vendor \
    	--manifest-path $(@D)/Cargo.toml \
    	--locked VENDOR \
    	> .cargo/config.toml
endef

WIFI_CONNECT_POST_EXTRACT_HOOKS += WIFI_CONNECT_DOWNLOAD_POST_PROCESS_CUSTOM