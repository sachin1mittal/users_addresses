class Address < ActiveRecord::Base
  belongs_to :user

  before_save :one_active_address_per_user, if: 'active? && active_changed?'

  def one_active_address_per_user
    if user.active_address && user.active_address.id != self.id
      user.active_address.update_attributes!(active: false)
    end
  end
end
