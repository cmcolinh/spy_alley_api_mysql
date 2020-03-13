require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class PlayerEquipmentMaps < ROM::Relation[:sql]
      schema(:player_equipment_maps) do
        attribute :id, Dry::Types['strict.int']
        attribute :player_id, Dry::Types['strict.int']
        attribute :equipment_id, Dry::Types['strict.int']
        attribute :start_action_id, Dry::Types['strict.int']
        attribute :end_action_id, Dry::Types['strict.int']

        primary_key :id

        associations do
          belongs_to :player
          many_to_one :equipment
        end
      end
    end
  end
end
