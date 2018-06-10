require 'rails_helper'

RSpec.describe "value_holders/new", type: :view do
  before(:each) do
    assign(:value_holder, ValueHolder.new(
      :rawValue => "MyString",
      :timeStamp => "MyString"
    ))
  end

  it "renders new value_holder form" do
    render

    assert_select "form[action=?][method=?]", value_holders_path, "post" do

      assert_select "input[name=?]", "value_holder[rawValue]"

      assert_select "input[name=?]", "value_holder[timeStamp]"
    end
  end
end
