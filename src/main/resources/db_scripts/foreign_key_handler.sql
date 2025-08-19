-- 모든 foreign key 제약조건 삭제 쿼리
SELECT CONCAT('ALTER TABLE `', table_name, '` DROP FOREIGN KEY `', constraint_name, '`;')
FROM information_schema.KEY_COLUMN_USAGE
WHERE referenced_table_schema = DATABASE();

-- foreign 체크 임시로 끔
SET FOREIGN_KEY_CHECKS = 0;
-- foreign 체크 On
SET FOREIGN_KEY_CHECKS = 1;
