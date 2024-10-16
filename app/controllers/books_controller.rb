class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :set_selections, only: %i[new edit]

  # GET /books or /books.json
  def index
    if params[:commit] == "search" && params[:query] != ""
      @section_title = "Showing Results for '#{params[:query]}'"
      @books = Book.where("title like ?", "%#{params[:query]}%").order(visits: :desc)
    else
      @section_title = "All Books"
    @books = Book.all.order(created_at: :desc)
    end
  end

  # GET /books/1 or /books/1.json
  def show
    @author = @book.author
    @similar = Book.where(category: @book.category).where.not(id: @book.id).order(visits: :desc).limit(4)
    @author_books = @author.books.where.not(id: @book.id).order(visits: :desc).limit(4)

    @book.update(visits: @book.visits+1)
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_path, status: :see_other, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_selections
    @authors = Author.all.map { |author| [ author.name, author.id ] }
    @publishers = Publisher.all.map { |publisher| [ publisher.name, publisher.id ] }
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:isbn, :title, :edition, :category, :description, :author_id, :publisher_id, :cover)
  end
end
