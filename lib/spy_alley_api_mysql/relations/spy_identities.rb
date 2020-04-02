# frozen_string_literal: true

require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class SpyIdentities < ROM::Relation[:sql]
      schema(:spy_identities) do
        attribute :id, Dry::Types['strict.integer']
        attribute :player_id, Dry::Types['strict.integer']
        attribute :nationality_id, Dry::Types['strict.integer']
        attribute :start_action_id, Dry::Types['strict.integer']
        attribute :end_action_id, Dry::Types['strict.integer']

        primary_key :id

        associations do
          belongs_to :player
          belongs_to :nationality
        end
      end
    end
  end
end
