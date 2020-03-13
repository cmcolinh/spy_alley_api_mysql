require 'dry/initializer'

module SpyAlleyApiMysql
  module Models
    class Player
      extend Dry::Initializer

      param :token, type: Dry::Types['strict.string']
      param :game, type: proc(&:to_i)
      #param :seat, type: proc(&:to_i)
      #param :equipment
      #param :spy_identity
      #param :location
      #param :money, type: proc(&:to_i)
      #param :wild_cards, type: proc(&:to_i)
    end
  end
end
