################################################################################
#
# led-test
#
################################################################################

LED_TEST_VERSION = 1.0
LED_TEST_SITE = $(BR2_EXTERNAL_AMTRAK_MIDWEST_TEST_PATH)/package/led-test/src
LED_TEST_SITE_METHOD = local
LED_TEST_INSTALL_TARGET = YES
LED_TEST_DEPENDENCIES = host-pkgconf

$(eval $(cmake-package))
