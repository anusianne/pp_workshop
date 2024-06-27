require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "validations" do
    subject(:article) { article }

    context "when title is empty" do
      let(:article) { build(:article, title: nil) }

      it "throws an error" do
        expect(subject).to_not be_valid
        expect(subject.errors[:title]).to include("can't be blank")
      end
    end

    context "when title is too short" do
      let(:article) { build(:article, title: "a") }

      it "throws an error" do
        expect(subject).to_not be_valid
        expect(subject.errors[:title]).to include("is too short (minimum is 5 characters)")
      end
    end

    context "when title is too long" do
      let(:article) { build(:article, title: "a" * 31) }

      it "throws an error" do
        expect(subject).to_not be_valid
        expect(subject.errors[:title]).to include("is too long (maximum is 30 characters)")
      end
    end

    context "when body is empty" do
      let(:article) { build(:article, body: nil) }

      it "throws an error" do
        expect(subject).to_not be_valid
        expect(subject.errors[:body]).to include("can't be blank")
      end
    end

    context "when body is too short" do
      let(:article) { build(:article, body: "a") }

      it "throws an error" do
        expect(subject).to_not be_valid
        expect(subject.errors[:body]).to include("is too short (minimum is 15 characters)")
      end
    end

    context "when body is too long" do
      let(:article) { build(:article, body: "a" * 3001) }

      it "throws an error" do
        expect(subject).to_not be_valid
        expect(subject.errors[:body]).to include("is too long (maximum is 3000 characters)")
      end
    end

    context "when published is not a boolean" do
      let(:article) { build(:article, published: nil) }

      it "throws an error" do
        expect(subject).to_not be_valid
        expect(subject.errors[:published]).to include("is not included in the list")
      end
    end

    context "when all params are valid" do
      let(:article) { build(:article) }

      it { expect(subject).to be_valid }
    end
  end

  context "with image attached" do
    let!(:article) { create(:article, :with_image) }

    it "is valid with an attached image" do
      expect(article.image).to be_attached
    end
  end

  context "without image attached" do
    let!(:article) { create(:article) }

    it "is valid without an attached image" do
      expect(article.image).to_not be_attached
    end
  end
end
