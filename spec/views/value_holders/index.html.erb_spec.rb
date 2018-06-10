require 'rails_helper'

RSpec.describe "value_holders/index", type: :view do
  before(:each) do
    assign(:value_holders, [
      ValueHolder.create!(
        :rawValue => "Raw Value",
        :timeStamp => "Time Stamp"
      ),
      ValueHolder.create!(
        :rawValue => "Raw Value",
        :timeStamp => "Time Stamp"
      )
    ])
  end

  it "renders a list of value_holders" do
    render
    assert_select "tr>td", :text => "Raw Value".to_s, :count => 2
    assert_select "tr>td", :text => "Time Stamp".to_s, :count => 2
  end
end
