class Office < ApplicationRecord
    belongs_to :building
    belongs_to :company

    validates :floor, presence: true, numericality: {only_integer: true}
end
