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

  def find_by_sql(query:, user:)
    ActiveRecord::Base.connection.execute(sql(query: query, user: user)).first['result'] || '[]'
  end

  def check_sql(query:, user:)
    gp_query = PgQuery.parse(sql(query: query, user: user))
    raise if pg_query.tree.count > 1
    raise if pg_query.tree.any?{|n| !(n["RawStmt"]["stmt"]["DropStmt"].nil?) }
  end
end
