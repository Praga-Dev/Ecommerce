﻿CREATE TABLE [Inventory].[ProductStockInfo]
(
	[Id] UNIQUEIDENTIFIER NOT NULL,
	[ProductInfoId] UNIQUEIDENTIFIER NOT NULL,
	[SKU] NVARCHAR(10) NOT NULL,
	[Quantity] INT NOT NULL,
	[SequenceId] INT NOT NULL IDENTITY,
	[CreatedBy] UNIQUEIDENTIFIER NOT NULL,
	[CreatedDate] DATETIME2 NOT NULL DEFAULT GETUTCDATE(),
	[ModifiedBy] UNIQUEIDENTIFIER NULL,
	[ModifiedDate] DATETIME2,
	[RowStatus] NVARCHAR(1) NOT NULL DEFAULT 'A'
	CONSTRAINT [PK_Inventory_ProductStockInfo] PRIMARY KEY NONCLUSTERED
	(
		[Id] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [FK_ProductStockInfo_ProductInfo] FOREIGN KEY ([ProductInfoId]) REFERENCES [Inventory].[ProductInfo]([Id]),
	CONSTRAINT [FK_ProductStockInfo_RowStatus] FOREIGN KEY ([RowStatus]) REFERENCES [Lookups].[RowStatusInfo]([RowStatus])
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_ProductStockInfo_SequenceId] ON [Inventory].[ProductStockInfo] ([SequenceId])
