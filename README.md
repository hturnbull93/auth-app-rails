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

## Add Gems

BCrypt for ActiveModel `has_secure_password`.

Rack-Cors to allow CORS requests from specified domains


