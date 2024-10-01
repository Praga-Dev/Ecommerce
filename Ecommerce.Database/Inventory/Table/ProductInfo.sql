CREATE TABLE [Inventory].[ProductInfo]
(
	[Id] UNIQUEIDENTIFIER NOT NULL,
	[ProductSubCategoryInfoId] UNIQUEIDENTIFIER NOT NULL,
	[SequenceId] INT NOT NULL IDENTITY,
	[CreatedBy] UNIQUEIDENTIFIER NOT NULL,
	[CreatedDate] DATETIME2 NOT NULL DEFAULT GETUTCDATE(),
	[ModifiedBy] UNIQUEIDENTIFIER NULL,
	[ModifiedDate] DATETIME2,
	[RowStatus] NVARCHAR(1) NOT NULL DEFAULT 'A'
	CONSTRAINT [PK_Inventory_ProductInfo] PRIMARY KEY NONCLUSTERED
	(
		[Id] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [FK_ProductSubCategoryInfo_ProductInfo] FOREIGN KEY ([ProductSubCategoryInfoId]) REFERENCES [Inventory].[ProductSubCategoryInfo]([Id]),
	CONSTRAINT [FK_ProductInfo_RowStatus] FOREIGN KEY ([RowStatus]) REFERENCES [Lookups].[RowStatusInfo]([RowStatus])
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_ProductInfo_SequenceId] ON [Inventory].[ProductInfo] ([SequenceId])
