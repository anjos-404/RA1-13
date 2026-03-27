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

        if token in ("RES", "MEM"):
            return token

        raise ValueError(f"Comando inválido '{token}'")

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
    
    for t in tokens_rpn:
        if t in "()":
            raise ValueError(f"Expressão RPN inválida: não deve conter '{t}'")

        if t.replace('.', '', 1).isdigit():
            pilha_calc.append(float(t))
            
        elif t == "RES":
            ultimo_valor = historico_res[-1] if historico_res else 0.0
            pilha_calc.append(ultimo_valor)
            
        elif t == "MEM":
            valor_salvo = memoria_vars.get("ultimo_salvo", 0.0)
            pilha_calc.append(valor_salvo)
            
        elif t in "+-*///%^":
            if len(pilha_calc) < 2:
                raise ValueError("Expressão errada: faltam operandos!")
                
            b = pilha_calc.pop()
            a = pilha_calc.pop()
            
            if t == '+': pilha_calc.append(a + b)
            elif t == '-': pilha_calc.append(a - b)
            elif t == '*': pilha_calc.append(a * b)
            elif t == '/': pilha_calc.append(a / b)
            elif t == '//': pilha_calc.append(a // b)
            elif t == '%': pilha_calc.append(a % b)
            elif t == '^': pilha_calc.append(a ** b)
            
    if len(pilha_calc) != 1:
        raise ValueError(f"Expressão errada: sobraram operandos na pilha! (Pilha: {pilha_calc})")
        
    resultado_final = pilha_calc[0]
    
    historico_res.append(resultado_final)
    
    return resultado_final


# ------------------ aluno 3 ------------#

def lerArquivo(nomeArquivo: str, linhas: list) -> bool:
    
    try:
        with open(nomeArquivo, 'r', encoding='utf-8') as arquivo:
            for linha in arquivo:
                linha_limpa = linha.strip()
                if linha_limpa:
                    linhas.append(linha_limpa)
        return True
    except FileNotFoundError:
        print(f" O arquivo '{nomeArquivo}' não foi encontrado.")
        return False
    except Exception as e:
        print(f" Falha ao ler o arquivo: {e}")
        return False

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
        if is_number(token):
   
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
            
            if token == '+':
                secao_text.append("    vadd.f64 d2, d1, d0")
            elif token == '-':
                secao_text.append("    vsub.f64 d2, d1, d0")
            elif token == '*':
                secao_text.append("    vmul.f64 d2, d1, d0")
            elif token == '/':
                secao_text.append("    vdiv.f64 d2, d1, d0")
            
            #
            secao_text.append("    vpush {d2}")

        elif token == 'MEM':
            secao_text.extend([
                "    @ --- Comando: MEM ---",
                "    ldr r0, =var_mem",
                "    vldr.f64 d0, [r0]",
                "    vpush {d0}"
            ])
            
        elif token == 'RES':
     
            secao_text.extend([
                "    @ --- Comando: RES ---",
                "    ldr r0, =var_res",
                "    vldr.f64 d0, [r0]",
                "    vpush {d0}"
            ])

    secao_text.extend([
        "    @ --- Fim da execucao ---",
        "_stop:",
        "    b _stop"
    ])

    codigoAssembly.extend(secao_data)
    codigoAssembly.append("") 
    codigoAssembly.extend(secao_text)





if __name__ == "__main__":

    if len(sys.argv) < 2:
        print("ERRO: Não foi passado o arquivo correto")
        sys.exit(1)

    nome_arquivo = sys.argv[1]
    with open(nome_arquivo, "r", encoding='utf-8') as arquivo:
        for linha in arquivo:
            linha = linha.strip()        
            try:
                meus_tokens = parseExpressao(linha)
                resultado = executarExpressao(meus_tokens)

                print(f"Correto: {linha}  =>  {resultado}")
            except Exception as e:
                print(f"Erro na linha: '{linha}': {e}")