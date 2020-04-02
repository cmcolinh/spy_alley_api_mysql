# frozen_string_literal: true

require 'spy_alley_api_mysql/models/user'

module SpyAlleyApiMysql
  module Repositories
    class UserRepository < ROM::Repository[:users]
      def all_users
        users.select(:id, :name, users[:admin?].as(:admin), :remember_token)
          .map_to(SpyAlleyApiMysql::Models::User)
      end
    end
  end
end
