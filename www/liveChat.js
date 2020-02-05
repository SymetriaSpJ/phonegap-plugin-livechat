var OPTIONAL_PARAM_DEFAULT_VALUE = "";

function LiveChat() {}

LiveChat.prototype.authorize = function(options, successCallback, errorCallback) {
    cordova.exec(
        successCallback,
        errorCallback,
        "LiveChatCordovaPlugin",
        "authorize",
        [{
            "license": options.license,
            "groupId": options.groupId || OPTIONAL_PARAM_DEFAULT_VALUE,
            "name": options.name || OPTIONAL_PARAM_DEFAULT_VALUE,
            "email": options.email || OPTIONAL_PARAM_DEFAULT_VALUE,
            "crm": options.crm || OPTIONAL_PARAM_DEFAULT_VALUE,
            "user": options.user || OPTIONAL_PARAM_DEFAULT_VALUE,
        }]
    );
};

LiveChat.prototype.open = function(successCallback, errorCallback) {
    cordova.exec(
        successCallback,
        errorCallback,
        "LiveChatCordovaPlugin",
        "open",
        []
    );
};

LiveChat.prototype.destroy = function(successCallback, errorCallback) {
    cordova.exec(
        successCallback,
        errorCallback,
        "LiveChatCordovaPlugin",
        "destroy",
        []
    );
};

LiveChat.prototype.isAgentAvailable = function(successCallback, errorCallback) {
    cordova.exec(
        successCallback,
        errorCallback,
        "LiveChatCordovaPlugin",
        "isAgentAvailable",
        []
    );
};

LiveChat.prototype.clearSession = function(successCallback, errorCallback) {
    cordova.exec(
        successCallback,
        errorCallback,
        "LiveChatCordovaPlugin",
        "clearSession",
        []
    );
};

LiveChat.install = function() {
    if (!window.plugins) {
        window.plugins = {};
    }

    window.plugins.liveChat = new LiveChat();

    return window.plugins.liveChat;
};

cordova.addConstructor(LiveChat.install);