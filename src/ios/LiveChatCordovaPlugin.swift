//
//  ViewController.swift
//  LiveChatCordovaPlugin
//
//  Created by Robert Klimczak on 18/12/2019.
//

import Foundation
import UIKit
import LiveChat
import MapKit


@objc(LiveChatCordovaPlugin) class LiveChatCordovaPlugin : CDVPlugin {
  @objc(show:)
    
  var pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "The plugin succeeded");
    
  func show(command: CDVInvokedUrlCommand) {
    do {
        LiveChat.presentChat();
    } catch let error {
        pluginResult = CDVPluginResult (status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription);
    }
    
    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId);
  }
}
