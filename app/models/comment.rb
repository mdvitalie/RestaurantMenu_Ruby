class Comment < ApplicationRecord
  include Visible
  belongs_to :menu


end
