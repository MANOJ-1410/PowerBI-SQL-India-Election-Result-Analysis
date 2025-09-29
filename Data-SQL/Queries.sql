use [India-Election-Results DB];

-- Total Seats
select distinct count(Parliament_Constituency) as Total_Seats from constituencywise_results

-- What are the total number of seats available for elections in each state
Select 
c.State as State_Name, count(a.Parliament_Constituency) as Total_Seats
from constituencywise_results a
join statewise_results b
on a.Parliament_Constituency = b.Parliament_Constituency
join states c
on b.State_ID = c.State_ID
group by c.State


-- Total Seats Won by NDA Alliance
select sum(Won) as NDA_Seats_Won 
from partywise_results
where Party In ('Bharatiya Janata Party - BJP',
'Lok Janshakti Party(Ram Vilas) - LJPRV',
'Apna Dal (Soneylal) - ADAL',
'Rashtriya Loktantrik Party - RLTP',
'Asom Gana Parishad - AGP',
'Telugu Desam - TDP',
'Shiv Sena - SHS',
'AJSU Party - AJSUP',
'Rashtriya Lok Dal - RLD',
'Hindustani Awam Morcha (Secular) - HAMS',
'Janasena Party - JnP',
'Janata Dal  (Secular) - JD(S)',
'Sikkim Krantikari Morcha - SKM',
'Janata Dal  (United) - JD(U)')


-- Seats won by NDA Alliance Parties
select Party as Party_Name , Won as Total_Seats
from partywise_results
where Party in ('Bharatiya Janata Party - BJP',
'Lok Janshakti Party(Ram Vilas) - LJPRV',
'Apna Dal (Soneylal) - ADAL',
'Rashtriya Loktantrik Party - RLTP',
'Asom Gana Parishad - AGP',
'Telugu Desam - TDP',
'Shiv Sena - SHS',
'AJSU Party - AJSUP',
'Rashtriya Lok Dal - RLD',
'Hindustani Awam Morcha (Secular) - HAMS',
'Janasena Party - JnP',
'Janata Dal  (Secular) - JD(S)',
'Sikkim Krantikari Morcha - SKM',
'Janata Dal  (United) - JD(U)')
order by Total_Seats desc


-- Total Seats Won By I.N.D.I.A Alliance
select sum(Won) as Total_INDIA_Seats_Won 
from partywise_results
where Party not In ('Bharatiya Janata Party - BJP',
'Lok Janshakti Party(Ram Vilas) - LJPRV',
'Apna Dal (Soneylal) - ADAL',
'Rashtriya Loktantrik Party - RLTP',
'Asom Gana Parishad - AGP',
'Telugu Desam - TDP',
'Shiv Sena - SHS',
'AJSU Party - AJSUP',
'Rashtriya Lok Dal - RLD',
'Hindustani Awam Morcha (Secular) - HAMS',
'Janasena Party - JnP',
'Janata Dal  (Secular) - JD(S)',
'Sikkim Krantikari Morcha - SKM',
'Janata Dal  (United) - JD(U)',
'Independent - IND',
'Voice of the People Party - VOTPP',
'Bharat Adivasi Party - BHRTADVSIP',
'Zoram People’s Movement - ZPM',
'Aazad Samaj Party (Kanshi Ram) - ASPKR',
'All India Majlis-E-Ittehadul Muslimeen - AIMIM',
'Shiromani Akali Dal - SAD',
'Yuvajana Sramika Rythu Congress Party - YSRCP'
)


-- Seats Won By I.N.D.I.A Alliance Parties
select Party as Party_Name ,Won as Total_INDIA_Seats_Won 
from partywise_results
where Party not In ('Bharatiya Janata Party - BJP',
'Lok Janshakti Party(Ram Vilas) - LJPRV',
'Apna Dal (Soneylal) - ADAL',
'Rashtriya Loktantrik Party - RLTP',
'Asom Gana Parishad - AGP',
'Telugu Desam - TDP',
'Shiv Sena - SHS',
'AJSU Party - AJSUP',
'Rashtriya Lok Dal - RLD',
'Hindustani Awam Morcha (Secular) - HAMS',
'Janasena Party - JnP',
'Janata Dal  (Secular) - JD(S)',
'Sikkim Krantikari Morcha - SKM',
'Janata Dal  (United) - JD(U)',
'Independent - IND',
'Voice of the People Party - VOTPP',
'Bharat Adivasi Party - BHRTADVSIP',
'Zoram People’s Movement - ZPM',
'Aazad Samaj Party (Kanshi Ram) - ASPKR',
'All India Majlis-E-Ittehadul Muslimeen - AIMIM',
'Shiromani Akali Dal - SAD',
'Yuvajana Sramika Rythu Congress Party - YSRCP'
)
order by Total_INDIA_Seats_Won desc


-- Add new cloumn field in partywise_results to get the Party Alliance as NDA , INDIA & Others
Alter table partywise_results
ADD Party_Alliance varchar(100);

update partywise_results
set Party_Alliance = 'NDA'
where Party In ('Bharatiya Janata Party - BJP',
'Lok Janshakti Party(Ram Vilas) - LJPRV',
'Apna Dal (Soneylal) - ADAL',
'Rashtriya Loktantrik Party - RLTP',
'Asom Gana Parishad - AGP',
'Telugu Desam - TDP',
'Shiv Sena - SHS',
'AJSU Party - AJSUP',
'Rashtriya Lok Dal - RLD',
'Hindustani Awam Morcha (Secular) - HAMS',
'Janasena Party - JnP',
'Janata Dal  (Secular) - JD(S)',
'Sikkim Krantikari Morcha - SKM',
'Janata Dal  (United) - JD(U)');

update partywise_results
set Party_Alliance = 'I.N.D.I.A'
where Party not In ('Bharatiya Janata Party - BJP',
'Lok Janshakti Party(Ram Vilas) - LJPRV',
'Apna Dal (Soneylal) - ADAL',
'Rashtriya Loktantrik Party - RLTP',
'Asom Gana Parishad - AGP',
'Telugu Desam - TDP',
'Shiv Sena - SHS',
'AJSU Party - AJSUP',
'Rashtriya Lok Dal - RLD',
'Hindustani Awam Morcha (Secular) - HAMS',
'Janasena Party - JnP',
'Janata Dal  (Secular) - JD(S)',
'Sikkim Krantikari Morcha - SKM',
'Janata Dal  (United) - JD(U)',
'Independent - IND',
'Voice of the People Party - VOTPP',
'Bharat Adivasi Party - BHRTADVSIP',
'Zoram People’s Movement - ZPM',
'Aazad Samaj Party (Kanshi Ram) - ASPKR',
'All India Majlis-E-Ittehadul Muslimeen - AIMIM',
'Shiromani Akali Dal - SAD',
'Yuvajana Sramika Rythu Congress Party - YSRCP'
)

-- update partywise_results
-- set Party_Alliance = 'OTHER'
-- where Party_Alliance is NULL;

update partywise_results
set Party_Alliance = 'OTHER'
where Party_Alliance = 'Others';

select * from partywise_results;

-- which party alliance won most seats across all states
select Party_Alliance, SUM(Won) as Total_Seats
from partywise_results
group by Party_Alliance
order by Total_Seats desc

-- Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?
select a.Winning_Candidate, a.Constituency_Name , a.Parliament_Constituency , a.Total_Votes , a.Margin , b.Party_alliance
from constituencywise_results a

join partywise_results b
on a.Party_ID = b.Party_ID

join statewise_results c
on a.Parliament_Constituency = c.Parliament_Constituency

join states d
on d.State_ID = c.State_ID

where a.Constituency_Name='AGRA'


-- what is the distribution of EVM votes versus postal votes for candidates in a specific constituency
select a.Candidate, a.EVM_Votes , a.Postal_Votes, a.Total_Votes, b.Constituency_Name
from constituencywise_details a
join constituencywise_results b
on a.Constituency_ID = b.Constituency_ID
where b.Constituency_Name = 'AMETHI'

-- Which parties won the most seats in a state, and how many seats did each party win
select a.Party as Party_Name ,count(a.Won) as Seats_Won
from partywise_results a
join constituencywise_results b
on a.Party_ID = b.Party_ID
join statewise_results c
on c.Parliament_Constituency = b.Parliament_Constituency
join states d
on d.State_ID = c.State_ID
where d.State = 'Karnataka'
group by a.Party
order by Seats_Won desc


-- What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER)
-- in each state for the India Elections 2024
select d.state , 
sum(case when a.Party_Alliance = 'NDA ' then 1 else 0 end) as NDA_Seats_Won,
sum(case when a.Party_Alliance = 'I.N.D.I.A' then 1 else 0 end) as INDIA_Seats_Won,
sum(case when a.Party_Alliance = 'OTHER' then 1 else 0 end) as Other_Seats_Won
from partywise_results a
join constituencywise_results b
on a.Party_ID = b.Party_ID
join statewise_results c
on c.Parliament_Constituency = b.Parliament_Constituency
join states d
on d.State_ID = c.State_ID
group by d.State


-- Which candidate received the highest number of EVM votes in each constituency (Top 10)?
select Top 10
a.Candidate , a.Constituency_ID , b.Constituency_Name,  a.EVM_Votes
from constituencywise_details a
join constituencywise_results b
on a.Constituency_ID = b.Constituency_ID
where a.EVM_Votes = 
( 
  select MAX(a1.EVM_Votes)
  from constituencywise_details a1
  where a1.Constituency_ID = a.Constituency_ID 
  )
order by a.EVM_Votes desc


-- Which candidate won and which candidate was the runner-up in each constituency of
-- State for the 2024 elections?
with RankedCandidates as 
( select 
	a.Constituency_ID , 
	a.Constituency_Name ,
	b.Candidate, 
	a.Total_Votes,
  Row_Number() over (partition by a.Constituency_ID order by a.Total_Votes desc) as VoteRank
  from constituencywise_results a
  join constituencywise_details b
  on a.Constituency_ID = b.Constituency_ID

  join statewise_results c
  on c.Parliament_Constituency = a.Parliament_Constituency

  join states d
  on d.State_ID = c.State_ID
  where d.State = 'Karnataka'
)

select vr.Constituency_Name,
max(case when vr.VoteRank  = 1 then vr.Candidate end) as Wininnig_Candidate,
max(case when vr.VoteRank = 2 then vr.Candidate end) as Runnerup_Candidate
from RankedCandidates vr
group by vr.Constituency_Name
order by vr.Constituency_Name


-- For the state of Karnataka, what are the total number of seats, total number of
-- candidates, total number of parties, total votes (including EVM and postal), and the
-- breakdown of EVM and postal votes?
select 
  count(distinct a.Constituency_ID) as Total_Seat,
  count(distinct e.Candidate) as Total_Candidate,
  count(distinct c.Party) as Total_parties,
  SUM(e.EVM_Votes + e.Postal_Votes) AS Total_Votes,
  SUM(e.EVM_Votes) AS Total_EVM_Votes,
  SUM(e.Postal_Votes) AS Total_Postal_Votes
from constituencywise_results a
join constituencywise_details e
on a.Constituency_ID = e.Constituency_ID
join statewise_results b
on a.Parliament_Constituency = b.Parliament_Constituency
join partywise_results c
on c.Party_ID = a.Party_ID
join states d
on b.State_ID = d.State_ID
where d.State = 'Karnataka'

