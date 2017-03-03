
#define DARK_COLOR [UIColor colorWithRed:37.0f/255.0f green:37.0f/255.0f blue:37.0f/255.0f alpha:1.0f]

@interface UIStatusBar
  -(void)setForegroundColor:(UIColor *)arg1;
  -(void)setTintColor:(id)arg1;
@end

@interface UIStatusBarDataNetworkItemView : UIView
  @property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

%hook UIStatusBar
  -(void)layoutSubviews{
	   // do setup
	    %orig();
      //set the foreground color to red
	     [self setForegroundColor:[UIColor redColor]];
       [self setTintColor:[UIColor greenColor]];
       //not working
       // [self setTintColor:[UIColor blueColor]];
}

%end

%hook UIStatusBarDataNetworkItemView
-(void)setUserInteractionEnabled:(BOOL)set
{
	%orig(YES);
}
- (UIColor *) backgroundColor{
      return ([UIColor greenColor]);
}
%end
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
