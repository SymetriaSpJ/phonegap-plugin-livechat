@objc(LiveChatCordovaPlugin) class LiveChatCordovaPlugin : CDVPlugin {
    @objc(authorize:)
    func authorize(command: CDVInvokedUrlCommand) {
        var pluginResult = CDVPluginResult (status: CDVCommandStatus_ERROR, messageAs: "The Plugin Failed");

        let obj:AnyObject = command.arguments[0] as AnyObject

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
            let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])

            if let dictFromJSON = decoded as? [String:String] {
                let email = dictFromJSON["email"] as String?;
                let license = dictFromJSON["license"] as String?;
                let name = dictFromJSON["name"] as String?;
                let groupId = dictFromJSON["groupId"] as String?;
                // use dictFromJSON

                print(dictFromJSON)
                print(email)
                print(license)
                print(groupId)
                print(name)

                LiveChat.licenseId = license;
                LiveChat.groupId = groupId;
                LiveChat.name = name;
                LiveChat.email = email;


                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "The plugin succeeded");
            }
        } catch {
            print(error.localizedDescription)
            pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription);
        }

        self.commandDelegate.run(inBackground: {
//             print(obj);

        })



        self.commandDelegate!.send(pluginResult, callbackId: command.callbackId);
    }

    @objc(open:)
    func open(command: CDVInvokedUrlCommand) {
      var pluginResult = CDVPluginResult (status: CDVCommandStatus_ERROR, messageAs: "The Plugin Failed");

          pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "The plugin succeeded");

      self.commandDelegate!.send(pluginResult, callbackId: command.callbackId);
    }
}
