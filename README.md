# Marqeta Sandbox API
Using the [Marqeta API](https://www.marqeta.com/api) to simulate a transaction in Ruby.

## Steps
* Fork repo and clone locally.
* Create an account to use their API in a sandbox environment.
* Create a file called `secrets.rb` and add the following `Secrets` module to it:

``` Ruby
  module Secrets
    Application_Token   = "insert application token here"
    Master_Access_Token = "insert master access token here"
    Shared_environment_base_URL =  "insert shared environment base URL here"
  end
```

* Use `api_test.rb` to play around with the API. 
