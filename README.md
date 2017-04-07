== README

# A SaaS Time Tracking Web App

### Built with Ruby on Rails

* Ruby 2.3.3
* Rails 4.2.8
* PostgreSQL
* Travis CI

### Automated Continuous Integration with Travis CI

Continuous Integration (CI) is the practice of integrating new code into the master branch frequently, to help detect merge conflicts, bugs, and improve the quality of the software a development team writes.

CI is usually accompanied by running an application's test suite against the latest code changes, and flagging any test failures that are found. Developers are expected to investigate and fix these failures to maintain a passing test suite and therefore quality.

[Travis CI](https://travis-ci.org) is a build server that helps automate the CI process. Travis CI runs an application's tests against the latest changes pushed to the application's code respository. In this project, Travis CI runs the project's tests (`rake test`) on pull requests and on changes to the master branch.

Travis CI configuration how-to and example:
- [.travis.yml](.travis.yml) - Travis CI's configuration file (with instructions)
- [TimeTracker Travis CI build!](https://travis-ci.org/bennypaulino/timetracker)
- Travis CI badge for TimeTracker: [![Build Status](https://travis-ci.org/bennypaulino/timetracker.svg?branch=master)](https://travis-ci.org/bennypaulino/timetracker)