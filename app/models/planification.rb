class Planification < ApplicationRecord
  belongs_to :user
  belongs_to :possibility
end
