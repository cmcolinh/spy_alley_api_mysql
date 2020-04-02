# frozen_string_literal: true

require 'spy_alley_api_mysql/dependencies'
require 'dry/auto_inject'

module SpyAlleyApiMysql
  class CreateGame
    include Dry::AutoInject(SpyAlleyApiMysql::Dependencies)[
      :game_repository,
      :user_repository,
      :generate_create_game_validator]

    def call(players:)
      users = user_repository.all_users.to_a
      validator = generate_create_game_validator.(user_ids: users.map(&:id))
      validated_players = validator.(players: players)
      return validated_players.errors.to_h.to_s if validated_players.failure?
      game_repository.create_game_with(player_tuples: validated_players.to_h[:players])
    end
  end
end
