import sys

def parseExpressao(linha: str):
    tokens = []
    i = 0
    n = len(linha)

    def estado_inicial():
        nonlocal i
        c = linha[i]

        if c.isdigit():
            return estado_numero()

        if c in "+-*/%^":
            return estado_operador()

        if c in "()":
            return estado_parenteses()

        if c.isalpha():
            return estado_comando()

        raise ValueError(f"Erro léxico: caractere inválido '{c}'")

    def estado_numero():
        nonlocal i
        token = ""
        tem_ponto = False

        while i < n:
            c = linha[i]

            if c.isdigit():
                token += c
            elif c == ".":
                if tem_ponto:
                    raise ValueError("Erro léxico: número malformado (dois pontos)")
                tem_ponto = True
                token += c
            else:
                break

            i += 1

        if token.endswith("."):
            raise ValueError("Erro léxico: número não pode terminar com ponto")

        return token

    def estado_operador():
        nonlocal i
        token = linha[i]
        i += 1
        return token

    def estado_parenteses():
        nonlocal i
        token = linha[i]
        i += 1
        return token

    def estado_comando():
        nonlocal i
        token = ""

        while i < n and linha[i].isalpha():
            token += linha[i]
            i += 1

        if token in ("RES", "MEM"):
            return token

        raise ValueError(f"Erro léxico: comando inválido '{token}'")

    while i < n:
        if linha[i].isspace():
            i += 1
            continue

        token = estado_inicial()
        tokens.append(token)
        print(token)

    return tokens


nome_arquivo = sys.argv[1]

with open(nome_arquivo, "r") as arquivo:
    for linha in arquivo:
        linha = linha.strip()
        parseExpressao(linha)