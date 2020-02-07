require 'rom-sql'
require 'spy_alley_api_mysql/relation/actions'
require 'spy_alley_api_mysql/relation/decks'

config = ROM::Configuration::new(:sql, 'mysql2://user_name:password@host/database_name')
config.register_relation(SpyAlleyApiMysql::Relation::Actions)
config.register_relation(SpyAlleyApiMysql::Relation::Decks)
