require 'rails_helper'

RSpec.describe "var_instances/index", type: :view do
  before(:each) do
    assign(:var_instances, [
      VarInstance.create!(
        :name => "Name",
        :type => ""
      ),
      VarInstance.create!(
        :name => "Name",
        :type => ""
      )
    ])
  end

  it "renders a list of var_instances" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
