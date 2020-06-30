class Company < ApplicationRecord
    has_many :offices
    accepts_nested_attributes_for :offices
    has_many :buildings, through: :offices
    has_many :employees
    accepts_nested_attributes_for :employees

    validates :name, presence: true



def total_rent
    rent = self.offices.map  do |office|
        office.building.rent_per_floor
    end
    rent.sum
end

end


