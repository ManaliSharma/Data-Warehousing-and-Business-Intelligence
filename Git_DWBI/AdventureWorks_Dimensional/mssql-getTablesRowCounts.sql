use AdventureWorksDW2017
go

SELECT @@servername as serverName,
        db_name() as dbName,
        s.name AS schemaName,
        t.NAME AS tableName,
        format(p.[Rows],'n0') as tableRowCounts,
		getdate() as QueryTime
    FROM    sys.tables t
    INNER JOIN  sys.indexes i ON t.OBJECT_ID = i.object_id
    INNER JOIN  sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
    INNER JOIN sys.schemas s on s.schema_id = t.schema_id
    WHERE 
        t.NAME NOT LIKE 'dt%' AND
        i.OBJECT_ID > 255 AND   
        i.index_id <= 1 
		-- AND s.name in ('Schemaname1','Schemaname2') if want to select specific schemas
    GROUP BY 
             t.NAME, i.object_id
		   , i.index_id
		   , i.name
		    ,s.name
		    , p.[Rows]
    ORDER BY   s.name
	         , t.name