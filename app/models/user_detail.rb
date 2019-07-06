class UserDetail < ApplicationRecord
  belongs_to :user, optional: true

  validates :last_name, presence: true,
                        format: {
                              with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
                              message: "全角のみで入力して下さい"
                            }

  validates :first_name, presence: true,
                        format: {
                          with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
                          message: "全角のみで入力して下さい"
                        }
  validates :last_name_kana, presence: true,
                            format: {
                              with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                              message: "全角カタカナのみで入力して下さい"
                            }
  validates :first_name_kana, presence: true,
                            format: {
                              with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                              message: "全角カタカナのみで入力して下さい"
                            }
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  validates :mobile_phone, presence: true,
                            format: {
                              with: /\A\d{10}$|^\d{11}\z/,
                              message: "正しい電話番号を入力して下さい"
                            }
end
