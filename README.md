# Intercom RuboCop

A base RuboCop configuration for use on all Intercom Ruby projects.

## Installation

Add the gem to the `development` and `test` groups in your Gemfile.

```ruby
group :development, :test do
  gem "intercom-rubocop", require: false
end
```

Then install it.

```shell
bundle install
```

Create a `.rubocop.yml` file in the root of your repository if one doesn’t already exist.

Inherit from the RuboCop configuration in this gem. If it’s a Rails app use the Rails-specific configuration.

```yaml
inherit_gem:
  intercom-rubocop: ".rubocop.rails.yml"
```

If it’s a Ruby library use the regular configuration.

```yaml
inherit_gem:
  intercom-rubocop: ".rubocop.yml"
```

## Usage

When you run `rubocop`, remember that you have to run it through Bundler in order for it to find the gem dependency.

```shell
bundle exec rubocop
```

If you are adding it an existing repository there will likely be an overwhelming number of changes required. You can auto-generate a configuration based off of the one we inherit from.

```shell
bundle exec rubocop --auto-gen-config
```

This will create a `.rubocop_todo.yml` with cops excluded or disabled depending on how many offenses are found that you can inherit from after the gem.

```yaml
inherit_gem:
  intercom-rubocop: ".rubocop.yml"

inherit_from: .rubocop_todo.yml
```

Then you can slowly slowly update the code, removing exclusions and enabling cops until you can remove the todo file altogether.

### Offenses

There will probably be lots of offenses if you’re adding it to an existing application or library.

## Changes

Please consider that these styles have been assembled with great care and consideration. If RuboCop has found an offense and you disagree with it, changing the styles or permanently disabling the cop is probably not the right thing to do.

### Overriding

RuboCop is designed such that its configuration can be overridden. If you have a scenario where RuboCop is wrong for some reason, you can use [inline overrides](http://rubocop.readthedocs.io/en/latest/configuration/#includingexcluding-files#disabling-cops-within-source-code) in your repository. If entire files or directories clash with a specific rule, you can use [exclusions](http://rubocop.readthedocs.io/en/latest/configuration/#includingexcluding-files) in your RuboCop configuration in your repository. Keep in mind that exclusions for a cop obliterate any inherited exclusions for the same cop. So if there are any, you’d need to redefine those and then _add_ your exclusion to the list.

That said, use that power with care. Disabling a style or enforcing a different style for an entire repository because you disagree with it erodes the benefits of consistency and defeats the purpose of linting in the first place.

### Updating

If you’re positive the style is wrong and should be changed, let @brandonweiss know and we can figure out if that’s the right thing to do.

### Bugs

If RuboCop is telling you to do something really weird, it’s probably a bug or unconsidered edge-case. Let @brandonweiss know and we’ll sort it out.
