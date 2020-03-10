require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class Actions < ROM::Relation[:sql]
      schema(:actions) do
        attribute :id, Dry::Types['strict.int']
        attribute :last_action_id, Dry::Types['strict.int']
        attribute :next_player_id, Dry::Types['strict.int']
        attribute :action, Dry::Types['strict.string']
        attribute :next_action_options, Dry::Types['strict.string']

        primary_key :id

        #associations do
        #  has_many :deck_starts, combine_key: :start_action_id
        #  has_many :deck_ends, combine_key: :end_action_id
        #end
      end
    end
  end
end
