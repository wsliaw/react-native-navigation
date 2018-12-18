#import "UITabBarController+RNNOptions.h"
#import "RNNTabBarController.h"

@implementation UITabBarController (RNNOptions)

- (void)rnn_setCurrentTabIndex:(NSUInteger)currentTabIndex {
	[self setSelectedIndex:currentTabIndex];
}

- (void)rnn_setCurrentTabID:(NSString *)currentTabId {
	[(RNNTabBarController*)self setSelectedIndexByComponentID:currentTabId];
}

- (void)rnn_setTabBarTestID:(NSString *)testID {
	self.tabBar.accessibilityIdentifier = testID;
}

- (void)rnn_setTabBarBackgroundColor:(UIColor *)backgroundColor {
	self.tabBar.barTintColor = backgroundColor;
}

- (void)rnn_setTabBarStyle:(UIBarStyle)barStyle {
	self.tabBar.barStyle = barStyle;
}

- (void)rnn_setTabBarTranslucent:(BOOL)translucent {
	self.tabBar.translucent = translucent;
}

- (void)rnn_setTabBarHideShadow:(BOOL)hideShadow {
	self.tabBar.clipsToBounds = hideShadow;
}

- (void)rnn_setTabBarVisible:(BOOL)visible animated:(BOOL)animated {
    CGRect nextFrame = self.tabBar.frame;
    nextFrame.origin.y = UIScreen.mainScreen.bounds.size.height - (visible ? self.tabBar.frame.size.height : 0);
    
    [UIView animateWithDuration: (animated ? 0.15 : 0)
                          delay: 0
                        options: (visible ? UIViewAnimationOptionCurveEaseOut : UIViewAnimationOptionCurveEaseIn)
                     animations:^()
     {
         [self.tabBar setFrame:nextFrame];
     }
                     completion:^(BOOL finished)
     {}];
}

@end
