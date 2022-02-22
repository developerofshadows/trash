
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
	
select sst1.playerid,sst2.playerid as PID, count (*) as cnt from 
(
select distinct st1.gameid as GID,st1.playerid as playerid
from stats st1
where st1.playerid = 259
) sst1
left outer join 
stats sst2 on sst1.GID=sst2.gameid
where sst2.playerid <> sst1.playerid and sst2.playerid=8701
group by sst1.playerid,sst2.playerid
order by cnt desc



select 
  sst1.playerid,
  sst2.playerid as PID, 
  count (*) as cnt,
  COUNT(CASE WHEN sst1.win=true THEN 1 END) as wins,
  COUNT(CASE WHEN sst1.win=false THEN 1 END) as loose,
  ROUND(CAST(COUNT(CASE WHEN sst1.win=true THEN 1 END) as DECIMAL)/(COUNT(CASE WHEN sst1.win=true THEN 1 END)+COUNT(CASE WHEN sst1.win=false THEN 1 END))*100,2) as winrate from 
(
select distinct st1.gameid as GID,st1.playerid as playerid,st1.win as win
from stats st1
where st1.playerid = 259
) sst1
left outer join 
stats sst2 on sst1.GID=sst2.gameid
where sst2.playerid <> sst1.playerid
group by sst1.playerid,sst2.playerid
order by cnt desc,winrate desc
