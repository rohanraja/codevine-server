require 'rails_helper'

RSpec.describe "method_runs/show", type: :view do
  before(:each) do
    @method_run = assign(:method_run, MethodRun.create!(
      :mrid => "Mrid",
      :relativeFilePath => "Relative File Path",
      :methodName => "Method Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Mrid/)
    expect(rendered).to match(/Relative File Path/)
    expect(rendered).to match(/Method Name/)
  end
end
