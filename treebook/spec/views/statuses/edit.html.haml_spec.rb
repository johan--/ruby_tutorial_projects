require 'rails_helper'

RSpec.describe "statuses/edit", type: :view do
  before(:each) do
    @status = assign(:status, Status.create!(
      :content => "MyText",
      :user => nil
    ))
  end

  it "renders the edit status form" do
    render

    assert_select "form[action=?][method=?]", status_path(@status), "post" do

      assert_select "textarea#status_content[name=?]", "status[content]"

      assert_select "input#status_user_id[name=?]", "status[user_id]"
    end
  end
end
