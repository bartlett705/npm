# GitHub Action for NPM (with cypress.io dependencies)

This Action for [npm](https://www.npmjs.com/) enables arbitrary actions with the `npm` command-line client, including testing with cypress.io and publishing to a registry.

## Usage

An example workflow to build, test, and publish an npm package to the default public registry follows:

```hcl
workflow "Build, Test, and Publish" {
  on = "push"
  resolves = ["Publish"]
}

action "Build" {
  uses = "actions/npm@master"
  args = "install"
}

action "Test" {
  needs = "Build"
  uses = "actions/npm@master"
  args = "test"
}

action "E2E Tests" {
  uses = "bartlett705/npm-cy@f69478046d80aef1be0e17582c189a59bbfc9aa1"
  needs = ["Unit Tests"]
  args = "run cy:run"
}
```

### Secrets

* `NPM_AUTH_TOKEN` - **Optional**. The token to use for authentication with the npm registry. Required for `npm publish` ([more info](https://docs.npmjs.com/getting-started/working_with_tokens))

### Environment variables

* `NPM_REGISTRY_URL` - **Optional**. To specify a registry to authenticate with. Defaults to `registry.npmjs.org`
* `NPM_STRICT_SSL` - **Optional**. Specify false if your registry is insecure and uses the `http` protocol. Defaults to `true`
* `NPM_CONFIG_USERCONFIG` - **Optional**. To specify a non-default per-user configuration file. Defaults to `$HOME/.npmrc` ([more info](https://docs.npmjs.com/misc/config#npmrc-files))

#### Example

To authenticate with, and publish to, a secure registry other than `registry.npmjs.org`:

```hcl
action "Publish" {
  uses = "actions/npm@master"
  args = "publish --access public"
  env = {
    NPM_REGISTRY_URL = "someOtherRegistry.someDomain.net"
  }
  secrets = ["NPM_AUTH_TOKEN"]
}
```


To authenticate with, and publish to, an insecure registry other than `registry.npmjs.org`:

```hcl
action "Publish" {
  uses = "actions/npm@master"
  args = "publish --access public"
  env = {
    NPM_REGISTRY_URL = "my.local.registry"
    NPM_STRICT_SSL = "false"
  }
  secrets = ["NPM_AUTH_TOKEN"]
}
```
## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
