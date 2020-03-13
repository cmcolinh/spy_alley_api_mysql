require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class Decks < ROM::Relation[:sql]
      schema(:decks) do
        attribute :id, Dry::Types['strict.int']
        attribute :game_id, Dry::Types['strict.int']
        attribute :deck_type_id, Dry::Types['strict.int']
        attribute :contents, Dry::Types['strict.string']
        attribute :start_action_id, Dry::Types['strict.int']
        attribute :end_action_id, Dry::Types['strict.int']

        primary_key :id

        associations do
          has_many :decks
        end
      end
    end
  end
end
