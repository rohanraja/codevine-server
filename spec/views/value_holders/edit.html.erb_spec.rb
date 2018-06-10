require 'rails_helper'

RSpec.describe "value_holders/edit", type: :view do
  before(:each) do
    @value_holder = assign(:value_holder, ValueHolder.create!(
      :rawValue => "MyString",
      :timeStamp => "MyString"
    ))
  end

  it "renders the edit value_holder form" do
    render

    assert_select "form[action=?][method=?]", value_holder_path(@value_holder), "post" do

      assert_select "input[name=?]", "value_holder[rawValue]"

      assert_select "input[name=?]", "value_holder[timeStamp]"
    end
  end
end
