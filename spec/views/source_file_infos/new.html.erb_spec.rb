require 'rails_helper'

RSpec.describe "source_file_infos/new", type: :view do
  before(:each) do
    assign(:source_file_info, SourceFileInfo.new(
      :source_code_info_id => 1,
      :code => "MyString",
      :relativePath => "MyString"
    ))
  end

  it "renders new source_file_info form" do
    render

    assert_select "form[action=?][method=?]", source_file_infos_path, "post" do

      assert_select "input[name=?]", "source_file_info[source_code_info_id]"

      assert_select "input[name=?]", "source_file_info[code]"

      assert_select "input[name=?]", "source_file_info[relativePath]"
    end
  end
end
