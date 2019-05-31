'use strict'
const merge = require('webpack-merge')
const prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  NODE_ENV: '"development"',
  //开发测试环境请求地址
  API_ROOT: '"https://todo.xilidou.com"'
})
