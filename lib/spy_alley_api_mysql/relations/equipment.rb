# frozen_string_literal: true

module SpyAlleyApiMysql
  module Relations
    class Equipment < ROM::Relation[:sql]
      schema(:equipment) do
        attribute :id, Dry::Types['strict.integer']
        attribute :nationality_id, Dry::Types['strict.integer']
        attribute :type_id, Dry::Types['strict.integer']

        primary_key :id

        associations do
          belongs_to :nationality
          belongs_to :type
        end
      end
    end
  end
end
