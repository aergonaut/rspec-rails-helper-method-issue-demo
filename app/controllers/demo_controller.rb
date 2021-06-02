class DemoController < ApplicationController
  def demo
  end

  def example_helper_method
    "rspec-rails"
  end

  helper_method :example_helper_method
end
