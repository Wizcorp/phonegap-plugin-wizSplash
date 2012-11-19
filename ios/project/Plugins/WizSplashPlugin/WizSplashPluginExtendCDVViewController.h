/* WizSplashPluginExtendCDVViewController - Extend CDVViewController so we can reach splash view
 *
 * @author Ally Ogilvie
 * @copyright WizCorp Inc. [ Incorporated Wizards ] 2011
 * @file WizSplashPluginExtendCDVViewController.h for PhoneGap
 *
 */ 

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Cordova/CDVViewController.h>



@interface CDVViewController (extendViews)

- (CDVViewController*)showPGSplash;
- (CDVViewController*)hidePGSplash;

@end