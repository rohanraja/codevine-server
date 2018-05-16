require 'rails_helper'

RSpec.describe "line_runs/new", type: :view do
  before(:each) do
    assign(:line_run, LineRun.new(
      :lineNo => 1,
      :method_run_id => 1
    ))
  end

  it "renders new line_run form" do
    render

    assert_select "form[action=?][method=?]", line_runs_path, "post" do

      assert_select "input[name=?]", "line_run[lineNo]"

      assert_select "input[name=?]", "line_run[method_run_id]"
    end
  end
end
