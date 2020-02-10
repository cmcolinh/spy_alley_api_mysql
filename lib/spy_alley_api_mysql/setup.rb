require 'rom-sql'
require 'spy_alley_api_mysql/relations/actions'
require 'spy_alley_api_mysql/relations/decks'

class Setup
  def self.config
    config = ROM::Configuration::new(:sql, ENV['SPY_ALLEY_DB_CONNECTION'])
    config.register_relation(SpyAlleyApiMysql::Relations::Actions)
    config.register_relation(SpyAlleyApiMysql::Relations::Decks)
    config
  end
end
