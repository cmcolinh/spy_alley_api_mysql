require 'json'

module SpyAlleyApiMysql
  module Models
    class Action
      extend Dry::Initializer
      option :game_id
      option :next_player
      option :next_action_options, type: ->(json){JSON::parse(json, symbolize_names: true)}

      def to_h
        {next_player: next_player, next_action_options: next_action_options}
      end
    end
  end
end
