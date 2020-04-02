# frozen_string_literal: true

require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class Locations < ROM::Relation[:sql]
      schema(:locations) do
        attribute :id, Dry::Types['strict.integer']
        attribute :name, Dry::Types['strict.integer']
        primary_key :id
      end
    end
  end
end
