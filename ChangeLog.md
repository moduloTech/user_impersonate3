# Change Log

## Unreleased

- Rename gem to user_impersonate3

## 0.12.0 - Various fixes

## 0.11.0 - Minor API addition

* Pull request #9: Use current_staff instead of current_user for custom current_user methods

## 0.10.2 - Bug fix release

* Issue #6: Using user_impersonate with Rails models that manually set the table_name fails

## 0.10.1 - Bug fix release

* Issue #3: NoMethodError when calling config.staff_finder

## 0.10.0 - Enhancements to staff user configuration

* Issue #2: "Support alternative model for staff users"

    config.staff_class = 'User'
    config.staff_finder = 'find'

* Bump minor version due initializer changes

## 0.9.2 - Bug fix release

* Issue #1: "Don't authenticate the user when trying to revert"

## 0.9.1 - Remove unnecessary dependencies and add official support for Ruby 2.1.0

* Remove dependency on jquery and jquery_ujs from application.js manifest
* CI builds now test against Ruby 2.1.0 in addition to 1.9.3 and 2.0.0

## 0.9. - Rename gem to user_impersonate2 and add Rails 4 support

* Rails 4 support courtesy of https://github.com/jamesharker/user_impersonate

## 0.8. - Not specific to Devise

* Can specify the sign in & authenticate methods to use
* Defaults for missing config now working 

## 0.7.0 - Redirect configuration

* Options for specifying where redirects go to and their defaults:

    config.redirect_on_impersonate = "/"
    config.redirect_on_revert = "/impersonate"

* Fixed override code, so you can actually override now.

## 0.6.0 - Configuration

* Options and their defaults:

    config.user_class           = "User"
    config.user_finder          = "find"   # User.find
    config.user_id_column       = "id"     # Such that User.find(aUser.id) works
    config.user_is_staff_method = "staff?" # current_user.staff?

* Generator

    rails g user_impersonate

## 0.5.0 - Initial experimental release

* Impersonation mechanism works
* No generators
* No configurability

