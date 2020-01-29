"use strict";

const { utils } = require("surgio");

module.exports = {
  url: "url",
  type: "shadowsocksr_subscribe",

  renameNode: name => {
    if (name.indexOf("America") != -1) {
      return name.replace("America", "🇺🇸 United States");
    }
    if (name.indexOf("England") != -1) {
      return name.replace("England", "🇬🇧 United Kingdom");
    }
    if (name.indexOf("Hong Kong") != -1) {
      return name.replace("Hong Kong", "🇭🇰 Hong Kong");
    }
    if (name.indexOf("India") != -1) {
      return name.replace("India", "🇮🇳 India");
    }
    if (name.indexOf("Japan") != -1) {
      return name.replace("Japan", "🇯🇵 Japan");
    }
    if (name.indexOf("Singapore") != -1) {
      return name.replace("Singapore", "🇸🇬 Singapore");
    }
    if (name.indexOf("Taiwan") != -1) {
      return name.replace("Taiwan", "🇹🇼 Taiwan");
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
    TaiwanHighRate: utils.mergeFilters(
      [utils.taiwanFilter, utils.discardKeywords(["0.1"])],
      true
    )
  }
};
