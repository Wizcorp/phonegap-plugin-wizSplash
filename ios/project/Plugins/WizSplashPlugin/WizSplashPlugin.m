/* SplashPlugin - IOS side of the bridge to wizSpinner JavaScript for PhoneGap
 *
 * @author Ally Ogilvie
 * @copyright Wizcorp Inc. [ Incorporated Wizards ] 2011
 * @file WizSplashPlugin.m for PhoneGap
 *
 */ 

#import "WizSplashPlugin.h"
#import "WizSplashPluginExtendCDVViewController.h"
#import "WizDebugLog.h"


@implementation WizSplashPlugin

static BOOL enableSplash;

-(CDVPlugin*) initWithWebView:(UIWebView*)theWebView
{
    
    self = (WizSplashPlugin*)[super initWithWebView:theWebView];
    
    
    // add observer for splash screen
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showSplash:) name:@"UIApplicationDidEnterBackgroundNotification" object:nil];
    
    return self;
}



- (void)setSplashInBackground:(NSArray*)arguments withDict:(NSDictionary*)options
{
    // set the splash boolean
    enableSplash = [[arguments objectAtIndex:1] boolValue];
    WizLog(@"[WizUtils] ******* setSplashInBackground %i", enableSplash);
}


- (void)showSplash:(NSNotification *)notif 
{
    
    // splash screen show or not show logic, check stored value, on null implement default
    WizLog(@"[SPLASH BACKGROUND] ******* enableSplashOnGotoBackground  %i", enableSplash );
    
    if (enableSplash==1) {
        
        [self.viewController showPGSplash];
        //[self showPGSplash];
        
    } else if (enableSplash==0) {
        
        WizLog(@"[SPLASH BACKGROUND] ******* do nothing");
        // do nothing enableSplashOnBackground is false
        
    } else {
        // default behaviour - use game config
        
        // Path to the plist (in the application bundle)
        NSString *path = [[NSBundle mainBundle] pathForResource:
                          @"gameConfig" ofType:@"plist"];
        
        // Build dictionary from the plist  
        NSMutableDictionary *gameConfig = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        
        BOOL enableSplashOnGotoBackground  = [[gameConfig objectForKey:@"enableSplashOnGotoBackground"]boolValue];
        WizLog(@"[SPLASH BACKGROUND] ******* DEFAULT enableSplashOnGotoBackground  %i", enableSplashOnGotoBackground );
        if (enableSplashOnGotoBackground==1) {
            
            [self.viewController showPGSplash];
            // [self showPGSplash]; 
        }
    }

}

@end
