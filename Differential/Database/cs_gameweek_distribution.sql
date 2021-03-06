select distinct fa.season, fa.gameweek, (SELECT count(*) from fixture f where f.season=fa.season and f.gameweek=fa.gameweek
                                AND res_goals_away = 0) cs_home
                                , (SELECT count(*) from fixture f where f.season=fa.season and f.gameweek=fa.gameweek
                                AND res_goals_home = 0) cs_away
from fixture fa
order by fa.season asc, fa.gameweek asc