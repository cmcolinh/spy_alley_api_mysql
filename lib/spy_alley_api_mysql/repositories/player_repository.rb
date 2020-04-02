# frozen_string_literal: true

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
          .select(players[:id].as(:id),
            tokens[:color].as(:token),
            players[:game_id].as(:game),
            players[:seat_id].as(:seat),
            spy_identities[:nationality_id].as(:spy_identity),
            player_locations[:location_id].as(:location),
            player_resources[:money].as(:money),
            player_resources[:wild_cards].as(:wild_cards),
            player_resources[:move_1_cards].as(:move_1_cards),
            player_resources[:move_2_cards].as(:move_2_cards),
            player_resources[:move_3_cards].as(:move_3_cards),
            player_resources[:move_4_cards].as(:move_4_cards),
            player_resources[:move_5_cards].as(:move_5_cards),
            player_resources[:move_6_cards].as(:move_6_cards))
          .where(Sequel::lit("`players`.`game_id` = #{id.to_i}"))
          .where(Sequel::lit("`player_locations`.`end_action_id` = 0"))
          .where(Sequel::lit("`player_resources`.`end_action_id` = 0"))
          .map_to(SpyAlleyApiMysql::Models::Player)
      end
    end
  end
end
