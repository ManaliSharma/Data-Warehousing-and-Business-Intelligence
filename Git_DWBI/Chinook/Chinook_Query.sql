use chinook;

-- total sales

select sum(quantity*unitprice) as total_sales from invoiceline;

-- total sales by country
select sum(quantity*unitprice) as total_sales, i.billingcountry from invoiceline inv
inner join invoice i on i.invoiceid=inv.invoiceid
group by i.billingcountry
order by total_sales desc;


-- 	Total sales by country, state & city
select i.billingcountry,i.billingcity,i.billingstate, sum(total) as 'TotalSales'
from invoice as i
group by billingcity
order by totalsales desc;

-- ⦁	Total sales by customer – ranked
select customer.FirstName, customer.LastName, Sum(inv.quantity*inv.unitprice) as total_sales from invoiceline inv
inner join invoice i on i.invoiceid=inv.invoiceid 
inner join customer on customer.CustomerId=i.CustomerId
group by customer.CustomerId
order by total_sales desc;

-- total sales by artist
select artist.Name, sum(inv.quantity*inv.unitprice) as total_sales from invoice i
inner join invoiceline inv on inv.InvoiceId=i.InvoiceId
inner join track on track.TrackId=inv.TrackId
inner join album on album.AlbumId=track.AlbumId
inner join artist on artist.ArtistId=album.ArtistId
group by artist.name
order by total_sales desc;

-- ⦁	Total sales by artist & their albums
select artist.Name as ArtistName, album.title as AlbumTitle, sum(inv.quantity*inv.unitprice) as total_sales from invoice i
inner join invoiceline inv on inv.InvoiceId=i.InvoiceId
inner join track on track.TrackId=inv.TrackId
inner join album on album.AlbumId=track.AlbumId
inner join artist on artist.ArtistId=album.ArtistId
group by artist.name, album.title
order by total_sales desc;

-- ⦁	Total sales by sales person (employee)
ALTER TABLE employee
ADD age INT ;

select * from employee;

SET SQL_SAFE_UPDATES = 0;
UPDATE employee SET age= year(curdate())-year(birthdate);

ALTER TABLE employee
ADD age_group Varchar(10);

UPDATE employee SET age_group= '40-50' where age between 40 and 50;
UPDATE employee SET age_group= '50-60' where age between 50 and 60;
UPDATE employee SET age_group= '60-70' where age between 60 and 70;
UPDATE employee SET age_group= '70-80' where age between 70 and 80;

select e.FirstName, e.LastName, sum(inv.quantity) as quantity, Sum(inv.quantity*inv.unitprice),  e.age_group as total_sales from invoiceline inv
inner join invoice i on i.invoiceid=inv.invoiceid 
inner join customer c on c.CustomerId=i.CustomerId
inner join employee e  on e.employeeid=c.supportrepid
group by e.FirstName, e.LastName
order by total_sales desc;

-- ⦁	Total tracks bought and total cost by media type
select * from mediatype;
select * from track;
select m.name,sum(inv.quantity*inv.unitprice) as total_sales, sum(inv.quantity) as total_tracks from invoiceline inv 
inner join invoice i on i.invoiceid=inv.invoiceid
inner join track t on t.trackid=inv.trackid
inner join mediatype m on m.mediatypeid=t.mediatypeid
group by m.name
order by total_sales desc;


