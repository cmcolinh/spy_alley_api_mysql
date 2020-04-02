# frozen_string_literal: true

require 'spy_alley_api_mysql/models/action'

module SpyAlleyApiMysql
  module Repositories
    class ActionRepository < ROM::Repository[:actions]
      def action_info_for_action(id:)
        actions.read("SELECT p.game_id, a.id AS action_id, a.next_player_id AS next_player, a.next_action_options FROM actions a INNER JOIN players p ON p.id = a.next_player_id INNER JOIN players all_players_in_game ON all_players_in_game.game_id = p.game_id INNER JOIN actions q ON q.next_player_id = all_players_in_game.id WHERE NOT EXISTS (SELECT last_action_id FROM actions ak WHERE ak.last_action_id = a.id) AND q.id = #{id.to_i}")
          .map_to(SpyAlleyApiMysql::Models::Action)
        #actions.join(:players, id: :next_player_id)
        #  .select(players[:game_id],
        #    actions[:next_player_id].as(:next_player),
        #    actions[:next_action_options])
        #  .where(Sequel::lit("`actions`.`id` = #{id.to_i}"))
        #  .map_to(SpyAlleyApiMysql::Models::Action)
      end
    end
  end
end
