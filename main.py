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
                    n = int(v) if not isinstance(v, str) else 1
                    if n <= 0:
                        n = 1 
    
                    idx = -n 

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

def gerarAssembly(todas_linhas_tokens: list, codigoAssembly: list):
    secao_data = [
        ".data",
        "    @ Variaveis para comandos de memoria e historico",
        "    var_res: .space 8   @ 64 bits para o historico RES"
    ]
    
    secao_text = [
        ".text",
        ".global _start",
        "_start:",
        "    @ Inicializacao do programa"
    ]

    contador_const = 0
    variaveis_criadas = set(["res"]) 
    
   
    for num_linha, tokens in enumerate(todas_linhas_tokens, 1):
        secao_text.append(f"\n    @ ====== PROCESSANDO LINHA {num_linha} ======")
        
        pilha_asm = []
        tokens_blocos = ['('] + tokens + [')']

        for token in tokens_blocos:
            if token == '(':
                pilha_asm.append(token)
                
            elif token == ')':
                elementos = []
                while pilha_asm and pilha_asm[-1] != '(':
                    elementos.append(pilha_asm.pop())
                elementos.reverse()
                
                if pilha_asm:
                    pilha_asm.pop() 

                if len(elementos) == 1:
                    item = elementos[0]
                    if isinstance(item, str) and item.isupper() and item != "RES":
                        if item not in variaveis_criadas:
                            secao_data.append(f"    var_{item}: .space 8")
                            variaveis_criadas.add(item)
                            
                        secao_text.extend([
                            f"    @ --- Lendo da variavel {item} ---",
                            f"    ldr r0, =var_{item}",
                            "    vldr.f64 d0, [r0]",
                            "    vpush {d0}"
                        ])
                        pilha_asm.append("VALOR_LIDO")
                    else:
                        pilha_asm.append(item)
                        
                elif len(elementos) == 2:
                    v, var_name = elementos[0], elementos[1]
                    
                    if var_name == "RES":
                        secao_text.extend([
                            "    @ --- Comando RES (Puxando do historico) ---",
                            "    ldr r0, =var_res",
                            "    vldr.f64 d0, [r0]",
                            "    vpush {d0}"
                        ])
                        pilha_asm.append("VALOR_RES")
                        
                    elif isinstance(var_name, str) and var_name.isupper():
                        if var_name not in variaveis_criadas:
                            secao_data.append(f"    var_{var_name}: .space 8")
                            variaveis_criadas.add(var_name)
                            
                        secao_text.extend([
                            f"    @ --- Gravando na variavel {var_name} ---",
                            "    vpop {d0}               @ Puxa o valor do topo",
                            f"    ldr r0, =var_{var_name} @ Pega o endereco da variavel",
                            "    vstr.f64 d0, [r0]       @ Salva na memoria",
                            "    vpush {d0}              @ Devolve pra pilha pra continuar"
                        ])
                        pilha_asm.append("VALOR_GRAVADO")
                
            elif is_number(token):
                nome_const = f"const_{contador_const}"
                secao_data.append(f"    {nome_const}: .double {token}")
                
                secao_text.extend([
                    f"    @ --- Empilhando numero: {token} ---",
                    f"    ldr r0, ={nome_const}",
                    "    vldr.f64 d0, [r0]",
                    "    vpush {d0}"
                ])
                contador_const += 1
                pilha_asm.append(token)

            elif token in ['+', '-', '*', '/', '//', '%', '^']:
                secao_text.extend([
                    f"    @ --- Operacao: {token} ---",
                    "    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)"
                ])
                
                if token == '+': secao_text.append("    vadd.f64 d2, d1, d0")
                elif token == '-': secao_text.append("    vsub.f64 d2, d1, d0")
                elif token == '*': secao_text.append("    vmul.f64 d2, d1, d0")
                elif token == '/': secao_text.append("    vdiv.f64 d2, d1, d0")
                
                secao_text.append("    vpush {d2}")
                pilha_asm.append("RESULTADO")

            elif token.isalpha() and token.isupper():
                pilha_asm.append(token)

        secao_text.extend([
            f"    @ --- Salvando resultado final da Linha {num_linha} no historico (RES) ---",
            "    vpop {d0}",
            "    ldr r0, =var_res",
            "    vstr.f64 d0, [r0]",
            "    vpush {d0}   @ Devolve pro topo"
        ])

    secao_text.extend([
        "\n    @ --- Fim da execucao de todo o arquivo ---",
        "_stop:",
        "    b _stop         @ Loop infinito para segurar a execucao no Cpulator"
    ])

    codigoAssembly.extend(secao_data)
    codigoAssembly.append("") 
    codigoAssembly.extend(secao_text)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("ERRO: Não foi passado o arquivo de teste.")
        sys.exit(1)

    nome_arquivo = sys.argv[1]
    linhas_do_arquivo = lerArquivo(nome_arquivo)
    
    todas_as_linhas_tokens = []

    if linhas_do_arquivo:
        for linha in linhas_do_arquivo:
            if linha.startswith("#"):
                continue
            
            try:
                meus_tokens = parseExpressao(linha)
                resultado = executarExpressao(meus_tokens)
                print(f"Sucesso: {linha}  =>  {resultado}")
                
                todas_as_linhas_tokens.append(meus_tokens)
            except Exception as e:
                print(f"Erro na linha '{linha}': {e}")
                
      
        if todas_as_linhas_tokens:
            codigo_asm_completo = []
            gerarAssembly(todas_as_linhas_tokens, codigo_asm_completo)