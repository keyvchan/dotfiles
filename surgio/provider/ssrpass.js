"use strict";

const { utils } = require("surgio");

module.exports = {
  url: "Your URL",
  type: "shadowsocksr_subscribe",
  udpRelay: true,
  tfo: true,
  tls13: true,
  mptcp: true,

  renameNode: (name) => {
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
    if (name.indexOf("German") != -1) {
      return name.replace("German", "🇩🇪 German");
    }
    if (name.indexOf("Spain") != -1) {
      return name.replace("Spain", "🇪🇸 Spain");
    }
    if (name.indexOf("Vietnam") != -1) {
      return name.replace("Vietnam", "🇻🇳 Vietnam");
    }
    if (name.indexOf("Korea") != -1) {
      return name.replace("Korea", "🇰🇷 Korea");
    }
    if (name.indexOf("Italy") != -1) {
      return name.replace("Italy", "🇮🇹 Italy");
    }
    if (name.indexOf("Hungary") != -1) {
      return name.replace("Hungary", "🇭🇺 Hungary");
    }

    return name;
  },

  // Misc
  addFlag: false,

  // Filters
  customFilters: {
    AmericanHighRate: utils.mergeFilters(
      [
        utils.usFilter,
        utils.discardKeywords(["0.1"]),
        utils.useProviders(["ssrpass"]),
      ],
      true
    ),
    HongKongHighRate: utils.mergeFilters(
      [
        utils.hkFilter,
        utils.discardKeywords(["0.1"]),
        utils.useProviders(["ssrpass"]),
      ],
      true
    ),
    JapanHighRate: utils.mergeFilters(
      [
        utils.japanFilter,
        utils.discardKeywords(["0.1"]),
        utils.useProviders(["ssrpass"]),
      ],
      true
    ),
    SingaporeHighRate: utils.mergeFilters(
      [
        utils.singaporeFilter,
        utils.discardKeywords(["0.1"]),
        utils.useProviders(["ssrpass"]),
      ],
      true
    ),
    TaiwanHighRate: utils.mergeFilters(
      [
        utils.taiwanFilter,
        utils.discardKeywords(["0.1"]),
        utils.useProviders(["ssrpass"]),
      ],
      true
    ),
    Korea: utils.useKeywords(["Korea"]),
    Italy: utils.useKeywords(["Italy"]),
    Hungary: utils.useKeywords(["Hungary"]),
    NoStatics: utils.discardKeywords(["：", ":"]),
  },
};
