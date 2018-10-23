class BooksController < ApplicationController

  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.text
      format.csv do #generates and downloads CSV file
        render plain: Book.generate_csv(@books)
      end
      format.json do
        render json: @books.map { |book|
          { name: book.title,
            author: book.author,
            read_status: book.already_read
          }
        }
      end
    end
  end

end
