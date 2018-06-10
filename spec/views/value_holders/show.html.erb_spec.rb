require 'rails_helper'

RSpec.describe "value_holders/show", type: :view do
  before(:each) do
    @value_holder = assign(:value_holder, ValueHolder.create!(
      :rawValue => "Raw Value",
      :timeStamp => "Time Stamp"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Raw Value/)
    expect(rendered).to match(/Time Stamp/)
  end
end
