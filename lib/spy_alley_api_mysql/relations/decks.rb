require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class Decks < ROM::Relation[:sql]
      schema(:decks) do
        attribute :id, Dry::Types['strict.integer']
        attribute :game_id, Dry::Types['strict.integer']
        attribute :deck_type_id, Dry::Types['strict.integer']
        attribute :contents, Dry::Types['strict.string']
        attribute :start_action_id, Dry::Types['strict.integer']
        attribute :end_action_id, Dry::Types['strict.integer']

        primary_key :id

        associations do
          has_many :decks
        end
      end

      def commit_deck(game_id:, deck_type_id:, contents:, start_action_id:, end_action_id: 0)
        select{Sequel::lit("commitDeck(" +
            "/*game_id:*/ #{game_id}, " +
            "/*deck_type_id:*/ #{deck_type_id}, " +
            "/*contents:*/ #{contents}, " +
            "/*start_action_id:*/ #{start_action_id}, " +
            "/*end_action_id:*/ #{end_action_id})")}
      end
    end
  end
end
