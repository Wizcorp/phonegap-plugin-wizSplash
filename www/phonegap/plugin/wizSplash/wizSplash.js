/* Spinner/Loader Cordova Plugin - JavaScript side of the bridge to iOS
 *
 * @author Ally Ogilvie
 * @copyright WizCorp Inc. [ Incorporated Wizards ] 2012
 * @file JavaScript wizSplash for Cordova
 *
 */


var wizSpinner = {
    
    setSplashInBackground: function(bool) {
        return cordova.exec(null, null, "WizSplashPlugin", "setSplashInBackground", [bool]);
    }
    
    
};