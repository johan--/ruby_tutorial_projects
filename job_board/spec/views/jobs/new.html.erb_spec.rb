require 'rails_helper'

RSpec.describe "jobs/new", type: :view do
  before(:each) do
    assign(:job, Job.new(
      :title => "MyText",
      :description => "MyText"
    ))
  end

  it "renders new job form" do
    render

    assert_select "form[action=?][method=?]", jobs_path, "post" do

      assert_select "textarea#job_title[name=?]", "job[title]"

      assert_select "textarea#job_description[name=?]", "job[description]"
    end
  end
end
