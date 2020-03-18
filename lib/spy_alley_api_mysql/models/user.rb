require 'dry/initializer'

module SpyAlleyApiMysql
  module Models
    class User
      extend Dry::Initializer
      option :id, type: proc(&:to_i)
      option :name, type: Dry::Types['strict.string']
      option :admin, reader: false
      option :remember_token

      def admin?
        @admin
      end
    end
  end
end
