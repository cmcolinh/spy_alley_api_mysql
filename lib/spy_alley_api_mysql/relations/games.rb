require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class Games < ROM::Relation[:sql]
      schema(:games) do
        attribute :id, Dry::Types['strict.integer']
        primary_key :id

        associations do
          has_many :players
        end
      end
    end
  end
end
