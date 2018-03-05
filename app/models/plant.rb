class Plant < ApplicationRecord
  mount_uploader :image, PlantImageUploader
end
