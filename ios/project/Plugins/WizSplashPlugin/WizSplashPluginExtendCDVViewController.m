/* WizSplashPluginExtendCDVViewController - Extend CDVViewController so we can reach splash view
 *
 * @author Ally Ogilvie
 * @copyright WizCorp Inc. [ Incorporated Wizards ] 2011
 * @file WizSplashPluginExtendCDVViewController.m for PhoneGap
 *
 */ 

#import "WizSplashPluginExtendCDVViewController.h"
#import "WizDebugLog.h"

#define degreesToRadians(x) (M_PI * x / 180.0)

@implementation CDVViewController (extendViews) 


-(CDVViewController*)showPGSplash

{
    
    [self.imageView setHidden:FALSE];
    
    return NULL;
}

-(CDVViewController*)hidePGSplash

{
    
    [self.imageView setHidden:TRUE];
    
    return NULL;
}


@end
