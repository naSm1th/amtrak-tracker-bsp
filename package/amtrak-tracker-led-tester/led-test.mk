################################################################################
#
# amtrak-tracker-led-tester
#
################################################################################

AMTRAK_TRACKER_LED_TESTER_VERSION = 7c2333c2ea29b7aa965013c9f577388599005d4e
AMTRAK_TRACKER_LED_TESTER_SOURCE = led_test-$(AMTRAK_TRACKER_LED_TESTER_VERSION).tar.gz
AMTRAK_TRACKER_LED_TESTER_SITE = https://www.github.com/naSm1th/amtrak-tracker-led-tester.git
AMTRAK_TRACKER_LED_TESTER_SITE_METHOD = git
AMTRAK_TRACKER_LED_TESTER_INSTALL_TARGET = YES

$(eval $(cargo-package))
