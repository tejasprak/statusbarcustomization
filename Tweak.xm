#import <UIKit/UIKit.h>

#define DARK_COLOR [UIColor colorWithRed:37.0f/255.0f green:37.0f/255.0f blue:37.0f/255.0f alpha:1.0f]

@interface UIStatusBar : UIView
  -(void)setForegroundColor:(UIColor *)arg1;
  -(void)setTintColor:(id)arg1;
  -(void)setBackgroundColor:(UIColor *)arg1;
@end
@interface UIStatusBarForegroundStyleAttributes
  @property (nonatomic,retain,readonly) UIColor * tintColor;
@end
@interface UIStatusBarDataNetworkItemView : UIView
  @property (nonatomic, copy, readwrite) UIColor *backgroundColor;
  @property (nonatomic, copy, readwrite) UIColor *foregroundColor;
@end
@interface UIStatusBarForegroundView
  @property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end
%group TextInBarColor
%hook UIStatusBar

  -(void)layoutSubviews{
	   // do setup
	    %orig();
      //declare prefs using NSDictionary and contentsFromFile
      NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/me.tejasp.statusbarcustomizationprefs.plist"];
      NSString *color = [prefs objectForKey:@"whatColor"];
      %log(color);
      //get the color value using key "whatColor"
      //if key is red, set red
      //if key is blue, set blue
      //if key is green, set green
      if([color isEqualToString:@"red"]) {
        [self setForegroundColor:[UIColor redColor]];
      } else if([color isEqualToString:@"blue"]) {
        [self setForegroundColor:[UIColor blueColor]];
      } else if([color isEqualToString:@"green"]) {
        [self setForegroundColor:[UIColor greenColor]];
      }
      NSString *bgColor = [prefs objectForKey:@"backgroundColor"];
      if([bgColor isEqualToString:@"red"]) {
        [self setBackgroundColor:[UIColor redColor]];
      } else if([bgColor isEqualToString:@"blue"]) {
        [self setBackgroundColor:[UIColor blueColor]];
      } else if([bgColor isEqualToString:@"green"]) {
        [self setBackgroundColor:[UIColor greenColor]];
      }
	     //[self setForegroundColor:[UIColor redColor]];
       //[self setBackgroundColor:[UIColor blueColor]];
       //[self setTintColor:[UIColor greenColor]];
       //not working
       // [self setTintColor:[UIColor blueColor]];
}
  /*-(void)setBackgroundColor:(id)arg1 { %orig([UIColor blackColor]); }*/

%end
/*
%hook UIStatusBarForegroundStyleAttributes

      }

%end
*/
/*
%hook UIStatusBarForegroundView
  - (UIColor *) backgroundColor {
      return([UIColor blueColor]);
  }

%end
%hook UIStatusBarDataNetworkItemView
- (UIColor *) backgroundColor{
      return ([UIColor greenColor]);
}
- (UIColor *) foregroundColor {
    return ([UIColor greenColor]);
}
*/
%end
/*
%hook UIStatusBarNewUIStyleAttributes
-(id)initWithRequest:(id)arg1 backgroundColor:(id)arg2 foregroundColor:(id)arg3 {
    arg1=nil;
    arg2=[UIColor blueColor];
    arg3=[UIColor greenColor];
    return %orig(arg1,arg2,arg3);
}

%end

%end
/*
%group AllColor
%hook UIStatusBarNewUIStyleAttributes
/*-(id)initWithRequest:(id)arg1 backgroundColor:(id)arg2 foregroundColor:(id)arg3 {
    arg1=nil;
    arg2=[UIColor redColor];
    arg3=[UIColor greenColor];
    return %orig(arg1,arg2,arg3);
}

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
*/
%ctor {
  %init;
  NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/me.tejasp.statusbarcustomizationprefs.plist"];
  BOOL awesome = [prefs[@"statusBarColor"] boolValue];
  if(awesome) {
   %init(TextInBarColor);
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
