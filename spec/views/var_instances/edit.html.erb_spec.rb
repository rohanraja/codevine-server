require 'rails_helper'

RSpec.describe "var_instances/edit", type: :view do
  before(:each) do
    @var_instance = assign(:var_instance, VarInstance.create!(
      :name => "MyString",
      :type => ""
    ))
  end

  it "renders the edit var_instance form" do
    render

    assert_select "form[action=?][method=?]", var_instance_path(@var_instance), "post" do

      assert_select "input[name=?]", "var_instance[name]"

      assert_select "input[name=?]", "var_instance[type]"
    end
  end
end
