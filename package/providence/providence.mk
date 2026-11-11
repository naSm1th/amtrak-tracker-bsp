################################################################################
#
# providence
#
################################################################################

PROVIDENCE_VERSION = 355034f68f43f7983a16d7b662fc07320822b792
PROVIDENCE_SOURCE = providence-$(PROVIDENCE_VERSION).tar.gz
PROVIDENCE_SITE = https://www.github.com/naSm1th/providence.git
PROVIDENCE_SITE_METHOD = git
PROVIDENCE_INSTALL_TARGET = YES

$(eval $(cargo-package))
