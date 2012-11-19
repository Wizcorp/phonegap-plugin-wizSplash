/* Splash Cordova Plugin - JavaScript side of the bridge to iOS
 *
 * @author Ally Ogilvie
 * @copyright WizCorp Inc. [ Incorporated Wizards ] 2012
 * @file JavaScript wizSplash for Cordova
 *
 */


var wizSplash = {
    
    setSplashInBackground: function(bool) {
        return cordova.exec(null, null, "WizSplashPlugin", "setSplashInBackground", [bool]);
    }
    
    
};
