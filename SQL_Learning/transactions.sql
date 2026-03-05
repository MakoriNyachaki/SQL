-- Set up the challenge table and populate rows
DROP TABLE IF EXISTS dbo.BankAccounts;
CREATE TABLE dbo.BankAccounts (
    AccountID INT PRIMARY KEY,
    Balance decimal(10,2)
);
GO
INSERT INTO dbo.BankAccounts
    VALUES (1, 100.00), (2, 200.00), (3, 300.00);
GO
SELECT * FROM dbo.BankAccounts;
GO

-- Create a stored procedure that contains a transaction for transferring funds
-- Then use the stored procedure to transfer 50.00 from Account 1 to Account 3.
CREATE OR ALTER PROCEDURE dbo.TransferMoney(@DebitAccountID INT, 
                                    @CreditAccountID INT,
                                    @TransferAmount DECIMAL(5, 2))
AS
BEGIN TRY
    BEGIN TRANSACTION;
    
        -- Check if accounts exist
        -- Sending Account
        BEGIN IF(SELECT AccountID FROM dbo.BankAccounts WHERE AccountID = @DebitAccountID) IS NULL
            THROW 51000, 'The sending account does not exist. Check your sending account and try again!', 1;
        END;

        -- Receiving Account
        BEGIN IF(SELECT AccountID FROM dbo.BankAccounts WHERE AccountID = @CreditAccountID) IS NULL
            THROW 52000, 'The receiving account does not exist. Check your receiving account and try again!', 1;
        END;

        -- Check Balance
        BEGIN IF(SELECT Balance FROM dbo.BankAccounts WHERE AccountID = @DebitAccountID) < @TransferAmount
            THROW 53000, 'Balance in the Debit Account is less than the transfer amount. Therefore, Insufficient funds to transfer!', 1;
        END;


            DECLARE @CreditedAccountBal DECIMAL(5,2), 
                @DebitedAccountBal DECIMAL(5,2) ;
            SET @DebitedAccountBal = (
                                        SELECT Balance
                                            FROM dbo.BankAccounts 
                                             WHERE AccountID = @DebitAccountID
                                             ) - @TransferAmount
            SET @CreditedAccountBal = @TransferAmount + (
                                        SELECT Balance 
                                            FROM dbo.BankAccounts 
                                            WHERE AccountID = @CreditAccountID
                                            )
            UPDATE dbo.BankAccounts 
                SET Balance = @DebitedAccountBal 
                WHERE AccountID = @DebitAccountID;
            UPDATE dbo.BankAccounts
                SET Balance = @CreditedAccountBal
                WHERE AccountID = @CreditAccountID;

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    PRINT 'ERROR: ' + ERROR_MESSAGE();
END CATCH
;
GO

EXEC dbo.TransferMoney 9, 4, 50;
EXEC dbo.TransferMoney 1, 4, 50;
EXEC dbo.TransferMoney 5, 3, 50;
EXEC dbo.TransferMoney 1, 3, 50;
GO

-- Check if it is working
SELECT AccountID, Balance 
        FROM dbo.BankAccounts;