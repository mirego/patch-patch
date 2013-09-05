<p align="center">
  <a href="https://github.com/mirego/patch-patch">
    <img src="http://i.imgur.com/pnrKBDm.png" alt="PatchPatch" />
  </a>
  <br />
  PatchPatch changes Rails’ default behavior of mapping <code>PUT</code> and <code>PATCH</code> requests on resources to the same action.
  <br /><br />
  <a href="https://rubygems.org/gems/patch-patch"><img src="https://badge.fury.io/rb/patch-patch.png" /></a>
  <a href="https://codeclimate.com/github/mirego/patch-patch"><img src="https://codeclimate.com/github/mirego/patch-patch.png" /></a>
</p>

---

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'patch-patch'
```

And then execute:

```bash
$ bundle
```

## Usage

PatchPatch hooks itself automatically into Rails’ routing engine. You don’t have to enable or configure it.

Let’s say we have a RESTful API with a single `users` resource.

```ruby
# config/routes.rb
Foo::Application.routes.draw do
  resources :users
end
```

### Before

```bash
$ rake routes
   Prefix Verb   URI Pattern               Controller#Action
    users GET    /users(.:format)          users#index
          POST   /users(.:format)          users#create
 new_user GET    /users/new(.:format)      users#new
edit_user GET    /users/:id/edit(.:format) users#edit
     user GET    /users/:id(.:format)      users#show
          PATCH  /users/:id(.:format)      users#update
          PUT    /users/:id(.:format)      users#update
          DELETE /users/:id(.:format)      users#destroy
```

### After

```bash
$ rake routes
   Prefix Verb   URI Pattern               Controller#Action
    users GET    /users(.:format)          users#index
          POST   /users(.:format)          users#create
 new_user GET    /users/new(.:format)      users#new
edit_user GET    /users/:id/edit(.:format) users#edit
     user PATCH  /users/:id(.:format)      users#partial_update
          GET    /users/:id(.:format)      users#show
          PATCH  /users/:id(.:format)      users#update
          PUT    /users/:id(.:format)      users#update
          DELETE /users/:id(.:format)      users#destroy
```

_Note: the old `PATCH` route is still there but it will never be matched since our `#partial_update` route comes first. The old `PUT` route will still route to `#update` though._

## License

`PatchPatch` is © 2013 [Mirego](http://www.mirego.com) and may be freely distributed under the [New BSD license](http://opensource.org/licenses/BSD-3-Clause).  See the [`LICENSE.md`](https://github.com/mirego/patch-patch/blob/master/LICENSE.md) file.

The patch logo is based on [this lovely icon](http://thenounproject.com/noun/patch/#icon-No20089) by [Christina W](http://thenounproject.com/stinamc), from The Noun Project. Used under a [Creative Commons BY 3.0](http://creativecommons.org/licenses/by/3.0/) license.

## About Mirego

Mirego is a team of passionate people who believe that work is a place where you can innovate and have fun. We proudly build mobile applications for [iPhone](http://mirego.com/en/iphone-app-development/ "iPhone application development"), [iPad](http://mirego.com/en/ipad-app-development/ "iPad application development"), [Android](http://mirego.com/en/android-app-development/ "Android application development"), [Blackberry](http://mirego.com/en/blackberry-app-development/ "Blackberry application development"), [Windows Phone](http://mirego.com/en/windows-phone-app-development/ "Windows Phone application development") and [Windows 8](http://mirego.com/en/windows-8-app-development/ "Windows 8 application development") in beautiful Quebec City.

We also love [open-source software](http://open.mirego.com/) and we try to extract as much code as possible from our projects to give back to the community.
