
use ex;

CREATE TABLE players (
    player_id INTEGER NOT NULL UNIQUE,
    group_id INTEGER NOT NULL
);

CREATE TABLE matches (
    match_id INTEGER NOT NULL UNIQUE,
    first_player INTEGER NOT NULL,
    second_player INTEGER NOT NULL,
    first_score INTEGER NOT NULL,
    second_score INTEGER NOT NULL
);

-- Insert values into the players table
INSERT INTO players (player_id, group_id) VALUES
    (20, 2),
    (30, 1),
    (40, 3),
    (45, 1),
    (50, 2),
    (65, 1);
    select * from players;

with result_table as(
	with score_per_player as ( -- start -> count total score per player_id
		select  m1.first_player as player_Id ,m1.first_score as player_Score
		from matches m1
		union 
		select  m2.second_player, m2.second_score
		from matches m2  
		order by player_Id
	)
	select  p.group_id,p.player_Id , ifnull(sum(player_Score),0) as total_score 
	from players p 
	left join score_per_player spp
	on p.player_id = spp.player_Id
	group by player_Id
	order by total_score desc 
)  -- end count score 
select outter.group_id as group_id , outter.player_id as winner_id
from (
	select row_number() over (PARTITION by result_table.group_id order by total_score desc) as answer , result_table.*
	from result_table 
    ) as outter
where answer =1 
;







