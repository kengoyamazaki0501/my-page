require 'rails_helper'
describe Mypage do
  before do
    @mypage = FactoryBot.build(:mypage)
  end

  describe 'mypage新規投稿' do
    context '新規投稿ができるとき' do
      it '全ての情報が存在すれば登録できる' do
        expect(@mypage).to be_valid
      end

      it 'imageがあれば投稿できる' do
        @mypage.image 
        @mypage.valid?
        expect(@mypage).to be_valid
      end
    end

    context '商品の出品ができないとき' do
      it 'titleが空では投稿出来ない' do
        @mypage.title = ''
        @mypage.valid?
        expect(@mypage.errors.full_messages).to include("Title can't be blank")
      end

      it 'catch_copyが空では投稿出来ない' do
        @mypage.catch_copy = ''
        @mypage.valid?
        expect(@mypage.errors.full_messages).to include("Catch copy can't be blank")
      end

      it 'conceptが空では投稿出来ない' do
        @mypage.concept = ''
        @mypage.valid?
        expect(@mypage.errors.full_messages).to include("Concept can't be blank")
      end

      it 'imageが空では投稿出来ない' do
        @mypage.image = nil
        @mypage.valid?
        expect(@mypage.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
