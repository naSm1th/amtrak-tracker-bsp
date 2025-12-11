################################################################################
#
# providence
#
################################################################################

PROVIDENCE_VERSION = 1074776195ead5caeffc523acb26446f9c9c7e6a
PROVIDENCE_SOURCE = providence-$(PROVIDENCE_VERSION).tar.gz
PROVIDENCE_SITE = https://www.github.com/naSm1th/providence.git
PROVIDENCE_SITE_METHOD = git
PROVIDENCE_INSTALL_TARGET = YES

$(eval $(cargo-package))
