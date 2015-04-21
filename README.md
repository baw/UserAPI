# User Api

## Getting up and running

After you install Ruby and PostgreSQL, install bundler (a Ruby gem to install
other ruby gems):

```
gem install bundler

```

Then clone this repo:

```
git clone https://github.com/imamathwiz/UserAPI.git
```
After cloning, cd into that directory

```
cd UserAPI
```

install the application dependencies:

```
bundle install
```

create and migrate the database:

```
rake db:create db:migrate
```

run the server:

```
rails server
```

optionally, you can seed the database:

```
rake db:seed
```

## Technologies

I used Ruby on Rails for this API since its conventions proved a good foundation
to rapidly build out a demo API.

I used PostgreSQL for the database since it's open source and has a very
flexible licence.

## Versioning

API versioning is implemented through adding the version to the url. I did it
this way since I feel this is a simpler design to both implement and to use
the API then using a customer request header or the accept header.
