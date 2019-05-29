class Cart < ApplicationRecord
	has_many :line_items
	# 商品を破棄する際のフックメソッドを登録する
	# destroy()が実行される前に、Railsが自動的に実行する
	# 戻り値がfalseであれば、destroy()は実行されない
	# (リフレクションで呼出されるらしい)
	before_destroy :ensure_not_referenced_by_any_line_item

	# Validation
	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :image_url, allow_blank: true, format: {
 	 with:    %r{\.(gif|jpg|png)\z}i,
 	 message: 'はGIF、JPG、PNG画像のURLでなければなりません'
	}
	validates :title, length: {minimum: 10}

private

	def ensure_not_referenced_by_any_line_item
  	# 関連する品目が空でないか検証
  		if line_items.empty?
    		return true
  		else
  		  	errors.add(:base, "品目が存在します")
    		return false
  		end
	end


end
