require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class SpyIdentities < ROM::Relation[:sql]
      schema(:spy_identities) do
        attribute :id, Dry::Types['strict.int']
        attribute :player_id, Dry::Types['strict.int']
        attribute :nationality_id, Dry::Types['strict.int']
        attribute :start_action_id, Dry::Types['strict.int']
        attribute :end_action_id, Dry::Types['strict.int']

        primary_key :id

        associations do
          belongs_to :player
          belongs_to :nationality
        end
      end
    end
  end
end
