package com.fitatu.phonegap.plugin.liveChat;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class LiveChat extends CordovaPlugin {

    private Activity activityContext;
    private String license;

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);

        activityContext = cordova.getActivity();
        cordova.setActivityResultCallback(this);
    }

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) {
        if (action.equals("configure")) {
            configure(args, callbackContext);

            return true;
        }

        if (action.equals('open')) {
            openChat();

            return true;
        }

        return true;
    }

    private void openChat() {
       Intent intent = new Intent(context, com.livechatinc.inappchat.ChatWindowActivity.class);

       intent.putExtra(com.livechatinc.inappchat.ChatWindowActivity.KEY_LICENCE_NUMBER, license);

       activityContext.startActivity(intent);
    }

    private void configure(JSONArray args, CallbackContext callbackContext) throws JSONException {
        license = args.getJSONObject(0).getString("license");

        callbackContext.success(1);
    }
}