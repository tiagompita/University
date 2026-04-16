--USE NewModus;
--GO

-- =========================================================
-- 1) Ver todos os clientes
-- =========================================================
SELECT * FROM NM.Cliente;
GO

-- =========================================================
-- 2) Encomendas com nome do cliente e estado de pagamentos
-- NOTA: O valor pago e em falta são agora calculados dinamicamente
-- =========================================================
SELECT 
    e.id_encomenda,
    c.nome AS cliente,
    e.data_encomenda,
    e.estado,
    e.valor_total,
    ISNULL(p.total_pago, 0) AS valor_pago,
    (e.valor_total - ISNULL(p.total_pago, 0)) AS valor_em_falta
FROM NM.Encomenda e
JOIN NM.Cliente c ON e.cliente = c.id_cliente
LEFT JOIN (
    SELECT encomenda, SUM(valor) AS total_pago 
    FROM NM.Pagamento_Encomenda 
    GROUP BY encomenda
) p ON e.id_encomenda = p.encomenda
ORDER BY e.id_encomenda;
GO

-- =========================================================
-- 3) Itens de cada encomenda com modelo
-- =========================================================
SELECT
    i.id_item_encomenda,
    i.tipo_peca,
    i.tamanho,
    i.preco,
    m.nome_modelo,
    e.id_encomenda
FROM NM.Item_Encomenda i
JOIN NM.Modelo m    ON i.modelo = m.id_modelo
JOIN NM.Encomenda e ON i.encomenda = e.id_encomenda
ORDER BY e.id_encomenda, i.id_item_encomenda;
GO

-- =========================================================
-- 4) Total pago por encomenda com base na tabela de pagamentos
-- NOTA: Atualizado para refletir a remoção do valor_em_falta da tabela original
-- =========================================================
SELECT
    e.id_encomenda,
    e.valor_total,
    ISNULL(SUM(p.valor), 0) AS total_pago_registado,
    (e.valor_total - ISNULL(SUM(p.valor), 0)) AS valor_em_falta
FROM NM.Encomenda e
LEFT JOIN NM.Pagamento_Encomenda p
    ON e.id_encomenda = p.encomenda
GROUP BY e.id_encomenda, e.valor_total
ORDER BY e.id_encomenda;
GO

-- =========================================================
-- 5) Tecidos usados em cada item de encomenda
-- =========================================================
SELECT
    i.id_item_encomenda,
    t.nome AS tecido,
    it.metros_usados
FROM NM.ItemEnc_Tecido it
JOIN NM.Item_Encomenda i ON it.item_encomenda = i.id_item_encomenda
JOIN NM.Tecido t         ON it.tecido = t.id_tecido
ORDER BY i.id_item_encomenda;
GO

-- =========================================================
-- 6) Materiais usados em cada item de encomenda
-- =========================================================
SELECT
    i.id_item_encomenda,
    m.nome AS material,
    im.quantidade_usada
FROM NM.ItemEnc_Material im
JOIN NM.Item_Encomenda i ON im.item_encomenda = i.id_item_encomenda
JOIN NM.Material m       ON im.material = m.id_material
ORDER BY i.id_item_encomenda;
GO

-- =========================================================
-- 7) Compras com detalhe dos produtos
-- =========================================================
SELECT
    c.id_compra,
    cl.nome AS cliente,
    p.nome AS produto,
    dc.quantidade,
    dc.preco_unitario,
    (dc.quantidade * dc.preco_unitario) AS subtotal
FROM NM.Compra c
JOIN NM.Cliente cl        ON c.cliente = cl.id_cliente
JOIN NM.Detalhe_Compra dc ON c.id_compra = dc.compra
JOIN NM.Produto_Pronto p  ON dc.produto_pronto = p.id_produto_pronto
ORDER BY c.id_compra, dc.id_detalhes;
GO

-- =========================================================
-- 8) Ajustes existentes, quer em compras quer em encomendas
-- =========================================================
SELECT
    a.id_ajuste,
    a.estado,
    a.custo,
    a.data_ajuste,
    a.descricao,
    a.detalhe_compra,
    a.item_encomenda
FROM NM.Ajuste a
ORDER BY a.id_ajuste;
GO

-- =========================================================
-- 9) Produtos prontos mais vendidos
-- =========================================================
SELECT
    p.nome,
    SUM(dc.quantidade) AS total_vendido
FROM NM.Detalhe_Compra dc
JOIN NM.Produto_Pronto p ON dc.produto_pronto = p.id_produto_pronto
GROUP BY p.nome
ORDER BY total_vendido DESC;
GO

-- =========================================================
-- 10) Clientes que fizeram encomendas e compras
-- MUDANÇA: Otimização usando EXISTS em vez de JOINs múltiplos
-- para evitar produtos cartesianos e uso ineficiente de DISTINCT.
-- =========================================================
SELECT 
    c.id_cliente,
    c.nome
FROM NM.Cliente c
WHERE EXISTS (
    SELECT 1 FROM NM.Encomenda e WHERE e.cliente = c.id_cliente
)
AND EXISTS (
    SELECT 1 FROM NM.Compra cp WHERE cp.cliente = c.id_cliente
);
GO