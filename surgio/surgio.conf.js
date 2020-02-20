"use strict";

const { utils, categories } = require("surgio");

/**
 * 使用文档：https://surgio.royli.dev/
 */
module.exports = {
  /**
   * 远程片段
   * 文档：https://surgio.royli.dev/guide/custom-config.html#remotesnippets
   */
  remoteSnippets: [],
  artifacts: [
    /**
     * Surge
     */
    {
      name: "SurgeV3.conf", // 新版 Surge
      template: "surge_v3",
      provider: "shadowsocksr",
      combineProviders: ["vmess"],
      categories: [categories.SURGE]
    },

    /**
     * Quantumult X
     */
    {
      name: "QuantumultX_rules.conf",
      template: "quantumultx_rules",
      provider: "shadowsocksr",
      categories: [categories.QUANTUMULT_X_FILTER]
    },
    {
      name: "QuantumultX.conf",
      template: "quantumultx",
      provider: "shadowsocksr",
      categories: [categories.QUANTUMULT_X]
    },
    {
      name: "QuantumultX_subscribe_us.conf",
      template: "quantumultx_subscribe",
      provider: "shadowsocksr",
      customParams: {
        magicVariable: utils.usFilter
      },
      categories: [categories.QUANTUMULT_X_SERVER]
    },
    {
      name: "QuantumultX_subscribe_hk.conf",
      template: "quantumultx_subscribe",
      provider: "shadowsocksr",
      customParams: {
        magicVariable: utils.hkFilter
      },
      categories: [categories.QUANTUMULT_X_SERVER]
    },
    {
      name: "QuantumultX_subscribe_jp.conf",
      template: "quantumultx_subscribe",
      provider: "shadowsocksr",
      customParams: {
        magicVariable: utils.japanFilter
      },
      categories: [categories.QUANTUMULT_X_SERVER]
    },
    {
      name: "QuantumultX_subscribe_sg.conf",
      template: "quantumultx_subscribe",
      provider: "shadowsocksr",
      customParams: {
        magicVariable: utils.singaporeFilter
      },
      categories: [categories.QUANTUMULT_X_SERVER]
    },
    {
      name: "QuantumultX_subscribe_tw.conf",
      template: "quantumultx_subscribe",
      provider: "shadowsocksr",
      customParams: {
        magicVariable: utils.taiwanFilter
      },
      categories: [categories.QUANTUMULT_X_SERVER]
    }
  ],
  /**
   * 订阅地址的前缀部分，以 / 结尾
   * 例如阿里云 OSS 的访问地址 https://xxx.oss-cn-hangzhou.aliyuncs.com/
   */
  urlBase: "https://surgeconfiguration.keyvchan.now.sh/get-artifact/",
  upload: {
    // 默认保存至根目录，可以在此修改子目录名，以 / 结尾，默认为 /
    prefix: "/",
    bucket: "surgio-store",
    // // 支持所有区域
    region: "oss-cn-hangzhou",
    // // 以下信息于阿里云控制台获得
    accessKeyId: "YOUR_ACCESS_KEY_ID",
    accessKeySecret: "YOUR_ACCESS_KEY_SECRET"
  },
  // 非常有限的报错信息收集
  analytics: true,

  gateway: {
    auth: true,
    accessToken: "Getcrayon123"
  },

  binPath: {
    shadowsocksr: "/Users/keyv/.local/bin/ss-local"
  },
  surgeConfig: {
    resolveHostname: false,
    v2ray: "native"
  },
  proxyTestUrl: "http://www.gstatic.com/generate_204",
  proxyTestInterval: "600"
};
