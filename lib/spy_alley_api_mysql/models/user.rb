# frozen_string_literal: true

require 'dry/initializer'
Dry::Types.load_extensions(:maybe)
module SpyAlleyApiMysql
  module Models
    class User
      extend Dry::Initializer
      option :id, type: proc(&:to_i)
      option :name, type: Dry::Types['strict.string'].maybe
      option :admin, reader: false, type: Dry::Types['strict.bool']
      option :remember_token, type: Dry::Types['strict.string'].maybe

      def admin?
        @admin
      end
    end
  end
end
