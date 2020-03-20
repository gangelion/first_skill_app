require 'rails_helper'
describe UsersController do
  let(:user) { create(:user) }
  before do
    login(user)
  end
  describe 'GET #index' do
    it "@plansに値が配列として入っているか(created_atの降順）" do
      plans = create_list(:plan, 5)
      get :index
      expect(assigns(:plans)).to match(plans.sort { |a, b| b.created_at <=> a.created_at })
    end
    it "indexページが表示されること" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "@userに正しい値が入っていること" do
      get :show, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "showページが表示されること" do
      get :show, params: { id: user }
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it "@userに正しい値が入っていること" do
      get :edit, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "editページが表示されること" do
      get :edit, params: { id: user }
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    let(:params) { { id: user.id, user: attributes_for(:user, name: "update_test") } }
    it "@userに正しい値が入っていること" do
      patch :update, params: params
      expect(assigns(:user)).to eq user
    end
    context '値の更新に成功した時' do
      subject do
        patch :update,
              params: params
      end
      it "レコードが更新されること" do
        subject
        expect(user.reload.name).to eq "update_test"
      end
      it "users_pathにredirectされること" do
        subject
        expect(response).to redirect_to(users_path)
      end
    end
    context '値の更新に失敗した時' do
      let(:invalid_params) { { id: user.id, user: attributes_for(:user, name: nil) } }
      subject do
        patch :update,
              params: invalid_params
      end
      it "レコードが更新されないこと" do
        subject
        expect(user.name).to eq "test"
      end
      it "editアクションにrenderされること" do
        subject
        expect(response).to render_template :edit
      end
    end
  end
  describe "DELETE #destroy" do
    subject do
      delete :destroy,
             params: { id: user.id }
    end
    it "@userの値が正しいこと" do
      subject
      expect(assigns(:user)).to eq user
    end
    it "レコードが削除されること" do
      expect { subject }.to change(User, :count).by(-1)
    end
    it "destroyのviewがrenderされること" do
      subject
      expect(response).to render_template :destroy
    end
  end

  describe "GET #delete_confirm" do
    it "delete_confirmのviewが表示されること" do
      get :delete_confirm, params: { id: user }
      expect(response).to render_template :delete_confirm
    end
  end
end
