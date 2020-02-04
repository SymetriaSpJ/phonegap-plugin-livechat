@objc(LiveChatCordovaPlugin) class LiveChatCordovaPlugin : CDVPlugin {
    @objc(authorize:)
    func authorize(command: CDVInvokedUrlCommand) {
        var pluginResult = CDVPluginResult (status: CDVCommandStatus_ERROR, messageAs: "Authorization failed");

        let obj:AnyObject = command.arguments[0] as AnyObject

        print("#0");
        print(command.arguments[0]);

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
            print("#1");
            print(jsonData);

            let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
            print("#2");
            print(decoded);

            if let dictFromJSON = decoded as? [String:String] {
                let email = dictFromJSON["email"] as String?;
                let license = dictFromJSON["license"] as String?;
                let name = dictFromJSON["name"] as String?;
                let groupId = dictFromJSON["groupId"] as String?;
                let crm = dictFromJSON["crm"] as String?;

                LiveChat.licenseId = license;
                LiveChat.groupId = groupId;
                LiveChat.name = name;
                LiveChat.email = email;

                print("#3");
                print(dictFromJSON)
                print(crm);

                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "Authorization succeeded");
            }
        } catch {
            print(error.localizedDescription)

            pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription);
        }

        self.commandDelegate!.send(pluginResult, callbackId: command.callbackId);
    }

    @objc(open:)
    func open(command: CDVInvokedUrlCommand) {
      var pluginResult = CDVPluginResult (status: CDVCommandStatus_ERROR, messageAs: "The Plugin Failed");

        do {
            if (!LiveChat.isChatPresented) {
                LiveChat.presentChat();

                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "Open succeeded");
            }
        }

      self.commandDelegate!.send(pluginResult, callbackId: command.callbackId);
    }
}