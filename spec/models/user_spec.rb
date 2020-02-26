require 'rails_helper' 

describe User do
  describe '#create' do
    # 1. nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation, family_name, first_name, family_furigana, first_furigana, birthday_year, birthday_month, birthday_day" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 3. emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 6. family_nameが空では登録できないこと
    it "is invalid without a family_name" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

      # 7. first_nameが空では登録できないこと
      it "is invalid without a first_name" do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
      end

      # 8. family_furiganaが空では登録できないこと
      it "is invalid without a family_furigana" do
        user = build(:user, family_furigana: nil)
        user.valid?
        expect(user.errors[:family_furigana]).to include("can't be blank")
      end

      # 9. first_furiganaが空では登録できないこと
      it "is invalid without a first_furigana" do
        user = build(:user, first_furigana: nil)
        user.valid?
        expect(user.errors[:first_furigana]).to include("can't be blank")
      end

      # 10. birthday_yearが空では登録できないこと
      it "is invalid without a birthday_year" do
        user = build(:user, birthday_year: nil)
        user.valid?
        expect(user.errors[:birthday_year]).to include("can't be blank")
      end


      # 11. birthday_monthが空では登録できないこと
      it "is invalid without a birthday_year" do
        user = build(:user, birthday_month: nil)
        user.valid?
        expect(user.errors[:birthday_month]).to include("can't be blank")
      end


      # 12. birthday_dayが空では登録できないこと
      it "is invalid without a birthday_year" do
        user = build(:user, birthday_day: nil)
        user.valid?
        expect(user.errors[:birthday_day]).to include("can't be blank")
      end
  
    # 13. nicknameが7文字以上であれば登録できないこと
    it "is invalid with a nickname that has more than 7 characters " do
      user = build(:user, nickname: "aaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
    end

    # 14. nicknameが6文字以下では登録できること
    it "is valid with a nickname that has less than 6 characters " do
      user = build(:user, nickname: "aaaaaa")
      expect(user).to be_valid
    end

    # 15. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 16. passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    # 17. passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end

describe Address do
  describe '#create' do
    # 1. family_name, first_name, family_furigana, first_furigana, number, prefecture, municipality, streetが存在すれば登録できること
    it "is valid with a family_name, first_name, family_furigana, first_furigana, number, prefecture, municipality, street" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. family_nameが空では登録できないこと
    it "is invalid without a family_name," do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name,]).to include("can't be blank")
    end

    # 3. family_furiganaが空では登録できないこと
    it "is invalid without a family_furigana" do
      user = build(:user, family_furigana: nil)
      user.valid?
      expect(user.errors[:family_furigan]).to include("can't be blank")
    end

    # 4. first_furiganaが空では登録できないこと
    it "is invalid without a first_furigana" do
      user = build(:user, first_furigana: nil)
      user.valid?
      expect(user.errors[:first_furigana]).to include("can't be blank")
    end

    # 5. first_furiganaが空では登録できないこと
    it "is invalid without a first_furigana" do
      user = build(:user, first_furigana: nil)
      user.valid?
      expect(user.errors[:first_furigana]).to include("can't be blank")
    end

    # 6. numberが空では登録できないこと
    it "is invalid without a number" do
      user = build(:user, number: nil)
      user.valid?
      expect(user.errors[:number]).to include("can't be blank")
    end

    # 7. prefectureが空では登録できないこと
    it "is invalid without a prefecture" do
      user = build(:user, prefecture: nil)
      user.valid?
      expect(user.errors[:prefecture]).to include("can't be blank")
    end

    # 8. municipalityが空では登録できないこと
    it "is invalid without a municipality" do
      user = build(:user, municipality: nil)
      user.valid?
      expect(user.errors[:municipality]).to include("can't be blank")
    end

    # 9. streetが空では登録できないこと
    it "is invalid without a street" do
      user = build(:user, street: nil)
      user.valid?
      expect(user.errors[:street]).to include("can't be blank")
    end

  
    # 13. numberが8文字以上であれば登録できないこと
    it "is invalid with a nickname that has more than 8 characters " do
      user = build(:user, number: "aaaaaaaa")
      user.valid?
      expect(user.errors[:number]).to include("is too long (maximum is 7 characters)")
    end

    # 14. numberが7文字以下では登録できること
    it "is valid with a nickname that has less than 7 characters " do
      user = build(:user, nickname: "0000000")
      expect(user).to be_valid
    end
  end
end