# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!, only: [ :user_profile ]

  def home
    @latest = Book.order(created_at: :desc).limit(10)
    @popular = Book.order(visits: :desc).limit(10)
  end

  def user_profile
  end
end
