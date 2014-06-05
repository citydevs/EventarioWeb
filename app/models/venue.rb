class Venue < ActiveRecord::Base
validates :nombre, presence: true, uniqueness: true
searchkick autocomplete: ['nombre']
end
