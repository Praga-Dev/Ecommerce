﻿CREATE TABLE [Auth].[UserInfo]
(
	[Id] UNIQUEIDENTIFIER NOT NULL,
	[SequenceId] INT NOT NULL IDENTITY,
	[UserName] NVARCHAR(256) NULL,
	[FirstName] NVARCHAR(60) NOT NULL,
	[LastName] NVARCHAR(60) NOT NULL,
	[SubscriptionType] NVARCHAR(10) NULL, -- Only customers has Subscription types  -- Deprecate and move to NOSQL
	[CreatedBy] UNIQUEIDENTIFIER NOT NULL,	
	[CreatedDate] DATETIME2 NOT NULL DEFAULT GETUTCDATE(),
	[ModifiedBy] UNIQUEIDENTIFIER NULL,
	[ModifiedDate] DATETIME2,
	[RowStatus] NVARCHAR(1) NOT NULL DEFAULT 'A'
	CONSTRAINT [PK_account_UserInfo] PRIMARY KEY NONCLUSTERED 
	(
		[Id] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY], 
    CONSTRAINT [FK_UserInfo_SubscriptionTypeInfo] FOREIGN KEY ([SubscriptionType]) REFERENCES [Lookups].[SubscriptionTypeInfo]([SubscriptionType]),
    CONSTRAINT [FK_UserInfo_RowStatus] FOREIGN KEY ([RowStatus]) REFERENCES [Lookups].[RowStatusInfo]([RowStatus])
) ON [PRIMARY];
GO
CREATE UNIQUE CLUSTERED INDEX [IX_UserInfo_SequenceId] ON [Auth].[UserInfo] ([SequenceId])
GO
