require 'rails_helper'

describe PlansController do
	let(:user) { create(:user) }
	let(:plan) { create(:plan) }
	describe 'GET #index' do
		it "配列が取得できること(@plans)" do
			plans = create_list(:plan, 3)
			get :index
			expect(assigns(:plans)).to match(plans)
		end
		it "配列が取得できること(@skills)" do
			skills = create_list(:skill, 3)
			get :index
			expect(assigns(:skills)).to match(skills)
		end
		it "indexページが表示されること" do
			get :index
			expect(response).to render_template :index
		end
	end

	describe 'GET #new' do
		it "newページが表示されること" do
			get :new
			expect(response).to render_template :new
		end
		it "新たなインスタンスが作成されていること(@plan)" do
			get :new
			expect(assigns(:plan)).to be_a_new(Plan)
		end
	end

	describe 'POST #create' do
		let(:params) { { plan: attributes_for(:plan) } }
		before do
			login user
		end
		context '保存が成功した時' do
			subject {
				post :create,
				params: params
			}
			it 'レコードが作成されること' do
				expect{ subject }.to change(Plan, :count).by(1)
			end
			it 'users_pathにリダイレクトされること' do
				subject
				expect(response).to redirect_to(users_path)
			end
		end
		context '保存が失敗した時' do
			let(:invalid_params) { { plan: attributes_for(:plan, title: nil) } }
			subject {
				post :create,
				params: invalid_params
			}
			it 'レコードが作成されないこと' do
				expect{ subject }.not_to change(Plan, :count)
			end
			it 'newアクションにrenderされること' do
				subject
				expect(response).to render_template :new
			end
		end
	end

	describe 'GET #show' do
		context  '要求されたプランが存在する時' do
			it "@planに正しい値が入っていること" do
				get :show, params: { id: plan }
				expect(assigns(:plan)).to eq plan
			end
			it "@userに正しい値が入っていること" do
				user = plan.user
				get :show, params: { id: plan }
				expect(assigns(:user)).to eq user
			end
			it "showページが表示されること" do
				get :show, params: { id: plan }
				expect(response).to render_template :show
			end
		end
	end
	
	describe 'GET #edit' do
		it "@planに正しい値が入っていること" do
			get :edit, params: { id: plan }
			expect(assigns(:plan)).to eq plan
		end
		it "editページが表示されること" do
			get :edit, params: { id: plan }
			expect(response).to render_template :edit
		end
	end

	describe 'PATCH #update' do
		let(:params) { { id: plan.id, plan: attributes_for(:plan, title: "update_test")} }
		before do
			login user
		end
		context '要求されたプランが存在している時' do
			it "@planに正しい値が入っていること" do
				patch :update, params: params
				expect(assigns(:plan)).to eq plan
			end
			context '保存が成功した時' do
				subject {
					patch :update,
					params: params
				}
				it "レコードが更新されること" do
					subject
					expect(plan.reload.title).to eq "update_test"
				end
				it "users_pathにリダイレクトされること" do
					subject
					expect(response).to redirect_to(users_path)
				end
			end
			context '保存が失敗した時' do
				let(:invalid_params) { { id: plan.id, plan: attributes_for(:plan, title: nil) } }
				subject {
					patch :update,
					params: invalid_params
				}
				it "レコードが更新されないこと" do
					subject
					expect(plan.title).to eq "testタイトルです"
				end
				it "editアクションにrenderされること" do
					subject
					expect(response).to render_template :edit
				end
			end
		end
	end

	describe 'DELETE #destroy' do
		before do
			login user
		end
		context '要求されたプランが存在している時' do
			subject {
					delete :destroy,
					params: { id: plan }
				}
			it '@planに正しい値が入っていること' do
				subject
				expect(assigns(:plan)).to eq plan
			end
			context '削除が成功した時' do
				it 'レコードが削除されること' do
					plan
					expect{ subject }.to change(Plan, :count).by(-1)
				end
				it 'destroyのviewがrenderされること' do
					subject
					expect(response).to render_template :destroy
				end
			end
		end
	end
end