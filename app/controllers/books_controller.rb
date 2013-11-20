class BooksController < ApplicationController
    http_basic_authenticate_with name: "rabierre", password: "1shdlfm", except:[:index, :show]

    def index
        @books = Book.find(:all, :order => "id desc", :limit => 3)
    end

    def list
        @books = Book.all
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(params[:book].permit(:title, :author, :summary))

        if @book.save
            redirect_to @book
        else
            render 'new'
        end
    end

    def show
        @book = Book.find(params[:id])
    end

    def destroy
        @book = Book.find(params[:id])
        # todo not delete Book but inactivate
        @book.delete

        redirect_to books_path
    end
end