# frozen_string_literal: true

require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class PlayerEquipmentMaps < ROM::Relation[:sql]
      schema(:player_equipment_maps) do
        attribute :id, Dry::Types['strict.integer']
        attribute :player_id, Dry::Types['strict.integer']
        attribute :equipment_id, Dry::Types['strict.integer']
        attribute :start_action_id, Dry::Types['strict.integer']
        attribute :end_action_id, Dry::Types['strict.integer']

        primary_key :id

        associations do
          belongs_to :player
          many_to_one :equipment
        end
      end
    end
  end
end
