/* SplashPlugin - IOS side of the bridge to wizSplash JavaScript for PhoneGap
 *
 * @author Ally Ogilvie
 * @copyright Wizcorp Inc. [ Incorporated Wizards ] 2011
 * @file WizSplashPlugin.h for Cordova
 *
 */

#import <Foundation/Foundation.h>

#import <Cordova/CDVPlugin.h>

@interface WizSplashPlugin : CDVPlugin {

}

- (void)setSplashInBackground:(CDVInvokedUrlCommand*)command;

@end
