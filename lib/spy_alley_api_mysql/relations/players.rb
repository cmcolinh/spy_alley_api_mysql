require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class Players < ROM::Relation[:sql]
      schema(:players) do
        attribute :id, Dry::Types['strict.int']
        attribute :game_id, Dry::Types['strict.int']
        attribute :user_id, Dry::Types['strict.int']
        attribute :seat_id, Dry::Types['strict.int']
        attribute :token_id, Dry::Types['strict.int']

        primary_key :id

        associations do
          belongs_to :game
          belongs_to :user
          belongs_to :token
          has_many :actions
          has_many :player_equipment_maps
          has_many :equipment, through: :player_equipment_maps
          has_one :player_resource
          has_one :player_location
          has_one :spy_identity
        end
      end
    end
  end
end
