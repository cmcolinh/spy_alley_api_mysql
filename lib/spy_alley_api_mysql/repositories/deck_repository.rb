require 'spy_alley_api_mysql/models/deck'

module SpyAlleyApiMysql
  module Repositories
    class DeckRepository < ROM::Repository[:decks]
      def decks_for_game(id:)
        decks.join(:decks, {game_id: :game_id}, table_alias: :free_gift_cards_deck)
          .select{`SUBSTRING(\`decks\`.\`contents\`, 1, 1) AS \`top_move_card\`,
            SUBSTRING(\`free_gift_cards_deck\`.\`contents\`, 1, 1) AS \`top_free_gift_card\``}
          .where(Sequel.lit("`decks`.`game_id` = #{id.to_i}"))
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
