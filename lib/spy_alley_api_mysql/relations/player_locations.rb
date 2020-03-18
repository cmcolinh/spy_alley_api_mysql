require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class PlayerLocations < ROM::Relation[:sql]
      schema(:player_locations) do
        attribute :id, Dry::Types['strict.integer']
        attribute :player_id, Dry::Types['strict.integer']
        attribute :location_id, Dry::Types['strict.integer']
        attribute :position_id, Dry::Types['strict.integer']
        attribute :start_action_id, Dry::Types['strict.integer']
        attribute :end_action_id, Dry::Types['strict.integer']

        primary_key :id

        associations do
          belongs_to :player
          belongs_to :location
        end
      end
    end
  end
end
