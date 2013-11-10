# propile

Community Conference Program Compiler


## Installation

### Sysadmin

Some environment variables are needed to set up the app :

* `PROPILE_DEV_DB_NAME`
* `PROPILE_DEV_DB_USER`
* `PROPILE_DEV_DB_PASS`
* `PROPILE_TEST_DB_NAME`
* `PROPILE_TEST_DB_USER`
* `PROPILE_TEST_DB_PASS`
* `PROPILE_PROD_DB_NAME`
* `PROPILE_PROD_DB_USER`
* `PROPILE_PROD_DB_PASS`

You only need the first six for a development environment, set them in your
.bashrc, .tmuxrc, or whatever you want than will set environment variables for
your application.

To create databases :

    $ sudo -u postgres psql

    postgres=# create database <PROPILE_DEV_DB_NAME>;
    postgres=# create user <PROPILE_DEV_DB_USER> with password '<PROPILE_DEV_DB_PASS>';
    postgres=# grant all privileges on database <PROPILE_DEV_DB_NAME> to <PROPILE_DEV_DB_USER>;
    postgres=# create database <PROPILE_TEST_DB_NAME>;
    postgres=# create user <PROPILE_TEST_DB_USER> with password '<PROPILE_TEST_DB_PASS>';
    postgres=# grant all privileges on database <PROPILE_TEST_DB_NAME> to <PROPILE_TEST_DB_USER>;
    postgres=# ^d

    $ bundle exec rake db:migrate
    $ RAILS_ENV=test bundle exec rake db:migrate

Then, ensure tests are passing :

    bundle exec rspec spec/


### Setup

To populate database the very first time you run the app :

    bundle exec rake db:seed


This will create a `Session` and a few `Presenter`s and `Comment`s.

To create a user for yourself :

    email, pass = 'your email', 'your pass'

    me = Account.new
    me.email = email
    me.maintainer = true # set to false if you want a presenter account
    me.password = pass
    me.password_confirmation = pass
    me.confirmed_at = Time.now
    me.save
    me.presenter.create!

You can now log in. Please note that even if you set yourself as a maintainer,
a presenter profile should still be created as `me.presenter` to avoid app
crashing when reaching dashboard.


## Findings about design

### Sessions and sessions

There are two kind of session in this app :

* sessions handled by `SessionsController` : sessions in a conference point of view
* sessions handled by `Account::SessionsController` : your regular session, aka log status

The `Session` model is related to former one.


### Creating accounts

Even if there's an `AccountsController`, it seems it's expected to create
accounts manually from rails console :

* `accounts/new` is accessible only for logged in users
* this form displays no input anyway, except the submit one

There's also an ajax form in configuration page, but I just could not getting
it to work properly.

So, as for now, let just create users the same way you did to create your own,
just not setting them as maintainer.
