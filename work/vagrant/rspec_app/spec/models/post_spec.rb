require 'rails_helper'

RSpec.describe Post, type: :model do

	context "データが正しく保存される" do
		before do
			@post = Post.new
			@post.title = ""
			@post.content = "今日も晴れです。"
			@post.save
		end
		it "titleが入力されていないので保存されない" do
			expect(@post).to be_invalid
			expect(@post.errors[:title]).to include("can't be blank")
		end
	end

end
