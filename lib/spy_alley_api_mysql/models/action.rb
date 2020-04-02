# frozen_string_literal: true

require 'json'

module SpyAlleyApiMysql
  module Models
    class Action
      extend Dry::Initializer
      
      @@nationalities = {
        'f' => 'french',
        'g' => 'german',
        's' => 'spanish',
        'i' => 'italian',
        'a' => 'american',
        'r' => 'russian'
      }
      @@equipment = {
        'p' => 'password',
        'd' => 'disguise',
        'c' => 'codebook',
        'k' => 'key'
      }
      
      option :game_id
      option :action_id
      option :next_player
      option :next_action_options, type: ->(json) do
        JSON::parse(json, symbolize_names: true).tap do |h|
          if !h.dig(:accept_make_accusation, :nationality).nil?
            h[:accept_make_accusation][:nationality] = h[:accept_make_accusation][:nationality].map do |n|
              @@nationalities[n] || n
            end.freeze
          end
        end.freeze
      end

      def to_h
        {next_player: next_player, action_id: action_id, next_action_options: next_action_options}
      end
    end
  end
end
