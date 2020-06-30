class Company < ApplicationRecord
    has_many :offices
    accepts_nested_attributes_for :offices
    has_many :buildings, through: :offices
    has_many :employees

    validates :name, presence: true
end
