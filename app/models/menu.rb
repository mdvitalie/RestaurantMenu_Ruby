# frozen_string_literal: true

class Menu < ApplicationRecord
  include Visible

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :price, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
