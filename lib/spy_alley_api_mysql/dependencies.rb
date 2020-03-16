require 'dry/container'
require 'spy_alley_api_mysql/setup'
require 'spy_alley_api_mysql/repositories/action_repository'
require 'spy_alley_api_mysql/repositories/deck_repository'
require 'spy_alley_api_mysql/repositories/player_repository'

module SpyAlleyApiMysql
  class Dependencies
    extend Dry::Container::Mixin
    rom_container = ROM::container(Setup::config)

    register :action_repository, memoize: true do
      SpyAlleyApiMysql::Repositories::ActionRepository::new(rom_container)
    end

    register :deck_repository, memoize: true do
      SpyAlleyApiMysql::Repositories::DeckRepository::new(rom_container)
    end

    register :player_repository, memoize: true do
      SpyAlleyApiMysql::Repositories::PlayerRepository::new(rom_container)
    end
  end
end
