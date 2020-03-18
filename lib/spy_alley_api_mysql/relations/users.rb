require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class Users < ROM::Relation[:sql]
      schema(:users) do
        attribute :id, Dry::Types['strict.int']
        attribute :name, Dry::Types['strict.string']
        attribute :admin?, Dry::Types['strict.int']
        attribute :remember_token, Dry::Types['string']

        primary_key :id
      end
    end
  end
end
