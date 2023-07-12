# Rails `filter_attributes` Issue Reproduction Sample Project

An attempt to demonstrate the issue reported in https://github.com/rails/rails/issues/48704.

There are three commits:

- The first commit is from the Rails Getting Started Guide: https://guides.rubyonrails.org/getting_started.html
- The second commit:
  - Updates `config/application.rb` to conditionally reference `ActiveRecord::Base`. This mimics an application depending on a Gem which references `ActiveRecord::Base`.
  - Updates `config/environment.rb` to print `filter_parameters` and `filter_attributes` after the application has been initialized.
- The third commit updates `Gemfile` to conditionally include the `delayed_job_active_record` gem. 

To use, first run any of the following commands and note the `filter_attributes` and `filter_parameters` in the output:

```shell
> REQUIRE_ACTIVE_RECORD=0 bin/rails server
> WITH_DELAYED_JOB=0 bash -c 'bundle install; bin/rails server'
```

```shell
=> Booting Puma
=> Rails 7.0.6 application starting in development
=> Run `bin/rails server --help` for more startup options
filter_parameters: [:passw, :secret, :token, :_key, :crypt, :salt, :certificate, :otp, :ssn]
filter_attributes: [:passw, :secret, :token, :_key, :crypt, :salt, :certificate, :otp, :ssn]
Exiting
```

Next, run any of the following commands and note the `filter_attributes` and `filter_parameters` in the output:

```shell
> REQUIRE_ACTIVE_RECORD=1 bin/rails server
> WITH_DELAYED_JOB=1 bash -c 'bundle install; bin/rails server'
```

```shell
=> Booting Puma
=> Rails 7.0.6 application starting in development
=> Run `bin/rails server --help` for more startup options
filter_parameters: [:passw, :secret, :token, :_key, :crypt, :salt, :certificate, :otp, :ssn]
filter_attributes: []
Exiting
```
