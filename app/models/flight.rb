class Flight < ApplicationRecord
    has_many  :tickets
    scope :filter_by_departing, -> (departing) {where("departing like ?", departing)}
    scope :filter_by_arriving, -> (arriving) {where("arriving like ?", arriving)}
    scope :filter_by_date, -> (journey_date) {where("journey_date = ?", journey_date)}
    scope :filter_by_price, -> (price) {where("business <= ?", price)}
end
