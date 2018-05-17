require 'rails_helper'

RSpec.describe "source_file_infos/show", type: :view do
  before(:each) do
    @source_file_info = assign(:source_file_info, SourceFileInfo.create!(
      :source_code_info_id => 2,
      :code => "Code",
      :relativePath => "Relative Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Relative Path/)
  end
end
