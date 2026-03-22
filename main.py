import sys

nome_arquivo = sys.argv[1]  

with open(nome_arquivo, "r") as arquivo:
    for linha in arquivo:
        linha = linha.strip()
        print(linha)


