require 'rails_helper'

RSpec.describe "clr_class_instances/new", type: :view do
  before(:each) do
    assign(:clr_class_instance, ClrClassInstance.new(
      :instanceId => "MyString"
    ))
  end

  it "renders new clr_class_instance form" do
    render

    assert_select "form[action=?][method=?]", clr_class_instances_path, "post" do

      assert_select "input[name=?]", "clr_class_instance[instanceId]"
    end
  end
end
