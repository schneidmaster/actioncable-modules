# PATCH
# Inserted INTERNAL constants from official npm package
# (since Rails core uses erb to load them).

module.exports =
  message_types:
    welcome: 'welcome'
    ping: 'ping'
    confirmation: 'confirm_subscription'
    rejection: 'reject_subscription'
  default_mount_path: '/cable'
  protocols: ['actioncable-v1-json', 'actioncable-unsupported']
