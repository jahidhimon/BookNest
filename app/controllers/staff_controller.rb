class StaffController < ApplicationController
  before_action :authenticate_librarian!

  def dashboard
    @lendings = Lending.all
    @currently_lent = Lending.where(returned_date: nil).count
    @total_books = Book.all.count
    @available_books = Book.where(available: true).count
    @total_returned_books = Lending.where.not(returned_date: nil).count
    @total_checkouts = Lending.count
    @total_penalties = Lending.sum(:penalty)
    @total_users = User.count
    @total_authors = Author.count
    @total_publishers = Publisher.count
  end

  def browse_books
    if params[:commit] == "search" && params[:query] != ""
      @section_title = "Showing Results for '#{params[:query]}'"
      @books = Book.where("title like ?", "%#{params[:query]}%").order(visits: :desc)
    else
      @section_title = "All Books"
    @books = Book.all.order(created_at: :desc)
    end
  end

  def users
    if params[:commit] == "search" && params[:query] != ""
      @section_title = "Showing Results for '#{params[:query]}'"
      @users = User.where("name like ?", "%#{params[:query]}%").order(name: :desc)
    else
      @section_title = "All Users"
      @users = User.all.order(created_at: :desc)
    end
  end

  def user
    @user = User.find(params[:id])
  end
end
