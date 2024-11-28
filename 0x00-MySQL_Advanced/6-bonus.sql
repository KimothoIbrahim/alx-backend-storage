-- creating a procedure

-- adds new corrections for students
DROP PROCEDURE IF EXISTS AddBonus;

DELIMITER $$

CREATE PROCEDURE AddBonus(IN user_id iNT, IN project_name VARCHAR(30), IN score INT)
BEGIN

IF (SELECT id FROM projects WHERE name=project_name) THEN

INSERT INTO `corrections` (user_id, project_id, score)
VALUES (user_id, (SELECT id FROM projects WHERE name=project_name), score);

ELSE

INSERT INTO projects (name) VALUES (project_name);
SET @project_id = LAST_INSERT_ID();

INSERT INTO `corrections` (user_id, project_id, score)                                                                  VALUES (user_id, @project_id, score);

END IF;
END$$


DELIMITER ;
