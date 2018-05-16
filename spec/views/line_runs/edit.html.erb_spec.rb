require 'rails_helper'

RSpec.describe "line_runs/edit", type: :view do
  before(:each) do
    @line_run = assign(:line_run, LineRun.create!(
      :lineNo => 1,
      :method_run_id => 1
    ))
  end

  it "renders the edit line_run form" do
    render

    assert_select "form[action=?][method=?]", line_run_path(@line_run), "post" do

      assert_select "input[name=?]", "line_run[lineNo]"

      assert_select "input[name=?]", "line_run[method_run_id]"
    end
  end
end
