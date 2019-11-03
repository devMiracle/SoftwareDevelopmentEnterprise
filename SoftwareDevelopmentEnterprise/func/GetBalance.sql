CREATE FUNCTION [dbo].[GetBalance]
(
	
)
RETURNS DECIMAL (18, 4)
AS
BEGIN 
	DECLARE @total DECIMAL (18, 4);
	--
	SET @total = (SELECT SUM([Money]) FROM Payouts);
	SELECT @total = SUM([Money]) FROM Payouts
	--
	IF @total IS NULL SET @total = 0;
	RETURN @total;
END
