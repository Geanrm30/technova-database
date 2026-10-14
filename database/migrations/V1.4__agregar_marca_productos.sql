USE TechNova_Bodega;
GO

ALTER TABLE inventario.Productos
ADD Marca NVARCHAR(80) NULL;
GO

ALTER VIEW inventario.vw_CatalogoProductos
AS
SELECT
    p.ProductoID,
    p.CodigoProducto,
    p.NombreProducto,
    p.Marca,
    c.NombreCategoria,
    pr.RazonSocial AS Proveedor,
    p.PrecioVenta,
    p.CostoUnitario,
    p.Stock,
    p.StockMinimo,
    p.StockMaximo,
    p.Activo,
    p.FechaUltimaActualizacion
FROM inventario.Productos AS p
INNER JOIN inventario.Categorias AS c
    ON p.CategoriaID = c.CategoriaID
LEFT JOIN compras.Proveedores AS pr
    ON p.ProveedorID = pr.ProveedorID;
GO