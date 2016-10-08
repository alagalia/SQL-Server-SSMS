SELECT DISTINCT RankedTable.DepartmentId, RankedTable.ThirdHighestSalary
 FROM
(SELECT e.DepartmentId, e.Salary AS ThirdHighestSalary,
	DENSE_RANK() OVER (PARTITION BY e.DepartmentId ORDER BY e.Salary DESC) as SalaryRank
	  FROM [dbo].[Employees] AS e) AS RankedTable
WHERE RankedTable.SalaryRank = 3

/* PARTITION BY e.DepartmentId е ако имаме още една колона, т.е по отдели ще ранкваме
ORDER BY e.Salary е на какъв принцип ще се ранкват */
