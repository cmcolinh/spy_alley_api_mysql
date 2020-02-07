require 'rom'
require 'rom-sql'

module SpyAlleyApiMysql
  module Relations
    class Actions < ROM::Relation[:sql]
      schema do
        attribute :id
        attribute :last_action_id
        attribute :next_player_id
        attribute :action
        attribute :next_action_options

        primary_key :id

        associations do
          has_many :deck_starts, combine_key: :start_action_id
          has_many :deck_ends, combine_key: :end_action_id
        end
      end
    end
  end
end
