"use strict";

const { utils } = require("surgio");

module.exports = {
  url: "Your URL",
  type: "v2rayn_subscribe",
  udpRelay: true,
  tfo: true,
  tls13: true,
  mptcp: true,
  //   compatibleMode: true,
  skipCertVerify: true,

  // Filters
  customFilters: {
    AmericanHighRate: utils.mergeFilters([utils.usFilter], true),
    HongKongHighRate: utils.mergeFilters([utils.hkFilter], true),
    JapanHighRate: utils.mergeFilters([utils.japanFilter], true),
    SingaporeHighRate: utils.mergeFilters([utils.singaporeFilter], true),
  },
};
