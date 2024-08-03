WITH 
    RECURSIVE nodes 
    AS (
	    SELECT 
		    graph_lines.point1 AS "path",
		    graph_lines.point1, 
		    graph_lines.point2, 
		    graph_lines."cost",
		    1 as l_count
	    FROM graph_lines
	    WHERE point1 = 'A'
	
	    UNION
	
	    SELECT
		    CONCAT(nodes.path, ',', graph_lines.point1) AS "path",
		    graph_lines.point1, 
		    graph_lines.point2,
		    nodes.cost + graph_lines.cost,
		    l_count + 1
	    FROM
	    	nodes
		    INNER JOIN graph_lines ON nodes.point2 = graph_lines.point1
	    WHERE
		    "path" not like CONCAT('%', graph_lines.point1, '%')
	
    ),
    routes AS (
	    SELECT 
		    "cost" AS total_cost,
		    CONCAT('{', nodes.path, ',', nodes.point2, '}') AS tour
	    FROM
		    nodes
	    WHERE 
            point2 = 'A' AND 
            l_count = 4
    )
(
	SELECT
		*
	FROM 
		routes
	WHERE 
		total_cost = (SELECT MIN(total_cost) FROM routes)

	UNION 

	SELECT
		*
	FROM 
		routes
	WHERE 
		total_cost = (SELECT MAX(total_cost) FROM routes)
)
ORDER BY total_cost, tour;