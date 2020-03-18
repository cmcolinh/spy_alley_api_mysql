require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class Tokens < ROM::Relation[:sql]
      schema(:tokens) do
        attribute :id, Dry::Types['strict.integer']
        attribute :color, Dry::Types['strict.string']
        primary_key :id
      end
    end
  end
end
