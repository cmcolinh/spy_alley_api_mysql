# frozen_string_literal: true

require 'spy_alley_api_mysql/dependencies'
require 'dry/auto_inject'

module SpyAlleyApiMysql
  class RetrieveGameState
    include Dry::AutoInject(SpyAlleyApiMysql::Dependencies)[
      :action_repository,
      :deck_repository,
      :player_repository]

    def call(last_action_id:)
      model = action_repository.action_info_for_action(id: last_action_id).first
      game_id = model.game_id
      result = model.to_h
      puts result
      result[:player_models] = player_repository.players_for_game(id: game_id).to_a
      result[:decks_model] = deck_repository.decks_for_game(id: game_id).first
      result
    end
  end
end
