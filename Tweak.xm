
#define DARK_COLOR [UIColor colorWithRed:37.0f/255.0f green:37.0f/255.0f blue:37.0f/255.0f alpha:1.0f]


@interface UIStatusBarDataNetworkItemView : UIView
  @property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end
%group TextInBarColor
%hook UIStatusBar
@interface UIStatusBar
  -(void)setForegroundColor:(UIColor *)arg1;
  -(void)setTintColor:(id)arg1;
@end
  -(void)layoutSubviews{
	   // do setup
	    %orig();
      //set the foreground color to red
	     [self setForegroundColor:[UIColor redColor]];
       //[self setTintColor:[UIColor greenColor]];
       //not working
       // [self setTintColor:[UIColor blueColor]];
}

%end
%end
%group AllColor
%hook UIStatusBarNewUIStyleAttributes
/*-(id)initWithRequest:(id)arg1 backgroundColor:(id)arg2 foregroundColor:(id)arg3 {
    arg1=nil;
    arg2=[UIColor redColor];
    arg3=[UIColor greenColor];
    return %orig(arg1,arg2,arg3);
}*/

%end
%end

%group moreBullshit
%hook UIStatusBarDataNetworkItemView
-(void)setUserInteractionEnabled:(BOOL)set
{
	%orig(YES);
}
- (UIColor *) backgroundColor{
      return ([UIColor greenColor]);
}
%end
%end
%ctor {
  %init;
  NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/me.tejasp.statusbarcustomizationprefs.plist"];
  BOOL awesome = [prefs[@"statusBarColor"] boolValue];
  if(awesome) {
      %init(TextInBarColor);
  } else {
      %init(AllColor);
      %init(moreBullshit);
  }
}
/*
%hook UINavigationBar

- (id)backgroundColor {
	return DARK_COLOR;
}

%end
*/

/*
%hook UIStatusBarDataNetworkItemView
  -(void)layoutSubviews {
      %orig();
      [self setForegroundColor:[UIColor greenColor]];
  }
%end
*/
