require "rails_helper"

RSpec.describe "demo/demo.html.erb", type: :view do
  it "demonstrates the issue" do
    render
    expect(rendered).to include("rspec-rails")
  end
end
