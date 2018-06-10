require 'rails_helper'

RSpec.describe "var_instances/new", type: :view do
  before(:each) do
    assign(:var_instance, VarInstance.new(
      :name => "MyString",
      :type => ""
    ))
  end

  it "renders new var_instance form" do
    render

    assert_select "form[action=?][method=?]", var_instances_path, "post" do

      assert_select "input[name=?]", "var_instance[name]"

      assert_select "input[name=?]", "var_instance[type]"
    end
  end
end
