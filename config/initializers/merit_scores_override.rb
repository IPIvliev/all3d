module Merit
  class Score < ActiveRecord::Base
    # Meant to display a leaderboard. Accepts options :table_name (users by
    # default), :since_date (1.month.ago by default) and :limit (10 by
    # default).
    #
    # It lists top 10 scored objects in the last month by default.
    #
    # This is a postgresql snippet, you may need to tweak it for other ORMs.
    def self.top_scored(options = {})
      options[:table_name] ||= :users
      options[:since_date] ||= 1.month.ago
      options[:limit]      ||= 10

      alias_id_column = "user_id"
      sash_id_column = "users.sash_id"

      # MeritableModel - Sash -< Scores -< ScorePoints
      sql_query = "SELECT
  users.id AS #{alias_id_column},
  SUM(num_points) as sum_points
FROM users
  LEFT JOIN merit_scores ON merit_scores.sash_id = #{sash_id_column}
  LEFT JOIN merit_score_points ON merit_score_points.score_id = merit_scores.id
WHERE merit_score_points.created_at > '#{options[:since_date]}'
GROUP BY users.id, merit_scores.sash_id
ORDER BY sum_points DESC
LIMIT #{options[:limit]}"


      results = ActiveRecord::Base.connection.exec_query(sql_query)

      results.map do |h|
        h.keep_if { |k, v| (k == alias_id_column) || (k == 'sum_points') }
      end

      results
    end
  end
end