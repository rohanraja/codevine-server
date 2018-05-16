require 'rails_helper'

RSpec.describe "line_runs/index", type: :view do
  before(:each) do
    assign(:line_runs, [
      LineRun.create!(
        :lineNo => 2,
        :method_run_id => 3
      ),
      LineRun.create!(
        :lineNo => 2,
        :method_run_id => 3
      )
    ])
  end

  it "renders a list of line_runs" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
