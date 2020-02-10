require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class Decks < ROM::Relation[:sql]
      schema do
        attribute :id, Dry::Types['strict.int']
        attribute :game_id, Dry::Types['strict.int']
        attribute :contents, Dry::Types['strict.string']
        attribute :start_action_id, Dry::Types['strict.int']
        attribute :end_action_id, Dry::Types['strict.int']

        primary_key :id

        associations do
          belongs_to :start_action, combine_key: :start_action_id
          belongs_to :end_action, combine_key: :end_action_id
        end
      end
    end
  end
end
