require 'rails_helper'

describe MomentsController do
  describe "GET index" do
    it "sets the @moments variable" do
      get :index
      expect(assigns(:moments)).to be_truthy
    end
    it "returns all moments" do
      first_moment = Fabricate(:moment)
      second_moment = Fabricate(:moment)
      get :index
      expect(assigns(:moments)).to eq([first_moment,second_moment])
    end
  end
end