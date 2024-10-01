/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES T WHERE T.TABLE_SCHEMA = 'Lookups' AND T.TABLE_NAME = 'RowStatusInfo') 
BEGIN
	IF NOT EXISTS(SELECT 1 FROM [Lookups].[RowStatusInfo] WHERE [RowStatus] LIKE N'A')
	BEGIN
		INSERT INTO [Lookups].[RowStatusInfo] ([RowStatus], [RowStatusValue]) VALUES (N'A', N'Active');
	END

	IF NOT EXISTS(SELECT 1 FROM [Lookups].[RowStatusInfo] WHERE [RowStatus] LIKE N'I')
	BEGIN
		INSERT INTO [Lookups].[RowStatusInfo] ([RowStatus], [RowStatusValue]) VALUES (N'I', N'Inactive');
	END

	IF NOT EXISTS(SELECT 1 FROM [Lookups].[RowStatusInfo] WHERE [RowStatus] LIKE N'T')
	BEGIN
		INSERT INTO [Lookups].[RowStatusInfo] ([RowStatus], [RowStatusValue]) VALUES (N'T', N'Temporary');
	END

    IF NOT EXISTS(SELECT 1 FROM [Lookups].[RowStatusInfo] WHERE [RowStatus] LIKE N'D')
	BEGIN
		INSERT INTO [Lookups].[RowStatusInfo] ([RowStatus], [RowStatusValue]) VALUES (N'D', N'Deleted');
	END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES T WHERE T.TABLE_SCHEMA = 'Lookups' AND T.TABLE_NAME = 'MetricSystemInfo') 
BEGIN
	IF NOT EXISTS(SELECT 1 FROM [Lookups].[MetricSystemInfo] WHERE [MetricSystem] LIKE N'C')
	BEGIN
		INSERT INTO [Lookups].[MetricSystemInfo] ([MetricSystem], [MetricSystemValue], [SequenceId], [RowStatus]) VALUES (N'C', N'Count Measure', 1, 'A');
	END
	IF NOT EXISTS(SELECT 1 FROM [Lookups].[MetricSystemInfo] WHERE [MetricSystem] LIKE N'L')
	BEGIN
		INSERT INTO [Lookups].[MetricSystemInfo] ([MetricSystem], [MetricSystemValue], [SequenceId], [RowStatus]) VALUES (N'L', N'Liquid Measure', 2, 'A');
	END
	IF NOT EXISTS(SELECT 1 FROM [Lookups].[MetricSystemInfo] WHERE [MetricSystem] LIKE N'W')
	BEGIN
		INSERT INTO [Lookups].[MetricSystemInfo] ([MetricSystem], [MetricSystemValue], [SequenceId], [RowStatus]) VALUES (N'W', N'Weight Measure', 3, 'A');
	END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES T WHERE T.TABLE_SCHEMA = 'Lookups' AND T.TABLE_NAME = 'MeasureTypeInfo') 
BEGIN
	IF NOT EXISTS(SELECT 1 FROM [Lookups].[MeasureTypeInfo] WHERE [MeasureType] LIKE N'KILOGRAM')
	BEGIN
		INSERT INTO [Lookups].[MeasureTypeInfo] ([MeasureType], [MeasureTypeValue], [MetricSystem], [SequenceId], [RowStatus]) VALUES (N'KILOGRAM', N'Kilogram', 'W', 1, 'A');
	END
	IF NOT EXISTS(SELECT 1 FROM [Lookups].[MeasureTypeInfo] WHERE [MeasureType] LIKE N'GRAM')
	BEGIN
		INSERT INTO [Lookups].[MeasureTypeInfo] ([MeasureType], [MeasureTypeValue], [MetricSystem], [SequenceId], [RowStatus]) VALUES (N'GRAM', N'Gram', 'W', 2, 'A');
	END
	IF NOT EXISTS(SELECT 1 FROM [Lookups].[MeasureTypeInfo] WHERE [MeasureType] LIKE N'LITRE')
	BEGIN
		INSERT INTO [Lookups].[MeasureTypeInfo] ([MeasureType], [MeasureTypeValue], [MetricSystem], [SequenceId], [RowStatus]) VALUES (N'LITRE', N'Litre', 'L', 3, 'A');
	END
	IF NOT EXISTS(SELECT 1 FROM [Lookups].[MeasureTypeInfo] WHERE [MeasureType] LIKE N'MILLILITRE')
	BEGIN
		INSERT INTO [Lookups].[MeasureTypeInfo] ([MeasureType], [MeasureTypeValue], [MetricSystem], [SequenceId], [RowStatus]) VALUES (N'MILLILITRE', N'Millilitre', 'L', 4, 'A');
	END
	IF NOT EXISTS(SELECT 1 FROM [Lookups].[MeasureTypeInfo] WHERE [MeasureType] LIKE N'UNIT')
	BEGIN
		INSERT INTO [Lookups].[MeasureTypeInfo] ([MeasureType], [MeasureTypeValue], [MetricSystem], [SequenceId], [RowStatus]) VALUES (N'UNIT', N'Unit', 'C', 5, 'A');
	END
	IF NOT EXISTS(SELECT 1 FROM [Lookups].[MeasureTypeInfo] WHERE [MeasureType] LIKE N'DOZEN')
	BEGIN
		INSERT INTO [Lookups].[MeasureTypeInfo] ([MeasureType], [MeasureTypeValue], [MetricSystem], [SequenceId], [RowStatus]) VALUES (N'DOZEN', N'Dozen', 'C', 6, 'A');
	END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES T WHERE T.TABLE_SCHEMA = 'Lookups' AND T.TABLE_NAME = 'PaymentMethodInfo') 
BEGIN
	IF NOT EXISTS(SELECT * FROM [Lookups].[PaymentMethodInfo] WHERE [PaymentMethod] LIKE N'CASH')
	BEGIN
		INSERT INTO [Lookups].[PaymentMethodInfo] ([PaymentMethod], [PaymentMethodValue], [SequenceId], [RowStatus]) VALUES (N'CASH', N'Cash', 1, 'A');
	END
    IF NOT EXISTS(SELECT * FROM [Lookups].[PaymentMethodInfo] WHERE [PaymentMethod] LIKE N'UPI')
	BEGIN
		INSERT INTO [Lookups].[PaymentMethodInfo] ([PaymentMethod], [PaymentMethodValue], [SequenceId], [RowStatus]) VALUES (N'UPI', N'UPI', 2, 'A');
	END
	IF NOT EXISTS(SELECT * FROM [Lookups].[PaymentMethodInfo] WHERE [PaymentMethod] LIKE N'CARD')
	BEGIN
		INSERT INTO [Lookups].[PaymentMethodInfo] ([PaymentMethod], [PaymentMethodValue], [SequenceId], [RowStatus]) VALUES (N'CARD', N'Card', 3, 'A');
	END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES T WHERE T.TABLE_SCHEMA = 'Lookups' AND T.TABLE_NAME = 'SubscriptionTypeInfo') 
BEGIN
	IF NOT EXISTS(SELECT * FROM [Lookups].[SubscriptionTypeInfo] WHERE [SubscriptionType] LIKE N'FREEMIUM')
	BEGIN
		INSERT INTO [Lookups].[SubscriptionTypeInfo] ([SubscriptionType], [SubscriptionTypeValue], [SequenceId], [RowStatus]) VALUES (N'FREEMIUM', N'FREEMIUM', 1, 'A');
	END
    IF NOT EXISTS(SELECT * FROM [Lookups].[SubscriptionTypeInfo] WHERE [SubscriptionType] LIKE N'PREMIUM')
	BEGIN
		INSERT INTO [Lookups].[SubscriptionTypeInfo] ([SubscriptionType], [SubscriptionTypeValue], [SequenceId], [RowStatus]) VALUES (N'PREMIUM', N'PREMIUM', 2, 'A');
	END
END
GO