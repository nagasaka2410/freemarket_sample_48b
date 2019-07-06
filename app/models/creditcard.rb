class Creditcard < ApplicationRecord
  belongs_to :user, optional: true

  validates :card_number, presence: true,
                          format: {
                              with: /\A[0-9]+\z/,
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
