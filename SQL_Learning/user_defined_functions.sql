/***
	Challenge: Create a Function
		Evaluate temperatures in Waharehouse.ColdRoomTemperatures
		Less than 3.5 degrees is too cold
		Greater tha 4 degrees is too hot
		Between 3.5 and 4 degrees is just right
***/

CREATE OR ALTER FUNCTION Warehouse.ColdRoomTemps (@Temperature DECIMAL(10,2))
RETURNS CHAR(20)
AS
BEGIN
	DECLARE @TemperatStatus AS CHAR(10);
	SET @TemperatStatus =
		CASE WHEN @Temperature < 3.5 THEN 'Too Cold'
			WHEN @Temperature > 4 THEN 'Too Hot'
			--WHEN @Temperature BETWEEN 3.5 AND 4 THEN 'just right'
			ELSE 'Just Right'
		END;
	RETURN @TemperatStatus;
END;
GO

-- Test the function
SELECT Warehouse.ColdRoomTemps(5);

SELECT 
	ColdRoomTemperatureID,
	ColdRoomSensorNumber,
	RecordedWhen,
	Temperature,
	Warehouse.ColdRoomTemps(Temperature) AS TempStatus
FROM Warehouse.ColdRoomTemperatures;

SELECT
	ColdRoomTemperatureID,
	Temperature
FROM Warehouse.ColdRoomTemperatures
WHERE Warehouse.ColdRoomTemps(Temperature) = 'Just Right';