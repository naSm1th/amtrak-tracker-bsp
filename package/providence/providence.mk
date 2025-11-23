################################################################################
#
# providence
#
################################################################################

PROVIDENCE_VERSION = 9948f0f67562d58dca4b62ede1ec8dec6cded571
PROVIDENCE_SOURCE = providence-$(PROVIDENCE_VERSION).tar.gz
PROVIDENCE_SITE = https://www.github.com/naSm1th/providence.git
PROVIDENCE_SITE_METHOD = git
PROVIDENCE_INSTALL_TARGET = YES

$(eval $(cargo-package))
