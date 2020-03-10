require 'rails_helper'
describe SkillsController do
	describe 'GET #index' do
		it "@skillに正しい値が入っていること" do
			skill = create(:skill)
			get :index, params: { id: skill }
			expect(assigns(:skill)).to eq skill
		end
		it "indexページが表示されること" do
			skill = create(:skill)
			get :index, params: { id: skill }
			expect(response).to render_template :index
		end
	end
end
