require 'rails_helper'

RSpec.describe "var_instances/show", type: :view do
  before(:each) do
    @var_instance = assign(:var_instance, VarInstance.create!(
      :name => "Name",
      :type => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
