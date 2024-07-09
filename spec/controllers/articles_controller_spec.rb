require 'rails_helper'


RSpec.describe ArticlesController, type: :controller do
  describe "GET #index" do
    subject(:index) { get :index }

    it { is_expected.to be_successful }
  end


  describe "GET #show" do
    subject(:show) { get :show, params: { id: article.id } }
    let(:article) { create(:article) }

    it { is_expected.to be_successful }
  end

  describe "POST #create" do
  subject(:post_create) { post :create, params: article_params }

  context "with valid parameters" do
    let(:article_params) { { article: { title: "Very valid title", body: "Very very valid value", published: true } } }

    it "creates new articles" do
      expect { post_create }.to change(Article, :count).from(0).to(1)
    end

  context "with invalid parameters" do
    let(:article_params) { { article: { title: "a", body: "Very very valid value", published: true } } }

    it "does not create a new article" do
      expect { post_create }.not_to change(Article, :count)
    end
  end
end

describe "PATCH #update" do
  let(:article) { create(:article) }
  subject(:update) { patch :update, params: { id: article.id, article: article_params } }

  context "with valid parameters" do
    let(:article_params) { { title: "Very good title" } }

    it "updates the article" do
      expect { update }.to change { article.reload.title }.to("Very good title")
    end

    it "redirects to the article's show page" do
      update
      expect(response).to redirect_to(article_path(article))
    end
  end

  context "with invalid parameters" do
    let(:article_params) { { title: "a", body: "Very very valid value", published: true } }

    it "does not update the article" do
      expect { update }.not_to change { article.reload.title }
    end
  end
end


  describe "DELETE #destroy" do
  subject(:destroy) {delete :destroy, params: {id: article.id}}
  let!(:article) { create(:article) } 
  
  it "deletes the article" do
    expect { destroy }.to change(Article, :count).by(-1)
  end

  it "redirects to the articles index" do
    destroy
    expect(response).to redirect_to(articles_path)
      end
    end
  end
end