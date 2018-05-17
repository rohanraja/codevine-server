require 'rails_helper'

RSpec.describe "source_file_infos/index", type: :view do
  before(:each) do
    assign(:source_file_infos, [
      SourceFileInfo.create!(
        :source_code_info_id => 2,
        :code => "Code",
        :relativePath => "Relative Path"
      ),
      SourceFileInfo.create!(
        :source_code_info_id => 2,
        :code => "Code",
        :relativePath => "Relative Path"
      )
    ])
  end

  it "renders a list of source_file_infos" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Relative Path".to_s, :count => 2
  end
end
