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
        expect(@mypage.errors.full_messages).to include("タイトルを入力してください")
      end

      it 'catch_copyが空では投稿出来ない' do
        @mypage.catch_copy = ''
        @mypage.valid?
        expect(@mypage.errors.full_messages).to include("キャッチコピーを入力してください")
      end

      it 'conceptが空では投稿出来ない' do
        @mypage.concept = ''
        @mypage.valid?
        expect(@mypage.errors.full_messages).to include("コンセプトを入力してください")
      end

      it 'imageが空では投稿出来ない' do
        @mypage.image = nil
        @mypage.valid?
        expect(@mypage.errors.full_messages).to include("画像を入力してください")
      end
    end
  end
end
