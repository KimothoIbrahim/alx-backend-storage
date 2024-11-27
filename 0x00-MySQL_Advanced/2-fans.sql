-- Script

-- Rank bands by number of fans
SELECT origin, fans as nb_fans FROM (SELECT origin, SUM(fans) as fans FROM `metal_bands` GROUP BY origin) as band ORDER BY fans DESC, origin;
