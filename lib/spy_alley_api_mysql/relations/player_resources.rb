require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class PlayerResources < ROM::Relation[:sql]
      schema(:player_resources) do
        attribute :id, Dry::Types['strict.int']
        attribute :player_id, Dry::Types['strict.int']
        attribute :move_1_cards, Dry::Types['strict.int']
        attribute :move_2_cards, Dry::Types['strict.int']
        attribute :move_3_cards, Dry::Types['strict.int']
        attribute :move_4_cards, Dry::Types['strict.int']
        attribute :move_5_cards, Dry::Types['strict.int']
        attribute :move_6_cards, Dry::Types['strict.int']
        attribute :money, Dry::Types['strict.int']
        attribute :start_action_id, Dry::Types['strict.int']
        attribute :end_action_id, Dry::Types['strict.int']

        primary_key :id
      end
    end
  end
end
