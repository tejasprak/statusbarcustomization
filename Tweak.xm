#import <UIKit/UIKit.h>

@interface UIStatusBar : UIView
  -(void)setForegroundColor:(UIColor *)arg1;
  -(void)setTintColor:(id)arg1;
  -(void)setBackgroundColor:(UIColor *)arg1;
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

%end
%ctor {
  %init;
  NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/me.tejasp.statusbarcustomizationprefs.plist"];
  BOOL awesome = [prefs[@"statusBarColor"] boolValue];
  if(awesome) {
   %init(TextInBarColor);

  }
}

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
*/
/*
%group moreBullshit
%hook UIStatusBarDataNetworkItemView
-(void)setUserInteractionEnabled:(BOOL)set
{
	%orig(YES);
}
- (UIColor *) backgroundColor{
      return ([UIColor redColor]);
}
-(void)setBackgroundColor:(id)arg1 {
    %orig([UIColor redColor]);
  }
- (UIColor *) foregroundColor {
    return ([UIColor redColor]);
}
%end
%end
*/

/*
%hook UINavigationBar

- (id)backgroundColor {
	return([UIColor blackColor]);
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
