require 'dry/initializer'

module SpyAlleyApiMysql
  module Models
    class Player
      extend Dry::Initializer
      @@equipment = {
        65 => 'french password',
        66 => 'french disguise',
        67 => 'french codebook',
        68 => 'french key',
        69 => 'german password',
        70 => 'german disguise',
        71 => 'german codebook',
        72 => 'german key',
        73 => 'spanish password',
        74 => 'spanish disguise',
        75 => 'spanish codebook',
        76 => 'spanish key',
        77 => 'italian password',
        78 => 'italian disguise',
        79 => 'italian codebook',
        80 => 'italian key',
        81 => 'american password',
        82 => 'american disguise',
        83 => 'american codebook',
        84 => 'american key',
        85 => 'russian password',
        86 => 'russian disguise',
        88 => 'russian codebook',
        89 => 'russian key'
      }.freeze

      @@nationalities = [nil, 'french', 'german', 'spanish', 'italian', 'american', 'russian'].freeze

      @@locations = (0..23).map{|space| space.to_s} + (1..9).map{|space| "#{space}s"}

      option :id, type: proc(&:to_i)
      option :token, type: Dry::Types['strict.string']
      option :game, type: proc(&:to_i)
      option :seat, type: proc(&:to_i)
      option :equipment, type: ->(equip){equip.map{|e| @@equipment[e[:id]]}}
      option :spy_identity, type: ->(nationality_id){@@nationalities[nationality_id]}
      option :location, type: ->(location_id){@@locations[location_id]}
      option :money, type: proc(&:to_i)
      option :wild_cards, type: proc(&:to_i)
      option :move_1_cards, type: proc(&:to_i)
      option :move_2_cards, type: proc(&:to_i)
      option :move_3_cards, type: proc(&:to_i)
      option :move_4_cards, type: proc(&:to_i)
      option :move_5_cards, type: proc(&:to_i)
      option :move_6_cards, type: proc(&:to_i)

      def move_cards
        {
          1 => @move_1_cards,
          2 => @move_2_cards,
          3 => @move_3_cards,
          4 => @move_4_cards,
          5 => @move_5_cards,
          6 => @move_6_cards
        }
      end
    end
  end
end
