function LiveChat() {}

LiveChat.prototype.configure = function(options, successCallback, errorCallback) {
    console.log('LiveChat::configure()', options);

    cordova.exec(
        successCallback,
        errorCallback,
        "LiveChat",
        "configure",
        [options]
    );
};

LiveChat.prototype.open = function() {
    console.log('LiveChat::open()');

    cordova.exec(
        null,
        null,
        "LiveChat",
        "open",
        []
    );
};

LiveChat.prototype.close = function() {
    console.log('LiveChat::close()');

    cordova.exec(
        null,
        null,
        "LiveChat",
        "close",
        []
    );
};

LiveChat.prototype.isAgentAvailable = function(successCallback) {
    console.log('LiveChat::isAgentAvailable()');

    cordova.exec(
        successCallback,
        null,
        "LiveChat",
        "isAgentAvailable",
        []
    );
};

LiveChat.prototype.install = function() {
    if (!window.plugins) {
        window.plugins = {};
    }

    window.plugins.liveChat = new LiveChat();

    return window.plugins.liveChat;
};

cordova.addConstructor(LiveChat.install);