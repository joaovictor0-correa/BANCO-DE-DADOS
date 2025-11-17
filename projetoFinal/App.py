class Produto:
    def __init__(self, id, nome, preco, estoque):
        self.id = id
        self.nome = nome
        self.preco = preco
        self.estoque = estoque

    def __str__(self):
        return f"{self.id} - {self.nome} | R$ {self.preco:.2f} | Estoque: {self.estoque}"


class Loja:
    def __init__(self):
        self.produtos = []
        self.carrinho = []

    def adicionar_produto(self, produto):
        self.produtos.append(produto)

    def listar_produtos(self):
        print("\n--- LISTA DE PRODUTOS ---")
        for p in self.produtos:
            print(p)

    def adicionar_carrinho(self, id_produto, quantidade):
        for p in self.produtos:
            if p.id == id_produto:
                if p.estoque >= quantidade:
                    self.carrinho.append((p, quantidade))
                    p.estoque -= quantidade
                    print(f"{quantidade}x {p.nome} adicionado ao carrinho!")
                else:
                    print("Estoque insuficiente!")
                return
        print("Produto não encontrado!")

    def ver_carrinho(self):
        print("\n--- CARRINHO ---")
        total = 0
        for item in self.carrinho:
            produto, qtd = item
            subtotal = produto.preco * qtd
            total += subtotal
            print(f"{produto.nome} - {qtd}x | R$ {subtotal:.2f}")
        print(f"TOTAL: R$ {total:.2f}")

    def finalizar_compra(self):
        if not self.carrinho:
            print("Carrinho vazio!")
            return
        print("\nCompra finalizada! Obrigado pela preferência.")
        self.carrinho.clear()


# --- USO DO SISTEMA ---
loja = Loja()

# Produtos iniciais
loja.adicionar_produto(Produto(1, "Camiseta Preta", 39.90, 10))
loja.adicionar_produto(Produto(2, "Calça Jeans", 119.90, 5))
loja.adicionar_produto(Produto(3, "Jaqueta Couro", 299.90, 2))

# Menu simples
while True:
    print("\n==== LOJA DE ROUPAS ====")
    print("1 - Listar produtos")
    print("2 - Adicionar ao carrinho")
    print("3 - Ver carrinho")
    print("4 - Finalizar compra")
    print("5 - Sair")
    opcao = input("Escolha uma opção: ")

    if opcao == "1":
        loja.listar_produtos()

    elif opcao == "2":
        id_prod = int(input("ID do produto: "))
        qtd = int(input("Quantidade: "))
        loja.adicionar_carrinho(id_prod, qtd)

    elif opcao == "3":
        loja.ver_carrinho()

    elif opcao == "4":
        loja.finalizar_compra()

    elif opcao == "5":
        print("Saindo...")
        break

    else:
        print("Opção inválida!")
