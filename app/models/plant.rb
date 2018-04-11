class Plant < ApplicationRecord
  has_one_attached :image
  has_one_attached :background

  # The following is needed to support deletion
  attribute :remove_image, :boolean
  after_save ->{image.purge}, if: :remove_image
  attribute :remove_background, :boolean
  after_save ->{background.purge}, if: :remove_background

  rails_admin do
    include_all_fields
    exclude_fields :image_attachment, :image_blob, :background_attachment, :background_blob
    field :image, :active_storage
    field :background, :active_storage
  end
end
