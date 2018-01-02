class Title < ActiveRecord::Base
  has_many :landmarks

  has_many :figure_titles
  has_many :figures, through: :figure_titles
end
