# rails_react_boilerplate
Boilerplate app to use rails with react

Uses:
* `devise` for authentication
* `pundit` for authorization
* `pronto` for static code analysis
* Ruby version
    `2.6.5`
* Node version `13.2.0`    
    
**Getting Started**

* Create `.env` file.  Copy contents from `.env.example` to `.env` 

* `bundle install` `rails db:create` `rails db:migrate`

* `yarn install` for downloading the required packages and run `bin/webpack-dev-server` for assets compilation.

**Running Application**

* run `rails server`

* Go to `localhost:3000`
