Consumer                        = require('./action_cable/consumer')
{default_mount_path}            = require('./action_cable/constants')
{startDebugging, stopDebugging} = require('./action_cable/log')

module.exports =
  createConsumer: (url) ->
    url ?= @getConfig("url") ? default_mount_path
    new Consumer @createWebSocketURL(url)

  getConfig: (name) ->
    element = document.head.querySelector("meta[name='action-cable-#{name}']")
    element?.getAttribute("content")

  createWebSocketURL: (url) ->
    if url and not /^wss?:/i.test(url)
      a = document.createElement("a")
      a.href = url
      # Fix populating Location properties in IE. Otherwise, protocol will be blank.
      a.href = a.href
      a.protocol = a.protocol.replace("http", "ws")
      a.href
    else
      url
  
  # PATCH
  # Expose startDebugging and stopDebugging for client usage
  debug:
    start: startDebugging
    stop: stopDebugging
