require 'json'

module SpyAlleyApiMysql
  module Repositories
    class GameRepository < ROM::Repository[:games]
      def create_game_with(player_tuples:)
        game_id = create_game_and_get_game_id
        new_players = create_players(player_tuples, game_id)
        action_id = create_initial_action(new_players, game_id)
        create_spy_identities(new_players, action_id)
        create_player_locations(new_players, action_id)
        create_player_resources(new_players, action_id)
        create_decks(game_id, action_id)
      end

      private
      def create_game_and_get_game_id
        create_game = games.command(:create)
        create_game.()
        games.select{`LAST_INSERT_ID() AS \`id\``}.first[:id].to_i
      end

      def create_players(player_tuples, game_id)
        player_tuples.each{|player| player[:game_id] = game_id}
        create_players = players.command(:create)
        create_players.(player_tuples)
        games.join(:players)
          .select{`\`players\`.\`id\``}
          .where{Sequel::lit("`games`.`id` = #{game_id}")}
          .map_to(NewPlayer)
          .to_a
      end

      def create_initial_action(new_players, game_id)
        starting_player, *other_players = *(new_players.sample(6)) # random player from the list
        action_tuple = {
          last_action_id: 0,
          next_player_id: starting_player.id,
          action: '{"start_game": true}',
          next_action_options: JSON::generate(
            accept_roll: true,
            accept_make_accusation: {
              player: other_players.map{|player| "seat_#{player.seat_id}"}.sort,
              nationality: %w(f g s i a r)})}
        create_action = actions.command(:create)
        create_action.(action_tuple)
        actions.select{`LAST_INSERT_ID() AS \`id\``}.first[:id].to_i
      end

      def create_spy_identities(new_players, action_id)
        create_spy_identities = spy_identities.command(:create)
        spy_identitys_to_use = [1, 2, 3, 4, 5, 6].sample(new_players.size)
        spy_identity_tuples = new_players.map.with_index do |player, index|
          {
            player_id: new_player.id,
            nationality_id: spy_identities_to_use[index],
            start_action_id: action_id,
            end_action_id: 0
          }
        end
        create_spy_identities.(spy_identity_tuples)
      end

      def create_player_locations(new_players, action_id)
        create_player_locations = player_locations.command(:create)
        player_location_tuples = new_players.map do |player|
          {
            player_id: player.id,
            location_id: 0,
            position_id: player.seat_id + 1,
            start_action_id: action_id,
            end_action_id: 0
          }
        end
        create_player_locations.(player_location_tuples)
      end

      def create_player_resources(new_players, action_id)
        create_player_resources = player_resources.comaand(:create)
        player_resources_tuples = new_players.map do |player|
          {
            player_id: player.id,
            money: new_players.size * 10,
            start_action_id: action_id,
            end_action_id: 0
          }
        end
        create_player_resources.(player_resources_tuples)
      end

      def create_decks(game_id, action_id)
        move_card_deck_contents = '111111222222333333444444555555666666'.chars.shuffle.join('')
        free_gift_deck_contents = 'AABBCCDDEEFFGGHHIIJJKKLLMMNNOOPPQQRRSSTTUUVVWWWWXXYY'.chars.shuffle.join('')
        decks_tuples = [
          {
            game_id: game_id,
            deck_type_id: 1, # move_card
            contents: move_card_deck_contents,
            start_action_id: action_id
          },
          {
            game_id: game_id,
            deck_type_id: 2, # free_gift
            contents: free_gift_deck_contents,
            start_action_id: action_id
          }
        ]
        decks_tuples.each{|deck| decks.commit_deck(deck)}
      end
    end

    class NewPlayer
      extend Dry::Initializer
      option :id, type: proc(&:to_i)
      option :seat_id, type: proc(&:to_i)
    end
  end
end
