# Wicked Cool API

This repository is a demonstration of authoring a **very simple** web-based API in Ruby. It implements the same API using two different platforms:

* Rails 5 API mode
* Sinatra

This is sample code intended for the OKC Ruby User's Group meetup on October 11th, 2018 and does not represent anything intended for production use. There are no specs, no authentication/authorization, nor is it considered complete in any way. The sole purpose is to show how easy it is to get started with either framework of your choice.

Also included is a PDF of the slides used in the presentation.

## Getting started

### Rails App

In the `wicked_cool_api_rails` directory, run the following:

```shell
bundle
rake db:create
rake db:seed
rails s
```

Then you can hit the app at `http://localhost:3000/restaurants`, `http://localhost:3000/reviews`, etc with your browser or a tool such as Postman.

### Sinatra App

In the `wicked_cool_api_sinatra` directory, run the following:

```shell
bundle
rake db:create
rake db:seed
rackup
```

Then you can hit the app at `http://localhost:9292/restaurants`, `http://localhost:9292/reviews`, etc with your browser or a tool such as Postman.

## License

The source code in this repository is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/bratta/wicked_cool_api/blob/master/CODE_OF_CONDUCT.md).