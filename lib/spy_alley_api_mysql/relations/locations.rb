require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class Locations < ROM::Relation[:sql]
      schema(:locations) do
        attribute :id, Dry::Types['strict.int']
        attribute :name, Dry::Types['strict.int']
        primary_key :id
      end
    end
  end
end
