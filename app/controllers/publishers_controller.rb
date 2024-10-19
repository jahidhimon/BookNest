class PublishersController < ApplicationController
  before_action :authenticate_librarian!, only: %i[new create edit update destroy]
  before_action :set_publisher, only: %i[ show edit update destroy ]

  # GET /publishers or /publishers.json
  def index
    if params[:commit] == "search" && params[:query] != ""
      @section_title = "Showing Results for '#{params[:query]}'"
      @publishers = Publisher.where("title like ?", "%#{params[:query]}%").order(visits: :desc)
    else
      @section_title = "All Publishers"
      @publishers = Publisher.all.order(created_at: :desc)
    end
  end

  # GET /publishers/1 or /publishers/1.json
  def show
    @books = @publisher.books.order(visits: :desc)
  end

  # GET /publishers/new
  def new
    @publisher = Publisher.new
  end

  # GET /publishers/1/edit
  def edit
  end

  # POST /publishers or /publishers.json
  def create
    @publisher = Publisher.new(publisher_params)

    respond_to do |format|
      if @publisher.save
        format.html { redirect_to @publisher, notice: "Publisher was successfully created." }
        format.json { render :show, status: :created, location: @publisher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publishers/1 or /publishers/1.json
  def update
    respond_to do |format|
      if @publisher.update(publisher_params)
        format.html { redirect_to @publisher, notice: "Publisher was successfully updated." }
        format.json { render :show, status: :ok, location: @publisher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publishers/1 or /publishers/1.json
  def destroy
    @publisher.destroy!

    respond_to do |format|
      format.html { redirect_to publishers_path, status: :see_other, notice: "Publisher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def publisher_params
      params.require(:publisher).permit(:year_of_publication, :name)
    end
end
