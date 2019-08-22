SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--  Comments here are associated with the test.
--  For test case examples, see: http://tsqlt.org/user-guide/tsqlt-tutorial/
CREATE PROCEDURE [test].[test dbKiteTest1]
AS
BEGIN
  DECLARE @actual INT
  DECLARE @expected INT

  SELECT @actual = 1
  SET @expected = 1
  EXEC tSQLt.AssertEquals @expected, @actual;

END;


GO
