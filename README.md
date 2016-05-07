# rails-dot-js
rails-dot-js is gem providing node.js environment in Rails applications, so that you don't need to keep seperate repository for node application.
Any suggestion of new features or bug reporting are appreciated.

## Requirements
- [node.js](https://nodejs.org/)
- [Ruby on Rails](http://rubyonrails.org/)
- [Redis](http://www.redis.io/): supporting messaging between rails and node application

## Installation
Add the following to your application's Gemfile:
``` ruby
gem 'rails-dot-js', :git => 'https://github.com/nerdyfactory/rails-dot-js'
```

and bundling application
```
$ bundle install
```

generating node working space
```
$ rails g rails-dot-js:install
```

now you can play with node stuff in ```app/nodejs``` directory

## Usages

## Contribution
Fork, fix and make a pull request
