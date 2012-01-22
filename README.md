# FactoryGirl Test

This is a test project to reproduce a possiblg FactoryGirl bug.

## Config

* FactoryGirl 2.5.0
* Rails 3.1.3
* Ruby 1.9.2

## The prossible bug

When one of my Models has an attribute called `format` and this attribute has not a default value into the _factory definition_ I have an error when I try to assign a value to it into the _factory create_:


    # /test/factories.rb
    FactoryGirl.define do
      factory :thing do
        name 'Name'
      end
    end


    Factory(:thing, :format => "the format")

    ArgumentError: too few arguments
      from /Users/fguillen/.rvm/gems/ruby-1.9.2-p290@factory_girl_test/gems/factory_girl-2.5.0/lib/factory_girl/attribute_assigner.rb:36:in `format'
      from /Users/fguillen/.rvm/gems/ruby-1.9.2-p290@factory_girl_test/gems/factory_girl-2.5.0/lib/factory_girl/attribute_assigner.rb:36:in `get'
      from /Users/fguillen/.rvm/gems/ruby-1.9.2-p290@factory_girl_test/gems/factory_girl-2.5.0/lib/factory_girl/attribute_assigner.rb:14:in `block (2 levels) in object'
      from /Users/fguillen/.rvm/gems/ruby-1.9.2-p290@factory_girl_test/gems/factory_girl-2.5.0/lib/factory_girl/attribute_assigner.rb:13:in `each'
      from /Users/fguillen/.rvm/gems/ruby-1.9.2-p290@factory_girl_test/gems/factory_girl-2.5.0/lib/factory_girl/attribute_assigner.rb:13:in `block in object'
      from /Users/fguillen/.rvm/gems/ruby-1.9.2-p290@factory_girl_test/gems/factory_girl-2.5.0/lib/factory_girl/attribute_assigner.rb:12:in `tap'
      from /Users/fguillen/.rvm/gems/ruby-1.9.2-p290@factory_girl_test/gems/factory_girl-2.5.0/lib/factory_girl/attribute_assigner.rb:12:in `object'
      from /Users/fguillen/.rvm/gems/ruby-1.9.2-p290@factory_girl_test/gems/factory_girl-2.5.0/lib/factory_girl/proxy/create.rb:5:in `result'
      from /Users/fguillen/.rvm/gems/ruby-1.9.2-p290@factory_girl_test/gems/factory_girl-2.5.0/lib/factory_girl/factory.rb:48:in `run'
      from /Users/fguillen/.rvm/gems/ruby-1.9.2-p290@factory_girl_test/gems/factory_girl-2.5.0/lib/factory_girl/syntax/methods.rb:148:in `run_factory_girl_proxy'
      from /Users/fguillen/.rvm/gems/ruby-1.9.2-p290@factory_girl_test/gems/factory_girl-2.5.0/lib/factory_girl/syntax/methods.rb:63:in `create'
      from /Users/fguillen/.rvm/gems/ruby-1.9.2-p290@factory_girl_test/gems/factory_girl-2.5.0/lib/factory_girl/syntax/vintage.rb:50:in `default_strategy'
      from /Users/fguillen/.rvm/gems/ruby-1.9.2-p290@factory_girl_test/gems/factory_girl-2.5.0/lib/factory_girl/syntax/vintage.rb:143:in `Factory'
      from (irb):2
      from /Users/fguillen/.rvm/gems/ruby-1.9.2-p290@factory_girl_test/gems/railties-3.1.3/lib/rails/commands/console.rb:45:in `start'
      from /Users/fguillen/.rvm/gems/ruby-1.9.2-p290@factory_girl_test/gems/railties-3.1.3/lib/rails/commands/console.rb:8:in `start'
      from /Users/fguillen/.rvm/gems/ruby-1.9.2-p290@factory_girl_test/gems/railties-3.1.3/lib/rails/commands.rb:40:in `<top (required)>'
      from script/rails:6:in `require'
      from script/rails:6:in `<main>'1.9.2-p290 :003 >

## How to reproduce

    git clone git@github.com:fguillen/FactoryGirlTest.git
    cd FactoryGirlTest
    bundle install
    rake db:migrate
    rake db:test:prepare
    rake

There is two _models_ in this project the factory for the `Item` model works because I have a default value for the `format` attribute in the _factory definition_.


