require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class PlayerLocations < ROM::Relation[:sql]
      schema(:player_locations) do
        attribute :id, Dry::Types['strict.int']
        attribute :player_id, Dry::Types['strict.int']
        attribute :location_id, Dry::Types['strict.int']
        attribute :position_id, Dry::Types['strict.int']
        attribute :start_action_id, Dry::Types['strict.int']
        attribute :end_action_id, Dry::Types['strict.int']

        primary_key :id

        associations do
          belongs_to :player
          belongs_to :location
        end
      end
    end
  end
end
