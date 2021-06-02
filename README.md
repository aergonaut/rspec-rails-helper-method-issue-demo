# rspec-rails issue 2481

This is another demo of the issue reported as [rspec-rails#2481][1]

[1]: https://github.com/rspec/rspec-rails/issues/2481

## Reproduction steps

To reproduce:

1. Clone this repo
2. Run `bundle install`
3. Run `bundle exec rspec`

## Observed behavior

The `demo.html.erb_spec.rb` view spec fails on a `NameError` for the
`example_helper_method` helper.

This method is defined in `DemoController` using `helper_method`.

When running the server, the helper method works as expected.

But in the view spec, the helper cannot be found. The output is this:

```
bundle exec rspec                                      
**F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) DemoHelper add some examples to (or delete) /Users/chris/src/coupa/rspec-rails-helper-method-issue-demo/spec/helpers/demo_helper_spec.rb
     # Not yet implemented
     # ./spec/helpers/demo_helper_spec.rb:14

  2) Demos GET /index add some examples (or delete) /Users/chris/src/coupa/rspec-rails-helper-method-issue-demo/spec/requests/demo_spec.rb
     # Not yet implemented
     # ./spec/requests/demo_spec.rb:5


Failures:

  1) demo/demo.html.erb demonstrates the issue
     Failure/Error: <h1><%= example_helper_method %></h1>
     
     ActionView::Template::Error:
       undefined local variable or method `example_helper_method' for #<ActionView::Base:0x00000000008160>
     # ./app/views/demo/demo.html.erb:1:in `_app_views_demo_demo_html_erb___545069705288937197_16540'
     # ./spec/views/demo/demo.html.erb_spec.rb:5:in `block (2 levels) in <main>'
     # ------------------
     # --- Caused by: ---
     # NameError:
     #   undefined local variable or method `example_helper_method' for #<ActionView::Base:0x00000000008160>
     #   ./app/views/demo/demo.html.erb:1:in `_app_views_demo_demo_html_erb___545069705288937197_16540'

Finished in 0.04022 seconds (files took 0.95446 seconds to load)
3 examples, 1 failure, 2 pending

Failed examples:

rspec ./spec/views/demo/demo.html.erb_spec.rb:4 # demo/demo.html.erb demonstrates the issue
```
