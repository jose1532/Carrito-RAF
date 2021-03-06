USE [BDCANASTA]
GO
/****** Object:  StoredProcedure [dbo].[PA_BuscarClientePorDni]    Script Date: 23/07/2014 02:53:13 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[PA_BuscarClientePorDni]
@Dni char(8)

as
begin
select * from CLIENTES
where CLIE_Dni =@Dni 
end


GO
/****** Object:  StoredProcedure [dbo].[PA_Cliente]    Script Date: 23/07/2014 02:53:13 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[PA_Cliente]
@Codigo char(10),
@Dni char(8), 
@nombres varchar(50),
@email varchar(50) 
as
begin
insert into CLIENTES (CLIE_Codigo, CLIE_Dni, CLIE_NombresyAp, CLIE_Email)
values(@Codigo, @Dni,@nombres, @email)
end


GO
/****** Object:  StoredProcedure [dbo].[PA_DetalleVentas]    Script Date: 23/07/2014 02:53:13 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[PA_DetalleVentas]

@VEN_Codigo char(10),
@DV_Cantidad float, 
 @DV_Precio float, 
 @DV_SubTotal float, 
 @IDProducto char(10)

as

begin
insert into  [dbo].[DETALLE_VENTA](VEN_Codigo, codproducto , DV_Cantidad, DV_Precio, DV_SubTotal)
values( @VEN_Codigo, @IDProducto, @DV_Cantidad, @DV_Precio, @DV_SubTotal)
end
GO
/****** Object:  StoredProcedure [dbo].[pa_productos_buscarcodigo]    Script Date: 23/07/2014 02:53:13 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[pa_productos_buscarcodigo]
@codproducto char(4)
as
select * from PRODUCTOS where codproducto=@codproducto


GO
/****** Object:  StoredProcedure [dbo].[pa_productos_insertar]    Script Date: 23/07/2014 02:53:13 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[pa_productos_insertar]
@codproducto char(4),
@desproducto varchar(40),
@preproducto decimal(12, 2),
@canproducto int,
@foto varchar(50)
as
insert into PRODUCTOS
(
codproducto,
desproducto,
preproducto,
canproducto,
foto
)
values
(
@codproducto,
@desproducto,
@preproducto,
@canproducto,
@foto
)



GO
/****** Object:  StoredProcedure [dbo].[pa_productos_Listar]    Script Date: 23/07/2014 02:53:13 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pa_productos_Listar]
as
select * from PRODUCTOS


GO
/****** Object:  StoredProcedure [dbo].[PA_Ventas]    Script Date: 23/07/2014 02:53:13 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[PA_Ventas]
@VEN_Codigo char(10),
@VEN_Fecha date, 
@VEN_SubTotal float,
@VEN_IGV float, 
@VEN_Total float, 
@VEN_Estado varchar(50), 
@CLI_Codigo char(10)
as

begin
insert into dbo.Venta (VEN_Codigo, VEN_Fecha, CLIE_Codigo, VEN_IGV, VEN_SubTotal, VEN_TotalVenta, VEN_Estado)
values(@VEN_Codigo, @VEN_Fecha,@CLI_Codigo, @VEN_IGV,@VEN_SubTotal,@VEN_Total, @VEN_Estado)
end


GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 23/07/2014 02:53:13 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[CLIE_Codigo] [char](10) NOT NULL,
	[CLIE_Dni] [char](10) NULL,
	[CLIE_NombresyAp] [varchar](50) NULL,
	[CLIE_Email] [varchar](50) NULL,
 CONSTRAINT [PK_CLIENTES] PRIMARY KEY CLUSTERED 
(
	[CLIE_Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DETALLE_VENTA]    Script Date: 23/07/2014 02:53:13 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DETALLE_VENTA](
	[VEN_Codigo] [char](10) NULL,
	[codproducto] [char](10) NULL,
	[DV_Cantidad] [float] NULL,
	[DV_Precio] [float] NULL,
	[DV_SubTotal] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 23/07/2014 02:53:13 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRODUCTOS](
	[codproducto] [char](10) NOT NULL,
	[desproducto] [varchar](100) NULL,
	[preproducto] [decimal](12, 2) NULL,
	[canproducto] [int] NULL,
	[foto] [varchar](50) NULL,
 CONSTRAINT [PK_PRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[codproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 23/07/2014 02:53:13 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[Usuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NULL,
	[FotoUsuario] [varchar](100) NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VENTA]    Script Date: 23/07/2014 02:53:13 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VENTA](
	[VEN_Codigo] [char](10) NOT NULL,
	[VEN_Fecha] [date] NULL,
	[CLIE_Codigo] [char](10) NULL,
	[VEN_IGV] [float] NULL,
	[VEN_SubTotal] [float] NULL,
	[VEN_TotalVenta] [float] NULL,
	[VEN_Estado] [varchar](50) NULL,
 CONSTRAINT [PK_VENTA] PRIMARY KEY CLUSTERED 
(
	[VEN_Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CLIENTES] ([CLIE_Codigo], [CLIE_Dni], [CLIE_NombresyAp], [CLIE_Email]) VALUES (N'          ', N'          ', N'', N'')
INSERT [dbo].[CLIENTES] ([CLIE_Codigo], [CLIE_Dni], [CLIE_NombresyAp], [CLIE_Email]) VALUES (N'0001      ', N'70752474  ', N'Jose Urbina', N'cancer_12_92@hotmail.com')
INSERT [dbo].[CLIENTES] ([CLIE_Codigo], [CLIE_Dni], [CLIE_NombresyAp], [CLIE_Email]) VALUES (N'0002      ', N'45655644  ', N'Mario Urbina Sanes', N'mario123@gmail.com')
INSERT [dbo].[CLIENTES] ([CLIE_Codigo], [CLIE_Dni], [CLIE_NombresyAp], [CLIE_Email]) VALUES (N'0003      ', N'23456655  ', N'Charli Junior Purisaca Martinez', N'apolo140@hotmail.com')
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0002      ', N'1         ', 1, 170, 170)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0002      ', N'4         ', 1, 425, 425)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0002      ', N'2         ', 1, 2390, 2390)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0002      ', N'5         ', 1, 1050, 1050)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0003      ', N'1         ', 1, 170, 170)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0003      ', N'4         ', 1, 425, 425)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0003      ', N'2         ', 1, 2390, 2390)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0004      ', N'1         ', 1, 170, 170)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0004      ', N'4         ', 1, 425, 425)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0004      ', N'2         ', 1, 2390, 2390)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0004      ', N'5         ', 1, 1050, 1050)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0005      ', N'1         ', 1, 170, 170)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0005      ', N'4         ', 1, 425, 425)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0005      ', N'2         ', 1, 2390, 2390)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0006      ', N'1         ', 1, 170, 170)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0006      ', N'5         ', 1, 1050, 1050)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0006      ', N'4         ', 1, 425, 425)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0007      ', N'1         ', 1, 170, 170)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0007      ', N'4         ', 1, 425, 425)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0007      ', N'2         ', 1, 2390, 2390)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0008      ', N'1         ', 1, 170, 170)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0008      ', N'4         ', 1, 425, 425)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0009      ', N'1         ', 1, 170, 170)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0009      ', N'4         ', 1, 425, 425)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0009      ', N'2         ', 1, 2390, 2390)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0010      ', N'1         ', 1, 170, 170)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0010      ', N'4         ', 1, 425, 425)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0010      ', N'2         ', 1, 2390, 2390)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0011      ', N'1         ', 1, 170, 170)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0011      ', N'4         ', 1, 425, 425)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0011      ', N'2         ', 1, 2390, 2390)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0012      ', N'1         ', 3, 170, 510)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0012      ', N'4         ', 1, 425, 425)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0013      ', N'1         ', 1, 170, 170)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0013      ', N'4         ', 1, 425, 425)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0013      ', N'2         ', 1, 2390, 2390)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0013      ', N'5         ', 1, 1050, 1050)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0014      ', N'1         ', 3, 170, 510)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0014      ', N'4         ', 1, 425, 425)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0014      ', N'2         ', 1, 2390, 2390)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0014      ', N'5         ', 1, 1050, 1050)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0014      ', N'3         ', 1, 625, 625)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0014      ', N'6         ', 1, 1460, 1460)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0012      ', N'2         ', 1, 2390, 2390)
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [codproducto], [DV_Cantidad], [DV_Precio], [DV_SubTotal]) VALUES (N'0012      ', N'5         ', 1, 1050, 1050)
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [preproducto], [canproducto], [foto]) VALUES (N'1         ', N'Teclado Microsoft Wireless Optical 700 v2', CAST(170.00 AS Decimal(12, 2)), 100, N'images/teclado.png')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [preproducto], [canproducto], [foto]) VALUES (N'10        ', N'Zapatilla Nike Talla 42', CAST(250.00 AS Decimal(12, 2)), 45, N'images/zapatilla.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [preproducto], [canproducto], [foto]) VALUES (N'11        ', N'Short Jeans Talla 34', CAST(78.00 AS Decimal(12, 2)), 100, N'images/short.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [preproducto], [canproducto], [foto]) VALUES (N'12        ', N'Pantalon Jeans Talla 36', CAST(95.00 AS Decimal(12, 2)), 56, N'images/pantalon.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [preproducto], [canproducto], [foto]) VALUES (N'13        ', N'Polera Billabong Talla XL', CAST(120.00 AS Decimal(12, 2)), 43, N'images/polera.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [preproducto], [canproducto], [foto]) VALUES (N'14        ', N'Gorra Barcelona NT', CAST(56.00 AS Decimal(12, 2)), 12, N'images/gorra.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [preproducto], [canproducto], [foto]) VALUES (N'2         ', N'Proyector Epson PowerLife S10+', CAST(2390.00 AS Decimal(12, 2)), 100, N'images/proyector.png')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [preproducto], [canproducto], [foto]) VALUES (N'3         ', N'Multifuncional Láser HP LaserJet Pro M1132', CAST(625.00 AS Decimal(12, 2)), 100, N'images/impresora.png')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [preproducto], [canproducto], [foto]) VALUES (N'4         ', N'Monitor AOC LED E943FWS', CAST(425.00 AS Decimal(12, 2)), 100, N'images/monitor.png')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [preproducto], [canproducto], [foto]) VALUES (N'5         ', N'Procesador Core i3 3.1 GHz, 4GB Memoria Ram', CAST(1050.00 AS Decimal(12, 2)), 100, N'images/procesador.png')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [preproducto], [canproducto], [foto]) VALUES (N'6         ', N'Netbook Toshiba NB505-SP0111ORL', CAST(1460.00 AS Decimal(12, 2)), 100, N'images/notebook.png')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [preproducto], [canproducto], [foto]) VALUES (N'7         ', N'Polo Lacoste Talla XL', CAST(75.00 AS Decimal(12, 2)), 100, N'images/polo.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [preproducto], [canproducto], [foto]) VALUES (N'8         ', N'Casaca Rebook Talla L', CAST(90.00 AS Decimal(12, 2)), 50, N'images/casaca.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [preproducto], [canproducto], [foto]) VALUES (N'9         ', N'Zapatos Calimod Talla 43', CAST(100.00 AS Decimal(12, 2)), 34, N'images/zapato.jpg')
INSERT [dbo].[USUARIOS] ([Usuario], [Contraseña], [FotoUsuario]) VALUES (N'Administrador', N'123456', N'usuarios/administrador.png')
INSERT [dbo].[USUARIOS] ([Usuario], [Contraseña], [FotoUsuario]) VALUES (N'Plekle', N'123', N'usuarios/administrador.png')
INSERT [dbo].[USUARIOS] ([Usuario], [Contraseña], [FotoUsuario]) VALUES (N'Walter', N'1234', N'usuarios/walter.png')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [CLIE_Codigo], [VEN_IGV], [VEN_SubTotal], [VEN_TotalVenta], [VEN_Estado]) VALUES (N'0001      ', CAST(0xC9380B00 AS Date), N'0001      ', 766.65, 4035, 4801.65, N'Aceptada')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [CLIE_Codigo], [VEN_IGV], [VEN_SubTotal], [VEN_TotalVenta], [VEN_Estado]) VALUES (N'0002      ', CAST(0xC9380B00 AS Date), N'0001      ', 766.65, 4035, 4801.65, N'Aceptada')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [CLIE_Codigo], [VEN_IGV], [VEN_SubTotal], [VEN_TotalVenta], [VEN_Estado]) VALUES (N'0003      ', CAST(0xC9380B00 AS Date), N'0001      ', 567.15, 2985, 3552.15, N'Aceptada')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [CLIE_Codigo], [VEN_IGV], [VEN_SubTotal], [VEN_TotalVenta], [VEN_Estado]) VALUES (N'0004      ', CAST(0xC9380B00 AS Date), N'0001      ', 766.65, 4035, 4801.65, N'Aceptada')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [CLIE_Codigo], [VEN_IGV], [VEN_SubTotal], [VEN_TotalVenta], [VEN_Estado]) VALUES (N'0005      ', CAST(0xC9380B00 AS Date), N'0001      ', 567.15, 2985, 3552.15, N'Aceptada')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [CLIE_Codigo], [VEN_IGV], [VEN_SubTotal], [VEN_TotalVenta], [VEN_Estado]) VALUES (N'0006      ', CAST(0xC9380B00 AS Date), N'0001      ', 312.55, 1645, 1957.55, N'Aceptada')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [CLIE_Codigo], [VEN_IGV], [VEN_SubTotal], [VEN_TotalVenta], [VEN_Estado]) VALUES (N'0007      ', CAST(0xCA380B00 AS Date), N'0003      ', 567.15, 2985, 3552.15, N'Aceptada')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [CLIE_Codigo], [VEN_IGV], [VEN_SubTotal], [VEN_TotalVenta], [VEN_Estado]) VALUES (N'0008      ', CAST(0xCA380B00 AS Date), N'0003      ', 113.05, 595, 708.05, N'Aceptada')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [CLIE_Codigo], [VEN_IGV], [VEN_SubTotal], [VEN_TotalVenta], [VEN_Estado]) VALUES (N'0009      ', CAST(0xCA380B00 AS Date), N'0001      ', 567.15, 2985, 3552.15, N'Aceptada')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [CLIE_Codigo], [VEN_IGV], [VEN_SubTotal], [VEN_TotalVenta], [VEN_Estado]) VALUES (N'0010      ', CAST(0xCB380B00 AS Date), N'0001      ', 567.15, 2985, 3552.15, N'Aceptada')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [CLIE_Codigo], [VEN_IGV], [VEN_SubTotal], [VEN_TotalVenta], [VEN_Estado]) VALUES (N'0011      ', CAST(0xCB380B00 AS Date), N'0001      ', 567.15, 2985, 3552.15, N'Aceptada')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [CLIE_Codigo], [VEN_IGV], [VEN_SubTotal], [VEN_TotalVenta], [VEN_Estado]) VALUES (N'0012      ', CAST(0xCB380B00 AS Date), N'          ', 831.25, 4375, 5206.25, N'Aceptada')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [CLIE_Codigo], [VEN_IGV], [VEN_SubTotal], [VEN_TotalVenta], [VEN_Estado]) VALUES (N'0013      ', CAST(0xCB380B00 AS Date), N'0001      ', 766.65, 4035, 4801.65, N'Aceptada')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [CLIE_Codigo], [VEN_IGV], [VEN_SubTotal], [VEN_TotalVenta], [VEN_Estado]) VALUES (N'0014      ', CAST(0xCB380B00 AS Date), N'0001      ', 1227.4, 6460, 7687.4, N'Aceptada')
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_VENTA_PRODUCTOS1] FOREIGN KEY([codproducto])
REFERENCES [dbo].[PRODUCTOS] ([codproducto])
GO
ALTER TABLE [dbo].[DETALLE_VENTA] CHECK CONSTRAINT [FK_DETALLE_VENTA_PRODUCTOS1]
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_VENTA_VENTA] FOREIGN KEY([VEN_Codigo])
REFERENCES [dbo].[VENTA] ([VEN_Codigo])
GO
ALTER TABLE [dbo].[DETALLE_VENTA] CHECK CONSTRAINT [FK_DETALLE_VENTA_VENTA]
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_CLIENTES] FOREIGN KEY([CLIE_Codigo])
REFERENCES [dbo].[CLIENTES] ([CLIE_Codigo])
GO
ALTER TABLE [dbo].[VENTA] CHECK CONSTRAINT [FK_VENTA_CLIENTES]
GO
