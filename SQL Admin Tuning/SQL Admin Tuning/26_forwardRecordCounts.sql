dbcc showcontig ('kundeumsatz')--45690


--Entscheidender Punkt!!!
alter table kundeumsatz add id int identity
--------------------------------------------
--Wo sollen die Ids hin, wenn die Seite voll ist?

dbcc showcontig ('kundeumsatz')--46322

select * from kundeumsatz where id = 1 --60000

select * from sys.dm_db_index_Physical_stats
	(db_id(), object_id('kundeumsatz'),NULL, NULL, 'detailed')
--forward_record_Count: 14460

create clustered index clix on kundeumsatz(id)

select * from sys.dm_db_index_Physical_stats
	(db_id(), object_id('kundeumsatz'),NULL, NULL, 'detailed')
--forward_record_Count: NULL (bei Heap 0)