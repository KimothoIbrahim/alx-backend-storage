-- Validate email

-- update valid-email on email change
DROP TRIGGER IF EXISTS reset_valid_email;

DELIMITER $$

CREATE TRIGGER reset_valid_email BEFORE UPDATE ON `users` FOR EACH ROW
BEGIN
IF (OLD.email IS NOT NULL AND OLD.email != NEW.email) THEN
SET NEW.valid_email = 0;
END IF;
END$$

DELIMITER ;
