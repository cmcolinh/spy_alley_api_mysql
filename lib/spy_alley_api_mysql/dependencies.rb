# frozen_string_literal: true

require 'dry/container'
require 'spy_alley_api_mysql/setup'
require 'spy_alley_api_mysql/repositories/action_repository'
require 'spy_alley_api_mysql/repositories/deck_repository'
require 'spy_alley_api_mysql/repositories/game_repository'
require 'spy_alley_api_mysql/repositories/player_repository'
require 'spy_alley_api_mysql/repositories/user_repository'
require 'spy_alley_api_mysql/validator/create_game_validator'

module SpyAlleyApiMysql
  class Dependencies
    extend Dry::Container::Mixin
    rom_container = ROM::container(Setup::config)

    register :action_repository, memoize: true do
      SpyAlleyApiMysql::Repositories::ActionRepository::new(rom_container)
    end

    register :generate_create_game_validator, memoize: true do
      ->(user_ids:){SpyAlleyApiMysql::Validator::CreateGameValidator::new(available_user_ids: user_ids)}
    end

    register :deck_repository, memoize: true do
      SpyAlleyApiMysql::Repositories::DeckRepository::new(rom_container)
    end

    register :game_repository, memoize: true do
      SpyAlleyApiMysql::Repositories::GameRepository::new(rom_container)
    end

    register :player_repository, memoize: true do
      SpyAlleyApiMysql::Repositories::PlayerRepository::new(rom_container)
    end

    register :user_repository, memoize: true do
      SpyAlleyApiMysql::Repositories::UserRepository::new(rom_container)
    end
  end
end
