require 'rails_helper'

RSpec.describe "clr_class_instances/index", type: :view do
  before(:each) do
    assign(:clr_class_instances, [
      ClrClassInstance.create!(
        :instanceId => "Instance"
      ),
      ClrClassInstance.create!(
        :instanceId => "Instance"
      )
    ])
  end

  it "renders a list of clr_class_instances" do
    render
    assert_select "tr>td", :text => "Instance".to_s, :count => 2
  end
end
