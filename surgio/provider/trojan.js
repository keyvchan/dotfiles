"use strict";

const { utils } = require("surgio");

module.exports = {
  type: "custom",
  nodeList: [
    {
      nodeName: "🇺🇸 vmess",
      type: "vmess",
      hostname: "Your host",
      method: "auto", // 仅支持 auto/aes-128-gcm/chacha20-ietf-poly1305/none
      network: "ws", // 仅支持 tcp/ws
      alterId: "64",
      path: "/path",
      port: 443,
      tls: true,
      host: "Your host",
      uuid: "Your UUID",
      tfo: true, // TCP Fast Open
      tls13: true, // TLS 1.3, TLS 开启时有效
    },
  ],
};
