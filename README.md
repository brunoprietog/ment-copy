# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 3.0.2

* System dependencies

* Configuration

* Database creation

```bash
sudo su postgres
psql -d postgres
create user ment with encrypted password '12345';
create database ment_development;
grant all privileges on database ment_development to ment;
ALTER ROLE ment SUPERUSER;
```

* Database initialization: `rails db:migrate`

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
