+++
title = "Android API"
+++

## Components
- Activities - UI - a screen on the display. An activity is a single, focused thing that the user can do.
- Services - perform long-running operations in the background
- Content Providers - manage access to repositories of data
- Broadcast Receivers - respond to broadcast intents

## Activity
- Hierarchical parent: All screens in your app that are not the main entrance to your app (the "home" screen) should offer the user a way to navigate to the logical parent screen in the app's hierarchy by pressing the Up button in the action bar.
- Intent - An Intent is an object that provides runtime binding between separate components (such as two activities). The Intent represents an app’s "intent to do something."

### View group
- Invisible container containing other viewGroup and View objects

## manifest
- Components that you include in your source but do not declare in the manifest are not visible to the system and, consequently, can never run. 

Lists:

- Required user permissions
- The minimum API Level required by the app
- Hardware and software features used by the app (for example, a camera, bluetooth services, or a multitouch screen)
- Non-Android API libraries the app needs to be linked against, such as the Google Maps library
- The name and icon for an app

```
<?xml version=""1.0"" encoding=""utf-8""?>
<manifest xmlns:android=""http://schemas.android.com/apk/res/android""
    package=""com.your_website.pkg_name"">
    <uses-sdk
        android:minSdkVersion=""10""
        android:targetSdkVersion=""19"" />
    <application
        android:allowBackup=""true""
        android:icon=""@drawable/ic_launcher""
        android:label=""@string/activity_title""
        android:theme=""@style/AppTheme"">
[activities]
    </application>
</manifest>
```

## java android
<div class="spreadsheet" src="../java_android.toml" fullHeightWithRowsPerScreen=8> </div>  

### Async http
Process text:  
```
 AsyncHttpClient client = new AsyncHttpClient();
 client.get("https://www.google.com", new TextHttpResponseHandler() {
     @Override
     public void onStart() {
         // Initiated the request
     }
    @Override
     public void onSuccess(String responseBody) {
         // Successfully got a response
     }
     @Override
     public void onFailure(String responseBody, Throwable e) {
         // Response failed :(
     }
     @Override
     public void onFinish() {
         // Completed the request (either success or failure)
     }
 });
```