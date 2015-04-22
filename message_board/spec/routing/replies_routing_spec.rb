require "rails_helper"

RSpec.describe RepliesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/posts/1/replies").to route_to("replies#index", :post_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/posts/1/replies/new").to route_to("replies#new", :post_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/posts/1/replies/1").to route_to("replies#show", :post_id =>"1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/posts/1/replies/1/edit").to route_to("replies#edit", :post_id => "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/posts/1/replies").to route_to("replies#create", :post_id => "1")
    end

    it "routes to #update" do
      expect(:put => "/posts/1/replies/1").to route_to("replies#update", :post_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/posts/1/replies/1").to route_to("replies#destroy",:post_id => "1", :id => "1")
    end

  end
end
