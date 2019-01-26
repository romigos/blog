# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, :summary, :contenr, presence: true
end
