import sys

tokens = []
memoria_vars = {}
historico_res = []

def parseExpressao(linha: str):

    global tokens
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

        raise ValueError(f"Caractere inválido '{c}'")

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
                    raise ValueError("Número errado contém (dois pontos)")
                tem_ponto = True
                token += c
            else:
                break

            i += 1

        if token.endswith("."):
            raise ValueError("Número não pode terminar com ponto")

        return token

    def estado_operador():
        nonlocal i
        token = linha[i]
        
        if linha[i:i+2] == "//":
            i += 2
            return "//"
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

        while i < n and (linha[i].isalpha() or linha[i].isdigit()):
            token += linha[i]
            i += 1

        if token.isalpha() and token.isupper():
            return token

        raise ValueError(f"Comando ou Variável inválida '{token}' (deve ser 100% maiúscula)")

    while i < n:
        if linha[i].isspace():
            i += 1
            continue

        token = estado_inicial()
        tokens.append(token)

    return tokens

#--------------------- ALUNO 2 ---------------------------------#

def executarExpressao(tokens_rpn):
    global historico_res, memoria_vars
    
    pilha_calc = []
    
    tokens = ['('] + tokens_rpn + [')']
    
    def resolver_valor(val):
        if isinstance(val, str):
            if val == "RES":
                return historico_res[-1] if historico_res else 0.0
            return memoria_vars.get(val, 0.0)
        return float(val)
    
    for t in tokens:
        if t == '(':
            pilha_calc.append(t)
            
        elif t == ')':
            elementos = []
            while pilha_calc and pilha_calc[-1] != '(':
                elementos.append(pilha_calc.pop())
            elementos.reverse() 
            
            if pilha_calc:
                pilha_calc.pop() 

            if len(elementos) == 1:
                item = elementos[0]
                if isinstance(item, str) and item.isupper():
                    if item == "RES":
                        pilha_calc.append(historico_res[-1] if historico_res else 0.0)
                    else:
                        pilha_calc.append(memoria_vars.get(item, 0.0))
                else:
                    pilha_calc.append(item)
                    
            elif len(elementos) == 2:
                v, var_name = elementos[0], elementos[1]
                
                if var_name == "RES":
                    n = int(v) if not isinstance(v, str) else 0
                    idx = -(n + 1) 

                    if abs(idx) <= len(historico_res):
                        val = historico_res[idx]
                    else:
                        val = 0.0 
                        
                    pilha_calc.append(val)
                    
                elif isinstance(var_name, str) and var_name.isupper():
                    memoria_vars[var_name] = float(v)
                    pilha_calc.append(float(v))
                else:
                    raise ValueError(f"Erro: bloco inválido: {elementos}")
            
            elif len(elementos) == 0:
                pass 
                
            else:
                raise ValueError(f"Erro: malformada dentro dos parênteses: {elementos}")
                
        elif t.replace('.', '', 1).isdigit():
            pilha_calc.append(float(t))
            
        elif t in "+-*///%^":
            if len(pilha_calc) < 2 or pilha_calc[-1] == '(' or pilha_calc[-2] == '(':
                raise ValueError(f"Erro: faltam operandos para '{t}'!")
            b_raw = pilha_calc.pop()
            a_raw = pilha_calc.pop()
            
            b = resolver_valor(b_raw)
            a = resolver_valor(a_raw)
            
            if t == '+': pilha_calc.append(a + b)
            elif t == '-': pilha_calc.append(a - b)
            elif t == '*': pilha_calc.append(a * b)
            elif t == '/': pilha_calc.append(a / b)
            elif t == '//': pilha_calc.append(a // b)
            elif t == '%': pilha_calc.append(a % b)
            elif t == '^': pilha_calc.append(a ** b)
            
        else:
            pilha_calc.append(t)
            
    if len(pilha_calc) != 1:
        raise ValueError(f"Erro: sobraram operandos na pilha! (Pilha: {pilha_calc})")
        
    resultado_final = resolver_valor(pilha_calc[0])
    historico_res.append(resultado_final)
    
    return resultado_final


# ------------------ aluno 3 ------------#

def lerArquivo(nomeArquivo: str) -> list:
    linhas = []
    try:
        with open(nomeArquivo, 'r', encoding='utf-8') as arquivo:
            for linha in arquivo:
                linha_limpa = linha.strip()
                if linha_limpa:
                    linhas.append(linha_limpa)
        return linhas 
        
    except FileNotFoundError:
        print(f"Erro: O arquivo '{nomeArquivo}' não foi encontrado.")
        return [] 
    except Exception as e:
        print(f"Erro: Falha inesperada ao ler o arquivo: {e}")
        return []

def is_number(s: str) -> bool:
    try:
        float(s)
        return True
    except ValueError:
        return False

def gerarAssembly(tokens: list, codigoAssembly: list):
    secao_data = [
        ".data",
        "    @ Variaveis para comandos de memoria e historico",
        "    var_mem: .space 8   @ 64 bits para MEM",
        "    var_res: .space 8   @ 64 bits para RES"
    ]
    
    secao_text = [
        ".text",
        ".global _start",
        "_start:",
        "    @ Inicializacao do programa"
    ]

    contador_const = 0

    for token in tokens:
        if token in "()":
            continue
            
        elif is_number(token):
            nome_const = f"const_{contador_const}"
            secao_data.append(f"    {nome_const}: .double {token}")
            
            secao_text.extend([
                f"    @ --- Empilhando numero: {token} ---",
                f"    ldr r0, ={nome_const}",
                f"    vldr.f64 d0, [r0]",
                f"    vpush {{d0}}"
            ])
            contador_const += 1

        elif token in ['+', '-', '*', '/']:
            secao_text.extend([
                f"    @ --- Operacao: {token} ---",
                "    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)"
            ])
            
            if token == '+': secao_text.append("    vadd.f64 d2, d1, d0")
            elif token == '-': secao_text.append("    vsub.f64 d2, d1, d0")
            elif token == '*': secao_text.append("    vmul.f64 d2, d1, d0")
            elif token == '/': secao_text.append("    vdiv.f64 d2, d1, d0")
            
            secao_text.append("    vpush {d2}")

        elif token.isalpha() and token.isupper():
            secao_text.extend([
                f"    @ --- Comando Variavel: {token} (Leitura basica) ---",
                f"    @ Requer implementacao do vstr para gravacao",
            ])

    secao_text.extend([
        "    @ --- Fim da execucao ---",
        "_stop:",
        "    b _stop         @ Loop infinito para segurar a execucao no Cpulator"
    ])

    codigoAssembly.extend(secao_data)
    codigoAssembly.append("") 
    codigoAssembly.extend(secao_text)


if __name__ == "__main__":

    if len(sys.argv) < 2:
        print("ERRO: Não foi passado o arquivo correto")
        sys.exit(1)
        
    print("\n--- Começando a processar o arquivo de verdade ---")

    nome_arquivo = sys.argv[1]

    linhas_do_arquivo = lerArquivo(nome_arquivo)

    if linhas_do_arquivo:
        for linha in linhas_do_arquivo:
            if linha.startswith("#"):
                continue
            
            try:
                meus_tokens = parseExpressao(linha)
                resultado = executarExpressao(meus_tokens)
                print(resultado)
                codigo_asm = []
                # gerarAssembly(meus_tokens, codigo_asm)
                
                # for linha_asm in codigo_asm:
                #     print(linha_asm)
                # print("-" * 40)
                
            except Exception as e:
                print(f"Erro na linha '{linha}': {e}")
    else:
        print("Nenhuma linha para processar (arquivo não encontrado, vazio ou com erro).")