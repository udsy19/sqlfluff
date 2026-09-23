-- GROUPING SETS, ROLLUP(...) and CUBE(...) in a GROUP BY clause.
-- These are documented, current T-SQL syntax (SQL Server 2008+), distinct
-- from the older `WITH ROLLUP` form already covered by group_by.sql.

SELECT dept, job, SUM(sal)
FROM emp
GROUP BY GROUPING SETS ((dept, job), (dept), ());

SELECT dept, job, SUM(sal)
FROM emp
GROUP BY ROLLUP (dept, job);

SELECT dept, job, SUM(sal)
FROM emp
GROUP BY CUBE (dept, job);
