module ProductsHelper
  def converting_to_jpy(price)
    #金額表示にカンマを入れるメソッド
    "¥#{price.to_s(:delimited, delimiter: ',')}"
  end
end