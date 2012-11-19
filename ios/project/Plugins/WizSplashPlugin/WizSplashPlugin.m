/* SplashPlugin - IOS side of the bridge to wizSplash JavaScript for PhoneGap
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

static BOOL isSplashSettingSpecified;
static BOOL enableSplash;
static BOOL defaultEnableSplashOnGotoBackground;

#pragma - Class Methods

+ (void)load
{
    // Register for didEnterBackground notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didEnterBackground:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
    
    // Register for willTerminate notifications here so that we can unregister observing
    // notifications.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(willTerminate:)
                                                 name:UIApplicationWillTerminateNotification
                                               object:nil];
    
    // Path to the plist (in the application bundle)
    NSString *path = [[NSBundle mainBundle] pathForResource:@"wizSplash" ofType:@"plist"];
    
    // Build dictionary from the plist
    NSMutableDictionary *options = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    
    if ( options == nil ) {
        [NSException raise:NSInternalInconsistencyException
                    format:@"Missing wizSplash.plist -- required when using the wizSplash plugin.  Please add it to your application bundle."];
    }
    
    // Read specified defaults.
    defaultEnableSplashOnGotoBackground = [[options objectForKey:@"enableSplashOnGotoBackground"]boolValue];
    
    // Set default state (app did not yet specify the splash setting so default will be used).
    isSplashSettingSpecified = NO;
}

+ (void)didEnterBackground:(NSNotification *)notification
{
    // Cordova apps have the view controller on the app delegate
    CDVViewController *viewController = nil;
    id <UIApplicationDelegate> appDelegate = [UIApplication sharedApplication].delegate;
    SEL viewControllerSelector = @selector(viewController);
    
    // Forces Cordova to pre-create the plugin command singleton (if it doesn't already exist)
    if ( [appDelegate respondsToSelector:viewControllerSelector] ) {
        viewController = [appDelegate performSelector:viewControllerSelector];
        SEL getCommandInstanceSelector = @selector(getCommandInstance:);
        if ( [viewController respondsToSelector:getCommandInstanceSelector] ) {
            
            // Create/get the singleton.
            WizSplashPlugin *plugin = [viewController getCommandInstance:@"WizSplashPlugin"];
            
            if ( isSplashSettingSpecified ) {
                // splash screen show or not show logic, check stored value, on null implement default
                WizLog(@"[SPLASH BACKGROUND] ******* enableSplashOnGotoBackground  %i", enableSplash );
            
                if (enableSplash==1) {
                    
                    [(CDVViewController *)plugin.viewController showPGSplash];
                    //[self showPGSplash];
                    
                } else if (enableSplash==0) {
                    
                    WizLog(@"[SPLASH BACKGROUND] ******* do nothing");
                    // do nothing enableSplashOnBackground is false
                    
                }
            } else {
                WizLog(@"[SPLASH BACKGROUND] ******* DEFAULT enableSplashOnGotoBackground  %i", defaultEnableSplashOnGotoBackground );
                if (defaultEnableSplashOnGotoBackground==1) {
                    
                    [(CDVViewController *)plugin.viewController showPGSplash];
                    // [self showPGSplash];
                }
            }
        }
    }
}

+ (void)willTerminate:(NSNotification *)notification
{
    // Stop the class from observing all notification center notifications.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma - Instance Methods

-(CDVPlugin*) initWithWebView:(UIWebView*)theWebView
{
    
    self = (WizSplashPlugin*)[super initWithWebView:theWebView];
    
    return self;
}



- (void)setSplashInBackground:(NSArray*)arguments withDict:(NSDictionary*)options
{
    // set the splash boolean
    enableSplash = [[arguments objectAtIndex:1] boolValue];
    WizLog(@"[WizUtils] ******* setSplashInBackground %i", enableSplash);
    
    // record that the splash setting was set
    isSplashSettingSpecified = YES;
}


@end
