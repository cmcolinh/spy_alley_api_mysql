module SpyAlleyApiMysql
  module Models
    class Deck
      @@equipment = {
        'A' => 'french password',
        'B' => 'french disguise',
        'C' => 'french codebook',
        'D' => 'french key',
        'E' => 'german password',
        'F' => 'german disguise',
        'G' => 'german codebook',
        'H' => 'german key',
        'I' => 'spanish password',
        'J' => 'spanish disguise',
        'K' => 'spanish codebook',
        'L' => 'spanish key',
        'M' => 'italian password',
        'N' => 'italian disguise',
        'O' => 'italian codebook',
        'P' => 'italian key',
        'Q' => 'american password',
        'R' => 'american disguise',
        'S' => 'american codebook',
        'T' => 'american key',
        'U' => 'russian password',
        'V' => 'russian disguise',
        'W' => 'wild card',
        'X' => 'russian codebook',
        'Y' => 'russian key'
      }.freeze

      attr_reader :top_move_card, :top_free_gift_card
      def initialize(options={})
        @top_move_card = options[:top_move_card].to_i
        @top_free_gift_card = @@equipment[options[:top_free_gift_card]]
      end
    end
  end
end
