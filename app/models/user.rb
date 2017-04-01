class User < ActiveRecord::Base
  has_many :addresses
  has_one :active_address, -> { where(active: true) }, class_name: 'Address'
  validates_presence_of :name
  accepts_nested_attributes_for :addresses,
                                reject_if: proc { |attributes| attributes['full_address'].blank? }
end
