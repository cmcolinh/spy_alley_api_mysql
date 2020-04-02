# frozen_string_literal: true

require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class PlayerResources < ROM::Relation[:sql]
      schema(:player_resources) do
        attribute :id, Dry::Types['strict.integer']
        attribute :player_id, Dry::Types['strict.integer']
        attribute :move_1_cards, Dry::Types['strict.integer']
        attribute :move_2_cards, Dry::Types['strict.integer']
        attribute :move_3_cards, Dry::Types['strict.integer']
        attribute :move_4_cards, Dry::Types['strict.integer']
        attribute :move_5_cards, Dry::Types['strict.integer']
        attribute :move_6_cards, Dry::Types['strict.integer']
        attribute :money, Dry::Types['strict.integer']
        attribute :wild_cards, Dry::Types['strict.integer']
        attribute :start_action_id, Dry::Types['strict.integer']
        attribute :end_action_id, Dry::Types['strict.integer']

        primary_key :id
      end
    end
  end
end
