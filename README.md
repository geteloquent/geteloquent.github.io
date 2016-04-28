geteloquent.github.io
=====================

[![Stories in Ready](https://badge.waffle.io/geteloquent/geteloquent.github.io.png?label=ready&title=Ready)](http://waffle.io/geteloquent/geteloquent.github.io)

Changes should be made at `source` branch, never at `master` branch, because it's an organization page at Github Pages infrastructure.

### Deploy

Since it's an organization page at Github Pages infrastructure, we need to publish at `master` branch.
```sh
bundle exec rake publish BRANCH_NAME=master
```
