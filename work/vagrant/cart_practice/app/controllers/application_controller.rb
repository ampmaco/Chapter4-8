class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

  private

  def current_cart
    # sessionはハッシュのようにアクセスできる
    begin
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      # 新しいカートを作成する(DBも書き込む)
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
  end
end
