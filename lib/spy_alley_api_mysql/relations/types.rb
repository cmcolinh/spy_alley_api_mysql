# frozen_string_literal: true

require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class Types < ROM::Relation[:sql]
      schema(:types) do
        attribute :id, Dry::Types['strict.integer']
        attribute :name, Dry::Types['strict.string']
        primary_key :id
      end
    end
  end
end
