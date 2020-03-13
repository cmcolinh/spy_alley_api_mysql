require 'spy_alley_api_mysql/models/player'

module SpyAlleyApiMysql
  module Repositories
    class PlayerRepository < ROM::Repository[:players]
      def players_for_game(id:)
        players.join(:token)
          .join(:spy_identity)
          .join(:player_location)
          .join(:player_resource)
          .combine(:equipment)
          .node(:equipment){|equipment|
            equipment.where{Sequel::lit("`player_equipment_maps`.`end_action_id` = 0")}}
          .select{`\`players\`.\`id\` AS \`id\`,
            \`tokens\`.\`color\` AS \`token\`,
            \`players\`.\`game_id\` AS \`game\`,
            \`players\`.\`seat_id\` AS \`seat\`,
            \`spy_identities\`.\`nationality_id\` AS \`spy_identity\`,
            \`player_locations\`.\`location_id\` AS \`location\`,
            \`player_resources\`.\`money\` AS \`money\`,
            \`player_resources\`.\`wild_cards\` AS \`wild_cards\`,
            \`player_resources\`.\`move_1_cards\` AS \`move_1_cards\`,
            \`player_resources\`.\`move_2_cards\` AS \`move_2_cards\`,
            \`player_resources\`.\`move_3_cards\` AS \`move_3_cards\`,
            \`player_resources\`.\`move_4_cards\` AS \`move_4_cards\`,
            \`player_resources\`.\`move_5_cards\` AS \`move_5_cards\`,
            \`player_resources\`.\`move_6_cards\` AS \`move_6_cards\``}
          .where(Sequel::lit("`players`.`game_id` = #{id.to_i}"))
          .where(Sequel::lit("`player_locations`.`end_action_id` = 0"))
          .where(Sequel::lit("`player_resources`.`end_action_id` = 0"))
          .map_to(SpyAlleyApiMysql::Models::Player)
      end
    end
  end
end
