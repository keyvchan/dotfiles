"use strict";

const { utils } = require("surgio");
const { test } = require("./custom");

module.exports = {
  url: "Your URL",
  type: "shadowsocks_subscribe",
  udpRelay: true,

  renameNode: (name) => {
    let indictor = "ss";
    if (name.indexOf("America") != -1) {
      return name.replace("America", "United States-SS");
    }
    if (name.indexOf("England") != -1) {
      return name.replace("England", "United Kingdom-SS");
    }
    if (name.indexOf("Hong Kong") != -1) {
      return name.replace("Hong Kong", "Hong Kong-SS");
    }
    if (name.indexOf("India") != -1) {
      return name.replace("India", "India-SS");
    }
    if (name.indexOf("Japan") != -1) {
      return name.replace("Japan", "Japan-SS");
    }
    if (name.indexOf("Singapore") != -1) {
      return name.replace("Singapore", "Singapore-SS");
    }
    if (name.indexOf("Taiwan") != -1) {
      return name.replace("Taiwan", "Taiwan-SS");
    }
    if (name.indexOf("German") != -1) {
      return name.replace("German", "German-SS");
    }
    if (name.indexOf("Vietnam") != -1) {
      return name.replace("Vietnam", "Vietnam-SS");
    }

    return name;
  },

  // Misc
  addFlag: false,

  // Filters
  customFilters: {
    AmericanHighRate: utils.mergeFilters(
      [utils.usFilter, utils.discardKeywords(["0.1"])],
      true
    ),
    HongKongHighRate: utils.mergeFilters(
      [utils.hkFilter, utils.discardKeywords(["0.1"])],
      true
    ),
    JapanHighRate: utils.mergeFilters(
      [utils.japanFilter, utils.discardKeywords(["0.1"])],
      true
    ),
    SingaporeHighRate: utils.mergeFilters(
      [utils.singaporeFilter, utils.discardKeywords(["0.1"])],
      true
    ),
    TaiwanHighRate: utils.mergeFilters(
      [utils.taiwanFilter, utils.discardKeywords(["0.1"])],
      true
    ),
    NoStatics: utils.discardKeywords(["：", ":"]),
  },
};
