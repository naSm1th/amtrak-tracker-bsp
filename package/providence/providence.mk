################################################################################
#
# providence
#
################################################################################

PROVIDENCE_VERSION = 058cca898c676361f0a0ea3e306506cdb9b136a8
PROVIDENCE_SOURCE = providence-$(PROVIDENCE_VERSION).tar.gz
PROVIDENCE_SITE = https://www.github.com/naSm1th/providence.git
PROVIDENCE_SITE_METHOD = git
PROVIDENCE_INSTALL_TARGET = YES

$(eval $(cargo-package))
