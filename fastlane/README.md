fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

### lint

```sh
[bundle exec] fastlane lint
```

Does a static analysis of the project. Configure the options in .swiftlint.yml

### test

```sh
[bundle exec] fastlane test
```

Runs all the unit tests and UI Tests

### generate_doc

```sh
[bundle exec] fastlane generate_doc
```

Generate Documentation using jazzy

### reports

```sh
[bundle exec] fastlane reports
```

Build, Test and Generate Doc

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
