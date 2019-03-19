module HauteCouture
  module_function
  def sql(query:, user:)
    <<~SQL
      WITH users AS (#{user.for_haute_couture_sql})
        , comments AS (#{Comment.for_haute_couture(user).to_sql})
        , t AS (#{query})
      SELECT JSON_AGG(t) AS result FROM t
    SQL
  end

  def find_by_sql(query)
    ActiveRecord::Base.connection.execute(query).first['result'] || '[]'
  end

  def check_sql(query)
    pg_query = PgQuery.parse(query)
    raise if pg_query.tree.count > 1
    raise if pg_query.tree.any?{|n| !(n["RawStmt"]["stmt"]["DropStmt"].nil?) }
  end
end
