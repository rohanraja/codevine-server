require 'rails_helper'

RSpec.describe "method_runs/edit", type: :view do
  before(:each) do
    @method_run = assign(:method_run, MethodRun.create!(
      :mrid => "MyString",
      :relativeFilePath => "MyString",
      :methodName => "MyString"
    ))
  end

  it "renders the edit method_run form" do
    render

    assert_select "form[action=?][method=?]", method_run_path(@method_run), "post" do

      assert_select "input[name=?]", "method_run[mrid]"

      assert_select "input[name=?]", "method_run[relativeFilePath]"

      assert_select "input[name=?]", "method_run[methodName]"
    end
  end
end
