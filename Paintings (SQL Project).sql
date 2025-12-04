-- What museums have the highest proportion of cubist paintings? What other styles of art do these museums typically display?

select m.name,
round(count(case when w.style = 'Cubism' then 1 end) * 1.0 / count(*),2) as Cubism_prop
from museum as m
inner join work as w
on w.museum_id = m.museum_id
group by 1
order by 2 desc
limit 10

-- Which artists have their work displayed in museums in many different countries?

select full_name, count(distinct(country))
from artist as a
inner join work as b
on b.artist_id =a.artist_id
inner join museum as c
on c.museum_id = b.museum_id
group by 1
order by 2 desc
