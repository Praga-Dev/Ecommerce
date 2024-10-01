CREATE TABLE [Inventory].[ProductSubCategoryInfo]
(
	[Id] UNIQUEIDENTIFIER NOT NULL,
	[ProductCategoryInfoId] UNIQUEIDENTIFIER NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,
	[Description] NVARCHAR(500) NOT NULL,
	[SequenceId] INT NOT NULL IDENTITY,
	[CreatedBy] UNIQUEIDENTIFIER NOT NULL,
	[CreatedDate] DATETIME2 NOT NULL DEFAULT GETUTCDATE(),
	[ModifiedBy] UNIQUEIDENTIFIER NULL,
	[ModifiedDate] DATETIME2,
	[RowStatus] NVARCHAR(1) NOT NULL DEFAULT 'A'
	CONSTRAINT [PK_Inventory_ProductSubCategoryInfo] PRIMARY KEY NONCLUSTERED
	(
		[Id] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [FK_ProductSubCategoryInfo_ProductCategoryInfo] FOREIGN KEY ([ProductCategoryInfoId]) REFERENCES [Inventory].[ProductSubCategoryInfo]([Id]),
	CONSTRAINT [FK_ProductSubCategoryInfo_RowStatus] FOREIGN KEY ([RowStatus]) REFERENCES [Lookups].[RowStatusInfo]([RowStatus])
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_ProductSubCategoryInfo_SequenceId] ON [Inventory].[ProductCategoryInfo] ([SequenceId])
