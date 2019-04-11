class BooksController < ApplicationController

  def show
  	@book = Book.find(params[:id])
  end

  def index
  	@book = Book.new
  	@books = Book.all
  end

 def create
	@book = Book.new(book_params)
		if @book.save
		redirect_to book_path(@book.id), notice: "#{@book.title} is posted"
		else
			render action: :new
		end
 end

 def edit
 	@book = Book.find(params[:id])
 end

 def update
 	book = Book.find(params[:id])
 	book.update(book_params)
 	redirect_to book_path(book.id)
 end

 def destroy
 	book = Book.find(params[:id])
 	if book.destroy
 	redirect_to books_path, notice: "#{book.title} is deleted"
 	else
 		rendre action: :new
 	end
 end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end

end