include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = statusbarcustomizationprefs
statusbarcustomizationprefs_FILES = SBCRootListController.m
statusbarcustomizationprefs_INSTALL_PATH = /Library/PreferenceBundles
statusbarcustomizationprefs_FRAMEWORKS = UIKit
statusbarcustomizationprefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/statusbarcustomizationprefs.plist$(ECHO_END)
