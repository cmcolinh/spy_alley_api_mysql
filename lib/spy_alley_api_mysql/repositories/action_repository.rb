require 'spy_alley_api_mysql/models/action'

module SpyAlleyApiMysql
  module Repositories
    class ActionRepository < ROM::Repository[:actions]
      def action_info_for_action(id:)
        actions.join(:players, id: :next_player_id)
          .select{`\`players\`.\`game_id\`,
            \`actions\`.\`next_player_id\` AS \`next_player\`,
            \`actions\`.\`next_action_options\``}
          .where(Sequel::lit("`actions`.`id` = #{id.to_i}"))
          .map_to(SpyAlleyApiMysql::Models::Action)
      end
    end
  end
end
