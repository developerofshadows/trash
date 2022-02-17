
/* Select SSt1.GID, SSt1.RL1 from (
	select distinct st1.gameid as GID, st1.commandid as RL1
	from stats st1
	where st1.playerid =9863
	) as SSt1
	
inner join (select distinct st2.gameid as GID, st2.commandid as RL2
from stats st2 
where st2.playerid =1083
	) as SSt2
	on SSt1.GID=SSt2.GID and SSt1.RL1 = SSt2.RL2 */
	
	Select SSt1.GID, SSt1.roleid from (
	select distinct st1.gameid as GID, st1.teamid as roleid
	from stats st1
	where st1.playerid =9863
	) as SSt1
	
inner join (select distinct st2.gameid as GID, st2.teamid as roleid2
from stats st2 
where st2.playerid =1083
	) as SSt2
	on SSt1.GID=SSt2.GID and SSt1.roleid = SSt2.roleid2
