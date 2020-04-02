# frozen_string_literal: true

require 'dry/initializer'
require 'dry/validation'

module SpyAlleyApiMysql
  module Validator
    class CreateGameValidator < Dry::Validation::Contract
      extend Dry::Initializer
      option :available_user_ids
      params do
        required(:players).array(:hash) do
          config.validate_keys = true

          required(:user_id).filled(:integer)
          required(:seat_id).filled(:integer, included_in?: [1,2,3,4,5,6])
          required(:token_id).filled(:integer, included_in?: [1,2,3,4,5,6])
        end
      end

      rule(:players) do
        key.failure("must be between 2 and 6 players, inclusive") if !values[:players].size.between?(2, 6)
        values[:players].each do |player|
          key.failure("user_id #{player[:user_id]} invalid") if !available_user_ids.include?(player[:user_id])
        end
 
        players_by_user_id = Hash::new{|h, k| h[k] = 0}
        values[:players].each{|player| players_by_user_id[player[:user_id]] += 1}
        key.failure("each user_id can only be used once") if players_by_user_id.any?{|k, v| v > 1}
 
        players_by_seat_id = Hash::new{|h, k| h[k] = 0}
        values[:players].each{|player| players_by_seat_id[player[:seat_id]] += 1}
        key.failure("each seat_id can only be used once") if players_by_seat_id.any?{|k, v| v > 1}

        players_by_token_id = Hash::new{|h, k| h[k] = 0}
        values[:players].each{|player| players_by_token_id[player[:token_id]] += 1}
        key.failure("each token_id can only be used once") if players_by_token_id.any?{|k, v| v > 1}
      end
    end
  end
end
