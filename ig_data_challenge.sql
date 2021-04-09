#challenge 1
select *
from users
order by created_at
LIMIT 5;

#challenge 2
select
	DAYNAME(created_at) as day,
	COUNT(*) as total
from users
group by day
order by total DESC;

#challenge 3 - find all inactive users
select username
from users
left join photos
	on users.id = photos.user_id
where photos.id IS NULL;

#challenge 4 - photo with most likes, along with user who created it

SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

#challenge 5 - how many times does the average user post. (Mark: This is simple the number of photos divided by number of users.)

select
(select count(*) from photos) / (select count(*) from users) AS avg;

#challenge 6 - what are the top five most commonly used hashtags
select
	tags.tag_name,
	count(*) as total
from photo_tags
	join tags
	on photo_tags.tag_id - tags.id
group by tags.id
order by total DESC
limit 5;

	

