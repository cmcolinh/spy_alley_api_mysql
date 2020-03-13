require 'spy_alley_api_mysql/models/player'

module SpyAlleyApiMysql
  module Repositories
    class PlayerRepository < ROM::Repository[:players]
      def players_for_game(id:)
        players.join(:token)
          .select{`\`tokens\`.\`color\` AS \`token\`,
            \`players\`.\`game_id\` AS \`game\``}
          .map_to(SpyAlleyApiMysql::Models::Player)
      end
    end
  end
end
