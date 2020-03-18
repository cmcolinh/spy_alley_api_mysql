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

        def commit_deck(game_id: deck_type_id:, contents:, start_action_id:, end_action_id: 0)
            select{Sequel::lit("commitDeck" +
                "/*game_id:*/ #{game_id}, " +
                "/*deck_type_id:*/ #{deck_type_id}, " +
                "/*contents:*/ #{contents}, " +
                "/*start_action_id:*/ #{start_action_id}, " +
                "/*end_action_id:*/ #{end_action_id}")}
        end
      end
    end
  end
end
