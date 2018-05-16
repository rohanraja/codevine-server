require 'rails_helper'

RSpec.describe "method_runs/show", type: :view do
  before(:each) do
    @method_run = assign(:method_run, MethodRun.create!(
      :mrid => "Mrid"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Mrid/)
  end
end
