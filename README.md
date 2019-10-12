# GitHub Action for NPM (with cypress.io dependencies)

This Action for [npm](https://www.npmjs.com/) enables arbitrary actions with the `npm` command-line client, including testing with cypress.io and publishing to a registry.

## Usage

An example workflow to build, unit test, and E2E test a project with cypress.io follows:

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

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
