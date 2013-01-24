# PLUGIN: 

phonegap-plugin-wizSplash<br />
version : 2.3<br />
last update : 24/01/2013<br />


# CHANGELOG: 
- Updated for cordova 2.3 (iOS only)
- Updated for cordova 1.9 (iOS only)


# DESCRIPTION :

PhoneGap plugin for toggling auto-showing of the splash screen when the app
moves from the background to the foreground.


# USAGE :

Create a wizSplash.plist property list file that contains the following default
setting:

	enableSplashOnGotoBackground	BOOL

The value of this property determines whether or not the splash screen is
enabled after resuming from the background.

To change the behavior form the default specified in the wizSplash.plist, use
the wizSplash.setSplashInBackground() JavaScript function as follows:

Enable show splash after resuming from background<br />
<pre><code>
wizSplash.setSplashInBackground(true);
</pre></code>

Disable show splash after resuming from background<br />
<pre><code>
wizSplash.setSplashInBackground(false);
</pre></code>


