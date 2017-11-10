class AttachmentImage < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
end
