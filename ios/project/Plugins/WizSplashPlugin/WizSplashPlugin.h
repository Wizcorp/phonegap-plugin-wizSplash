/* SplashPlugin - IOS side of the bridge to wizSplash JavaScript for PhoneGap
 *
 * @author Ally Ogilvie
 * @copyright Wizcorp Inc. [ Incorporated Wizards ] 2011
 * @file WizSplashPlugin.h for Cordova
 *
 */

#import <Foundation/Foundation.h>

#ifdef CORDOVA_FRAMEWORK
    #import <Cordova/CDVPlugin.h>
#else
    #import "CDVPlugin.h"
#endif

@interface WizSplashPlugin : CDVPlugin {

}

- (void)setSplashInBackground:(NSArray*)arguments withDict:(NSDictionary*)options;

@end
