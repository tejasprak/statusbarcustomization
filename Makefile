include $(THEOS)/makefiles/common.mk

TWEAK_NAME = statusbarcustomization
statusbarcustomization_FILES = Tweak.xm
statusbarcustomization_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += statusbarcustomizationprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
