# PATCH
# Moved this code from action_cable to a separate file
# so it can be required without circular dependencies.

module.exports =
  startDebugging: ->
    @debugging = true

  stopDebugging: ->
    @debugging = null

  log: (messages...) ->
    if @debugging
      messages.push(Date.now())
      console.log("[ActionCable]", messages...)
