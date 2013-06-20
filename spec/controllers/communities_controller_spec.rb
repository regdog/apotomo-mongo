require 'spec_helper'

describe CommunitiesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'admin'" do
    it "returns http success" do
      get 'admin'
      response.should be_success
    end
  end

end
