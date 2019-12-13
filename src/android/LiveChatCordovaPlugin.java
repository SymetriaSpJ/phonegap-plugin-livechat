package com.fitatu.phonegap.plugin.liveChat;

import java.util.HashMap;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.PluginResult;
import org.apache.cordova.CordovaWebView;

import com.livechatinc.inappchat.ChatWindowConfiguration;
import com.livechatinc.inappchat.ChatWindowActivity;
import com.livechatinc.inappchat.ChatWindowView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class LiveChatCordovaPlugin extends CordovaPlugin {

    private Activity activityContext;
    private String license;
    private String groupId;
    private String name;
    private String email;

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);

        activityContext = cordova.getActivity();
        cordova.setActivityResultCallback(this);
    }

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("authorize")) {
            authorize(args, callbackContext);

            return true;
        }

        if (action.equals("open")) {
            openChat(callbackContext);

            return true;
        }

        if (action.equals("destroy")) {
            destroyChat(callbackContext);

            return true;
        }

        if (action.equals("isAgentAvailable")) {
            isAgentAvailable(callbackContext);

            return true;
        }


        return false;
    }

    private void authorize(JSONArray args, CallbackContext callbackContext) throws JSONException {
        license = args.getJSONObject(0).getString("license");
        groupId = args.getJSONObject(0).getString("groupId");
        name = args.getJSONObject(0).getString("name");
        email = args.getJSONObject(0).getString("email");

        callbackContext.success(1);
    }

    private void openChat(CallbackContext callbackContext) {
       Intent intent = new Intent(activityContext, ChatWindowActivity.class);
       intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);

       intent.putExtra(ChatWindowActivity.KEY_LICENCE_NUMBER, license);
       intent.putExtra(ChatWindowActivity.KEY_VISITOR_NAME, name);
       intent.putExtra(ChatWindowActivity.KEY_VISITOR_EMAIL, email);

       activityContext.startActivity(intent);

       callbackContext.success(1);
    }

    private void isAgentAvailable(CallbackContext callbackContext) {
        callbackContext.success(1);
    }

    private void destroyChat(CallbackContext callbackContext) {
        callbackContext.success(1);
    }
}