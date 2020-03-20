require 'rails_helper'

describe TopController do
  describe 'GET #index' do
    it "配列を作成すること" do
      plans = create_list(:plan, 3)
      get :index
      expect(assigns(:plans)).to match(plans.last(3))
    end
    it "indexのviewを表示すること" do
      get :index
      expect(response).to render_template :index
    end
  end
  describe 'GET #mentor_top' do
    it "mentor_topのviewを表示すること" do
      get :mentor_top
      expect(response).to render_template :mentor_top
    end
  end
end
