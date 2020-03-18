require 'spy_alley_api_mysql/dependencies'
require 'dry/auto_inject'

module SpyAlleyApiMysql
  class CreateGame
    include Dry::AutoInject(SpyAlleyApiMysql::Dependencies)[
      :game_repository,
      :user_repository,
      :generate_create_game_validator]

    def call(players:)
      users = user_repository.all_users
    end
  end
end
