require 'rails_helper'

RSpec.describe "clr_class_instances/edit", type: :view do
  before(:each) do
    @clr_class_instance = assign(:clr_class_instance, ClrClassInstance.create!(
      :instanceId => "MyString"
    ))
  end

  it "renders the edit clr_class_instance form" do
    render

    assert_select "form[action=?][method=?]", clr_class_instance_path(@clr_class_instance), "post" do

      assert_select "input[name=?]", "clr_class_instance[instanceId]"
    end
  end
end
