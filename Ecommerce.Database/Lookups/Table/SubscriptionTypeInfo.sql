CREATE TABLE [Lookups].[SubscriptionTypeInfo]
(
	[SubscriptionType] NVARCHAR(10) NOT NULL,
	[SubscriptionTypeValue] NVARCHAR(10) NOT NULL,
	[SequenceId] INT NOT NULL,
	[RowStatus] NVARCHAR(1) NOT NULL DEFAULT 'A'
	CONSTRAINT [PK_Lookups_SubscriptionTypeInfo] PRIMARY KEY CLUSTERED 
	(
		[SubscriptionType] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	CONSTRAINT [FK_SubscriptionTypeInfo_RowStatusInfo] FOREIGN KEY ([RowStatus]) REFERENCES [Lookups].[RowStatusInfo]([RowStatus])
) ON [PRIMARY];