# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

The app sends a welcome email to the user upon signing-up. Also it sends an order receipt upon completing an order, which ist the total as well as each line item in the order. The app is tested using rspec and capybara.

## Final Product

!["screenshot of jungle home page"](https://github.com/Marwa7246/jungle-rails/blob/master/docs/home-page.png)
!["screenshot of admin products view"](https://github.com/Marwa7246/jungle-rails/blob/master/docs/admin-product-view.png)
!["screenshot of shopping cart"](https://github.com/Marwa7246/jungle-rails/blob/master/docs/shopping-cart.png)
!["screenshot of sign-up form"](https://github.com/Marwa7246/jungle-rails/blob/master/docs/signup-form.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Rspec
* capybara
* data_base_cleaner
* poltergeist

