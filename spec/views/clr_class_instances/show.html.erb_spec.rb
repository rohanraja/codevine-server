require 'rails_helper'

RSpec.describe "clr_class_instances/show", type: :view do
  before(:each) do
    @clr_class_instance = assign(:clr_class_instance, ClrClassInstance.create!(
      :instanceId => "Instance"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Instance/)
  end
end
