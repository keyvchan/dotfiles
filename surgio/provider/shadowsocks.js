"use strict";

const { utils } = require("surgio");

module.exports = {
  url: "URL",
  type: "shadowsocks_subscribe",
  udpRelay: true,
  tfo: true,
  tls13: true,
  mptcp: true,

  renameNode: (name) => {
    if (name.indexOf("America") !== -1) {
      return name.replace("America", "United States-SS");
    }
    if (name.indexOf("England") !== -1) {
      return name.replace("England", "United Kingdom-SS");
    }
    if (name.indexOf("Hong Kong") !== -1) {
      return name.replace("Hong Kong", "Hong Kong-SS");
    }
    if (name.indexOf("India") !== -1) {
      return name.replace("India", "India-SS");
    }
    if (name.indexOf("Japan") !== -1) {
      return name.replace("Japan", "Japan-SS");
    }
    if (name.indexOf("Singapore") !== -1) {
      return name.replace("Singapore", "Singapore-SS");
    }
    if (name.indexOf("Taiwan") !== -1) {
      return name.replace("Taiwan", "Taiwan-SS");
    }
    if (name.indexOf("German") !== -1) {
      return name.replace("German", "German-SS");
    }
    if (name.indexOf("Vietnam") !== -1) {
      return name.replace("Vietnam", "Vietnam-SS");
    }

    return name;
  },

  // Misc
  addFlag: false,
};
