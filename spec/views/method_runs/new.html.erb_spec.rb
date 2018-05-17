require 'rails_helper'

RSpec.describe "method_runs/new", type: :view do
  before(:each) do
    assign(:method_run, MethodRun.new(
      :mrid => "MyString",
      :relativeFilePath => "MyString",
      :methodName => "MyString"
    ))
  end

  it "renders new method_run form" do
    render

    assert_select "form[action=?][method=?]", method_runs_path, "post" do

      assert_select "input[name=?]", "method_run[mrid]"

      assert_select "input[name=?]", "method_run[relativeFilePath]"

      assert_select "input[name=?]", "method_run[methodName]"
    end
  end
end
