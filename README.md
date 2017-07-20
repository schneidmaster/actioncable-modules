[![npm version](https://badge.fury.io/js/actioncable-modules.svg)](https://badge.fury.io/js/actioncable-modules)

# actioncable-modules

A fork of the [Rails 5 ActionCable](https://github.com/rails/rails/tree/master/actioncable) client code, lightly patched and maintained for proper module support.

## Why?

As of 5.0.0, the official actioncable npm package was broken outside of browser usage, and the [core team](https://github.com/rails/rails/issues/25649) was unwilling to release a fixed version bump for more than five months (until Rails 5.0.1 was released). This package provided support for webpack/node builds during that timespan, and will ensure modules continue to be properly supported in the future.

## Patches

To ready the code for modular usage, Sprockets requires have been replaced with module requires and module.exports added to each source file. Additionally, I have made a few light patches to work better with modules; each is labeled with a `# PATCH` comment to make it clear where the code diverts from the official Rails source.

## Versioning

Versioning of this package will match the versioning of the related Rails gem (starting with 5.0.0). Any minor version bumps for project-specific bugs will be hyphenated on the third semver point, e.g. `5.0.0-1`.

New versions will be published to npm for each new stable version of Rails. Beta and rc versions (tagged `beta` and `rc` respectively) will be published if the corresponding Rails beta/rc contains any changes to the ActionCable frontend code.

## Installation

```
npm install actioncable-modules --save
```

## Usage

Simply require the module. The API matches the official Rails docs.

```javascript
const ActionCable = require('actioncable-modules');

let actionCable = ActionCable.createConsumer("ws://cable.example.com");
actionCable.subscriptions.create "AppearanceChannel", ...
```

Full documentation can be found [here](https://github.com/rails/rails/tree/master/actioncable).

Additionally, for debug usage, you can temporarily (or permanently) enable more verbose logging:

```javascript
const ActionCable = require('actioncable-modules');

ActionCable.debug.start();
// more verbose logs

ActionCable.debug.stop();
// no more verbose logs
```

## Contributing

1. Fork it ( https://github.com/schneidmaster/actioncable-modules/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

MIT. (The rails source code included in this project is also MIT-licensed.)
