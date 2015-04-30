require 'rails_helper'

RSpec.describe "statuses/new", type: :view do
  before(:each) do
    assign(:status, Status.new(
      :content => "MyText",
      :user => nil
    ))
  end

  it "renders new status form" do
    render

    assert_select "form[action=?][method=?]", statuses_path, "post" do

      assert_select "textarea#status_content[name=?]", "status[content]"

      assert_select "input#status_user_id[name=?]", "status[user_id]"
    end
  end
end
