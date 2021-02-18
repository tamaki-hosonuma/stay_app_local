class Room < ApplicationRecord
    belongs_to :user, optional: true
    has_many :reservations, dependent: :destroy

    def Room.search(search)
        Room.where(['area LIKE ?', "%#{search}%"])
    end
end
