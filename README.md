# dio-bd-ecommerce
## Tabela Clientes:

Armazena informações sobre os clientes.
Cada cliente é identificado por um idCliente exclusivo.
Pode ser um cliente Pessoa Física (PF) ou Pessoa Jurídica (PJ) com base no campo TipoCliente.
Armazena informações como nome, CPF (para PF), CNPJ (para PJ), endereço, email, telefone e data de cadastro.
O campo DataCadastro registra a data em que o cliente foi cadastrado.
Relacionamentos: Essa tabela está relacionada com as tabelas Pagamentos, Pedidos, CarrinhoCompras, e HistoricoPedidos através da chave estrangeira idCliente.
## Tabela Produtos:

Armazena informações sobre os produtos disponíveis para venda.
Cada produto é identificado por um idProduto exclusivo.
Armazena informações como nome, categoria, se é um produto infantil, avaliação, preço, descrição, data de cadastro e estoque.
O campo Estoque registra a quantidade disponível em estoque de cada produto.
Relacionamentos: Essa tabela está relacionada com a tabela Promoções através da chave estrangeira idProduto. Também está relacionada com a tabela ItensCarrinho através da chave estrangeira idProduto.
## Tabela Métodos de Pagamento:

Armazena informações sobre os métodos de pagamento disponíveis.
Cada método de pagamento é identificado por um idMetodoPagamento exclusivo.
Armazena o nome do método de pagamento.
É populada com valores como 'Cartão de Crédito', 'Cartão de Débito', 'Boleto' e 'PIX'.
Relacionamentos: Essa tabela está relacionada com a tabela Pagamentos através da chave estrangeira idMetodoPagamento.
## Tabela Pagamentos:

Armazena informações sobre os pagamentos feitos pelos clientes.
Cada pagamento é identificado por um idPagamento exclusivo.
Registra o cliente que fez o pagamento (idCliente), o método de pagamento utilizado (idMetodoPagamento), o valor do pagamento e a data do pagamento.
Relacionamentos: Essa tabela está relacionada com as tabelas Clientes e MetodosPagamento através de chaves estrangeiras.
## Tabela Pedidos:

Armazena informações sobre os pedidos feitos pelos clientes.
Cada pedido é identificado por um idPedido exclusivo.
Registra o cliente que fez o pedido (idCliente), o status do pedido, uma descrição, o valor do frete e a data do pedido.
Relacionamentos: Essa tabela está relacionada com a tabela Clientes através da chave estrangeira idCliente. Também está relacionada com as tabelas CarrinhoCompras e HistoricoPedidos.
## Tabela CarrinhoCompras:

Armazena informações sobre os carrinhos de compras dos clientes.
Cada carrinho é identificado por um idCarrinho exclusivo.
Registra o cliente dono do carrinho (idCliente), a data de criação do carrinho e a lista de itens no carrinho.
Relacionamentos: Essa tabela está relacionada com a tabela Clientes através da chave estrangeira idCliente. Também está relacionada com a tabela ItensCarrinho.
## Tabela ItensCarrinho:

Armazena informações sobre os itens no carrinho de compras.
Cada item é identificado por um idItemCarrinho exclusivo.
Registra o carrinho a que pertence (idCarrinho), o produto (idProduto) e a quantidade do produto no carrinho.
Relacionamentos: Essa tabela está relacionada com as tabelas CarrinhoCompras e Produtos através de chaves estrangeiras.
## Tabela HistoricoPedidos:

Armazena informações sobre os pedidos que foram concluídos e entregues.
Cada entrada é identificada por um idHistoricoPedido exclusivo.
Registra o cliente que fez o pedido (idCliente), o pedido em si (idPedido) e a data da compra.
Relacionamentos: Essa tabela está relacionada com as tabelas Clientes e Pedidos através de chaves estrangeiras.
## Tabela Entrega:

Armazena informações sobre o status de entrega de pedidos.
Cada entrega é identificada por um idEntrega exclusivo.
Registra o pedido a que se refere (idPedido), o status da entrega e um código de rastreamento.
Relacionamentos: Essa tabela está relacionada com a tabela Pedidos através da chave estrangeira idPedido.
## Tabela Promoções:

Armazena informações sobre promoções aplicadas a produtos.
Cada promoção é identificada por um idPromocao exclusivo.
Registra o produto que está em promoção (idProduto), o desconto aplicado, a data de início e a data de término da promoção.
Relacionamentos: Essa tabela está relacionada com a tabela Produtos através da chave estrangeira idProduto.
Este esquema lógico representa as principais entidades e relacionamentos envolvidos em um sistema de comércio eletrônico. Ele permite que informações sobre clientes, produtos, pedidos, pagamentos e entregas sejam gerenciadas de forma organizada e eficiente. Os relacionamentos entre as tabelas garantem a integridade dos dados e permitem consultas complexas
