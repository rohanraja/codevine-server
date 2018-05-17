require 'rails_helper'

RSpec.describe "source_file_infos/edit", type: :view do
  before(:each) do
    @source_file_info = assign(:source_file_info, SourceFileInfo.create!(
      :source_code_info_id => 1,
      :code => "MyString",
      :relativePath => "MyString"
    ))
  end

  it "renders the edit source_file_info form" do
    render

    assert_select "form[action=?][method=?]", source_file_info_path(@source_file_info), "post" do

      assert_select "input[name=?]", "source_file_info[source_code_info_id]"

      assert_select "input[name=?]", "source_file_info[code]"

      assert_select "input[name=?]", "source_file_info[relativePath]"
    end
  end
end
