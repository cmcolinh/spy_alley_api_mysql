# frozen_string_literal: true

require 'rom'
require 'rom-sql'
require 'dry-types'

module SpyAlleyApiMysql
  module Relations
    class Actions < ROM::Relation[:sql]
      schema(:actions) do
        attribute :id, Dry::Types['strict.integer']
        attribute :last_action_id, Dry::Types['strict.integer']
        attribute :next_player_id, Dry::Types['strict.integer']
        attribute :action, Dry::Types['strict.string']
        attribute :next_action_options, Dry::Types['strict.string']

        primary_key :id

        associations do
          belongs_to :player
        end
      end
    end
  end
end
