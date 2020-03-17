require 'spy_alley_api_mysql/dependencies'
require 'dry/auto_inject'

module SpyAlleyApiMysql
  class CreateGame

    def call(*players)
      