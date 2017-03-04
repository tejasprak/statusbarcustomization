#include "SBCRootListController.h"

@implementation SBCRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

-(void)respring {
        #pragma GCC diagnostic push
	#pragma GCC diagnostic ignored "-Wdeprecated-declarations" 
	system("killall -9 SpringBoard");
	#pragma GCC diagnostic pop
}

@end
