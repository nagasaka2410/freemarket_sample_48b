class Creditcard < ApplicationRecord
  belongs_to :user, optional: true

  validates :card_number, presence: true,
                          format: {
                              with: /\A(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6011[0-9]{12}|3(?:0[0-5]|[68][0-9])[0-9]{11}|3[47]{13}|(?:2131|1800|35[0-9]{3})[0-9]{11})\z/,
                              message: "半角数字のみで入力して下さい"
                            }
  validates :valid_month, presence: true
  validates :valid_year, presence: true
  validates :security_code, presence: true, length: { in: 3..4 },
                            format: {
                              with: /\A[0-9]+\z/,
                              message: "半角数字のみで入力して下さい"
                            }
end
