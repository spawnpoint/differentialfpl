--explain query plan
SELECT player_fpl_id, CASE WHEN ratio < 1.5 THEN 0 WHEN ratio >= 1.5 AND ratio < 3 THEN 1 ELSE 2 END ratio_group
, SUM(total) points, COUNT(total) games 
FROM ( SELECT pm.player_fpl_id player_fpl_id, CASE WHEN pm.is_home=1 THEN f.pred_ratio_home ELSE f.pred_ratio_away END ratio, total 
       FROM player_match pm, fixture f WHERE pm.season = 11 AND f._id = pm.fixture_id AND pm.minutes > 0 ) 
GROUP BY player_fpl_id, ratio_group ORDER BY player_fpl_id ASC