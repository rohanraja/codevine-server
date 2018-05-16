require 'rails_helper'

RSpec.describe "line_runs/show", type: :view do
  before(:each) do
    @line_run = assign(:line_run, LineRun.create!(
      :lineNo => 2,
      :method_run_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
