require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class Nationalities < ROM::Relation[:sql]
      schema(:nationalities) do
        attribute :id, Dry::Types['strict.int']
        attribute :name, Dry::Types['strict.string']
        primary_key :id
      end
    end
  end
end
