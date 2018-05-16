require 'rails_helper'

RSpec.describe "method_runs/index", type: :view do
  before(:each) do
    assign(:method_runs, [
      MethodRun.create!(
        :mrid => "Mrid"
      ),
      MethodRun.create!(
        :mrid => "Mrid"
      )
    ])
  end

  it "renders a list of method_runs" do
    render
    assert_select "tr>td", :text => "Mrid".to_s, :count => 2
  end
end
