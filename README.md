# Rails API Authentication Practice

## Development Journal

This is a learning project, based on [this tutorial](https://www.youtube.com/playlist?list=PLgYiyoyNPrv_yNp5Pzsx0A3gQ8-tfg66j), so a lot of the code is spiked, but I plan to return and TDD the project.

### Generate Rails Repo

Generate a Rails app with PostGreSQL db, no test (will add RSpec later), and create the db once initialised.

```bash
rails new rails-auth-practice --database=postgresql -T
rails db:create
```

API only is not used as this app will leverage the regular session function offered by Rails.

### Add Gems

BCrypt for ActiveModel `has_secure_password`.

Rack-Cors to allow CORS requests from specified domains

### Configure CORS

In `config/initializers/cors.rb`:

Allow an origin domain, specify all resources with any headers and array of methods, and credentials as true.

Credentials is very important as this allows cookies to be served to the browser.

Do this for localhost:3000 (where React app will run on in development).

Also can allow the production domain (I will add this later if this gets deployed).

### Configure Session Store

In `config/initializers/session_store.rb`:

Configure a session store for a cookie store, key of '_authentication_app' (name of the cookie), and the domain (localhost:3001 for now).

### Routes

In `config/routes.rb`:

Set root to static home.

Added `app/controllers/static_controller.rb`, defined home route rendering hello world json.

It works.

### User Model

Generate model:

```bash
rails g model User email password_digest
rails db:migrate
```

In `app/models/user.rb`:

Added `has_secure_password` method. This allows ActiveRecord password hashing and authentication methods with BCrypt.

Validates email, must be present and unique.

When creating a user a password and also a password_confirmation can be supplied, if both are the same then the user can be created (as long as the email is unique).

### Sessions Create Route

In `config/routes.rb` added sessions with create as a resources.

In `app/controllers/sessions_controller.rb` create route:

Find user by email and using '&.' (safe navigation) attempt to `authenticate` with password.

`params` are nested within user.

If the user is authenticated set `session` with the users id, then render json with status 'created', logged_in: true, and the user object.

If user find or authentication fails then json with status 401 (unauthorised) is rendered.

### Registrations Create Route

In `config/routes.rb` added registrations with create as a resources.

In `app/controllers/registrations_controller.rb` create route:



