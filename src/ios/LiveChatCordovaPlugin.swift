@objc(LiveChatCordovaPlugin) class LiveChatCordovaPlugin : CDVPlugin {
    @objc(authorize:)
    func authorize(command: CDVInvokedUrlCommand) {
        var pluginResult = CDVPluginResult (status: CDVCommandStatus_ERROR, messageAs: "Authorization failed");

        let liveChatParameters:AnyObject = command.arguments[0] as AnyObject

        if let liveChatObject = liveChatParameters as? [String:Any] {
            LiveChat.licenseId = liveChatObject["license"] as? String;
            LiveChat.groupId = liveChatObject["groupId"] as? String;
            LiveChat.name = liveChatObject["name"] as? String;
            LiveChat.email = liveChatObject["email"] as? String;

            if let crmObject = liveChatObject["crm"] as? [String:String] {
                LiveChat.setVariable(withKey: crmObject["key"] as! String, value: crmObject["value"] as! String);
            }

            if let userObject = liveChatObject["user"] as? [String:String] {
                LiveChat.setVariable(withKey: userObject["key"] as! String, value: userObject["value"] as! String);
            }

            pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "Authorization succeeded");
        }

        self.commandDelegate!.send(pluginResult, callbackId: command.callbackId);
    }

    @objc(open:)
    func open(command: CDVInvokedUrlCommand) {
        var pluginResult = CDVPluginResult (status: CDVCommandStatus_ERROR, messageAs: "The Plugin Failed");

        if (!LiveChat.isChatPresented) {
            LiveChat.presentChat();

            pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "Open succeeded");
        }

        self.commandDelegate!.send(pluginResult, callbackId: command.callbackId);
    }

    @objc(destroy:)
    func destroy(command: CDVInvokedUrlCommand) {
        let pluginResult = CDVPluginResult (status: CDVCommandStatus_OK, messageAs: "Destroy succeeded");

        LiveChat.dismissChat();

        self.commandDelegate!.send(pluginResult, callbackId: command.callbackId);
    }

    @objc(clearSession:)
    func clearSession(command: CDVInvokedUrlCommand) {
        let pluginResult = CDVPluginResult (status: CDVCommandStatus_OK, messageAs: "Clear session succeeded");

        LiveChat.clearSession();

        self.commandDelegate!.send(pluginResult, callbackId: command.callbackId);
    }
}