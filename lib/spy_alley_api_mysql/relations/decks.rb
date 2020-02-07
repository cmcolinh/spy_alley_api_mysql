require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class Decks < ROM::Relation[:sql]
      schema do
        attribute :id
        attribute :game_id
        attribute :contents
        attribute :start_action_id
        attribute :end_action_id

        primary_key :id

        associations do
          belongs_to :start_action, combine_key: :start_action_id
          belongs_to :end_action, combine_key: :end_action_id
        end
      end
    end
  end
end
