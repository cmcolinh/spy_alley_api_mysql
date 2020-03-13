require 'rom-sql'
require 'spy_alley_api_mysql/relations/actions'
require 'spy_alley_api_mysql/relations/decks'
require 'spy_alley_api_mysql/relations/equipment'
require 'spy_alley_api_mysql/relations/games'
require 'spy_alley_api_mysql/relations/locations'
require 'spy_alley_api_mysql/relations/nationalities'
require 'spy_alley_api_mysql/relations/player_equipment_maps'
require 'spy_alley_api_mysql/relations/player_locations'
require 'spy_alley_api_mysql/relations/player_resources'
require 'spy_alley_api_mysql/relations/players'
require 'spy_alley_api_mysql/relations/spy_identities'
require 'spy_alley_api_mysql/relations/tokens'
require 'spy_alley_api_mysql/relations/types'
require 'spy_alley_api_mysql/relations/users'

class Setup
  def self.config
    config = ROM::Configuration::new(:sql, ENV['SPY_ALLEY_DB_CONNECTION'])
    config.register_relation(SpyAlleyApiMysql::Relations::Actions)
    config.register_relation(SpyAlleyApiMysql::Relations::Decks)
    config.register_relation(SpyAlleyApiMysql::Relations::Equipment)
    config.register_relation(SpyAlleyApiMysql::Relations::Games)
    config.register_relation(SpyAlleyApiMysql::Relations::Locations)
    config.register_relation(SpyAlleyApiMysql::Relations::Nationalities)
    config.register_relation(SpyAlleyApiMysql::Relations::PlayerEquipmentMaps)
    config.register_relation(SpyAlleyApiMysql::Relations::PlayerLocations)
    config.register_relation(SpyAlleyApiMysql::Relations::PlayerResources)
    config.register_relation(SpyAlleyApiMysql::Relations::Players)
    config.register_relation(SpyAlleyApiMysql::Relations::SpyIdentities)
    config.register_relation(SpyAlleyApiMysql::Relations::Tokens)
    config.register_relation(SpyAlleyApiMysql::Relations::Types)
    config.register_relation(SpyAlleyApiMysql::Relations::Users)
    config
  end
end
