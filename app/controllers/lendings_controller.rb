class LendingsController < ApplicationController
  before_action :authenticate_librarian!

  before_action :set_lending, only: %i[ show edit update destroy ]
  before_action :set_selections, only: %i[ new edit ]

  # GET /lendings or /lendings.json
  def index
    @lendings = Lending.includes(book: :author).includes(:user).order(:returned_date)
  end

  # GET /lendings/1 or /lendings/1.json
  def show
    @book = @lending.book
    @author = @book.author
    @user = @lending.user
  end

  # GET /lendings/new
  def new
    @lending = Lending.new
  end

  # GET /lendings/1/edit
  def edit
  end

  # POST /lendings or /lendings.json
  def create
    @lending = Lending.new(lending_params)

    @lending.return_date = DateTime.now + 7.days

    respond_to do |format|
      if @lending.valid?
        Lending.transaction do
          @lending.save!
          @book = Book.find(lending_params[:book_id])
          @book.update!(available: false)
        end

        format.html { redirect_to @lending, notice: "Lending was successfully created." }
        format.json { render :show, status: :created, location: @lending }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lending.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lendings/1 or /lendings/1.json
  def update
    respond_to do |format|
      if @lending.update(lending_params)

        if lending_params[]
        end
        format.html { redirect_to @lending, notice: "Lending was successfully updated." }
        format.json { render :show, status: :ok, location: @lending }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lending.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lendings/1 or /lendings/1.json
  def destroy
    @lending.destroy!

    respond_to do |format|
      format.html { redirect_to lendings_path, status: :see_other, notice: "Lending was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def return
    @lending = Lending.find(params[:id])

    Lending.transaction do
      @lending.book.update(available: true)
      @lending.update(returned_date: Date.today)
    end

    redirect_to lending_path(@lending), notice: "The book was successfully returned."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lending
    @lending = Lending.find(params[:id])
  end

  def set_selections
    @users = User.all.where("penalty = 0").map { |user| [ user.name, user.id ] }
    @books = Book.all.where(available: true).map { |book| [ book.title, book.id ] }
  end

  # Only allow a list of trusted parameters through.
  def lending_params
    params.require(:lending).permit(:user_id, :book_id, :returned_date)
  end
end
