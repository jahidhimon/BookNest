# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @latest = Book.order(created_at: :desc).limit(10)
    @popular = Book.order(visits: :desc).limit(10)
  end
end
