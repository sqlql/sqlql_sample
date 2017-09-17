module HauteCouture
  def self.find_by_sql(query:, user:)
    ActiveRecord::Base.connection.execute(<<~SQL).first['result'] || '[]'
        WITH users AS (#{user.for_haute_couture_sql})
           , comments AS (#{Comment.for_haute_couture(user).to_sql})
           , t AS (#{query})
      SELECT JSON_AGG(t) AS result FROM t
    SQL
  end
end
