--More Chinook Practice
--Andrew Ahn
--andrewsrahn@gmail.com
--Revature
--JTA 1804
--April 25, 2018

--Write a SQL Query that contains the names of all tracks that are longer than 6 minutes
select name from track where milliseconds>6000;
--Write a SQL Query to find the biggest song (which takes up the most space)
select * from track where bytes =
    (select max(bytes) from track);
    
--Write a SQL Query that contains the titles of all albums with tracks longer than 6 minutes in them 
select title from album where albumid in(
    select trackid from track where milliseconds>6000);
    
--Write a SQL Query that contains the albumId and number of songs in the album
select t.albumid, count(t.albumid) as numberofsongs from album a left join track t on a.albumid=t.albumid group by t.albumid;

--Write a SQL query that contains artist's names and the number of tracks they have produced (assume an artist produced a track 
--if it appears in one of their albums)
select composer, count(name) from track group by composer;

--Write a SQL Query that returns the most purchased media type
select count(i.trackid), t.name from invoiceline i inner join track t on i.trackid=t.trackid group by t.name;

--Write a SQL Query showing customers not in the US
select * from customer where country <> 'USA';

--Write a SQL Query showing a unique list of billing countries on the Invoice table
select distinct billingcountry from invoice;

--Write a SQL Query that shows the Invoice Total, Customer Name, Country, and Sales agent for all invoices and customers 
select i.total, c.firstname || c.lastname as customer, i.billingcountry, e.firstname || e.lastname as sales
    from invoice i 
    inner join customer c on i.customerid=c.customerid
    inner join employee e on c.supportrepid=e.employeeid;

--Write a SQL Query that shows all Tracks, but displays no IDs. Should also include the Album name, Media Type, and Genre
select t.name, a.title, m.name, g.name
    from track t, album a, mediatype m, genre g
    where t.albumid=a.albumid and t.mediatypeid=m.mediatypeid and t.genreid=g.genreid;

--Write a SQL Query that returns the Top 40 Songs for 2013
select count(i.trackid), t.name  
    from invoiceline i inner join track t 
    on i.trackid=t.trackid 
    group by t.name
    order by count(i.trackid) desc
    fetch first 40 rows only;

--Write a SQL Query that shows which sales agent made the most in sales overall
select e.firstname || e.lastname as sales, sum(i.total) as total
    from employee e, customer c, invoice i
    where e.employeeid=c.supportrepid and i.customerid=c.customerid
    group by e.firstname || e.lastname
    order by sum(i.total) desc; 

--Write a SQL Query that shows the top 3 best selling artists 
select t.composer
    from invoiceline i, track t
    where i.trackid=t.trackid
    group by t.composer
    order by count(i.trackid) desc
    fetch first 4 rows only;

--Write a SQL Query that returns which albums have no Heavy Metal tracks
select a.title from genre g, track t, album a
    where g.name<>'Heavy Metal' and g.genreid=t.genreid
    group by a.title;

--Write a SQL Query to find the the managers of employees supporting Brazilian customers
select * from employee where employeeid in (
    select reportsto from employee where employeeid in (
        select supportrepid from customer c where c.country='Brazil'));