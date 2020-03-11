require 'rom'
require 'rom-sql'
require 'spy_alley_api_mysql/models/deck'

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

      def for_game_id(game_id)
        join(:decks, {game_id: :game_id}, table_alias: :free_gift_cards_deck)
          .select{`SUBSTRING(\`decks\`.\`contents\`, 1, 1) AS \`top_move_card\`,
            SUBSTRING(\`free_gift_cards_deck\`.\`contents\`, 1, 1) AS \`top_free_gift_card\``}
          .where(Sequel.lit("`decks`.`game_id` = #{game_id}"))
          .where{`\`free_gift_cards_deck\`.\`deck_type_id\` = 2 AND
            \`free_gift_cards_deck\`.\`end_action_id\` = 0 AND
            \`decks\`.\`deck_type_id\` = 1 AND
            \`decks\`.\`end_action_id\` = 0`}
          .map_to(SpyAlleyApiMysql::Models::Deck)
          .first
      end
    end
  end
end
