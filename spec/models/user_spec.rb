require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nameが正しく入力されている時' do
        @user.name = '太朗'
        expect(@user).to be_valid
      end

      it 'emailが正しく入力されているとき' do
        @user.email = 'kengo0501@gmail.com'
        expect(@user).to be_valid
      end

      it 'passwordが正しく入力されているとき' do
        @user.password = 'a1a1a1a1'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ユーザー名を入力してください')
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'passwordが英語のみでは登録できないこと' do
        @user.password = 'tarouyamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを半角英数混合で入力してください')
      end

      it 'passwordが数字のみでは登録できないこと' do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを半角英数混合で入力してください')
      end

      it 'passwordが全角では登録できないこと' do
        @user.password = 'YAMADA０１０１'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを半角英数混合で入力してください')
      end
    end
  end
end
