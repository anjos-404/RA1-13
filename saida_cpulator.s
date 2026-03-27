.data
    @ Variaveis para comandos de memoria e historico
    var_res: .space 8   @ 64 bits para o historico RES
    const_0: .double 3
    const_1: .double 4
    const_2: .double 10
    const_3: .double 2
    const_4: .double 5
    const_5: .double 6
    const_6: .double 8
    const_7: .double 3
    const_8: .double 2
    const_9: .double 3
    const_10: .double 12
    const_11: .double 5
    const_12: .double 7
    const_13: .double 2
    const_14: .double 9
    const_15: .double 3
    const_16: .double 15
    const_17: .double 4
    const_18: .double 6
    const_19: .double 2
    const_20: .double 3.5
    const_21: .double 2
    const_22: .double 4.2
    const_23: .double 1.8
    const_24: .double 7.0
    const_25: .double 3
    const_26: .double 10.5
    const_27: .double 2
    const_28: .double 8.1
    const_29: .double 1.1
    const_30: .double 2
    const_31: .double 3
    const_32: .double 4
    const_33: .double 5
    const_34: .double 1
    const_35: .double 2
    const_36: .double 9
    const_37: .double 3
    const_38: .double 2
    const_39: .double 6
    const_40: .double 2
    const_41: .double 3
    const_42: .double 8
    const_43: .double 4
    const_44: .double 2
    const_45: .double 10
    var_MEM: .space 8
    const_46: .double 5
    const_47: .double 8
    const_48: .double 2
    const_49: .double 3
    const_50: .double 7
    const_51: .double 2
    const_52: .double 2
    const_53: .double 3
    const_54: .double 4
    var_RESULTADO: .space 8
    const_55: .double 5
    const_56: .double 1
    const_57: .double 2
    const_58: .double 9
    const_59: .double 3
    const_60: .double 2
    const_61: .double 6
    const_62: .double 2
    const_63: .double 3
    const_64: .double 8
    const_65: .double 4
    const_66: .double 2
    const_67: .double 1
    const_68: .double 2
    const_69: .double 3
    const_70: .double 4
    const_71: .double 2
    const_72: .double 3
    const_73: .double 4
    const_74: .double 5
    const_75: .double 100
    const_76: .double 5
    const_77: .double 2
    const_78: .double 9
    const_79: .double 2
    const_80: .double 3
    const_81: .double 50
    const_82: .double 5
    const_83: .double 3
    const_84: .double 1.1
    const_85: .double 2.2
    const_86: .double 3.3
    const_87: .double 1.1
    const_88: .double 4.4
    const_89: .double 2
    const_90: .double 5.5
    const_91: .double 5
    const_92: .double 6.6
    const_93: .double 2
    const_94: .double 10
    const_95: .double 2
    const_96: .double 3
    const_97: .double 20
    const_98: .double 5
    const_99: .double 2
    const_100: .double 30
    const_101: .double 3
    const_102: .double 2
    const_103: .double 40
    const_104: .double 8
    const_105: .double 5
    const_106: .double 50
    const_107: .double 7
    const_108: .double 4
    const_109: .double 2
    const_110: .double 2
    const_111: .double 2
    const_112: .double 2
    const_113: .double 3
    const_114: .double 3
    const_115: .double 3
    const_116: .double 3
    const_117: .double 4
    const_118: .double 2
    const_119: .double 2
    const_120: .double 2
    const_121: .double 5
    const_122: .double 2
    const_123: .double 2
    const_124: .double 2
    const_125: .double 6
    const_126: .double 5
    const_127: .double 4
    const_128: .double 3
    const_129: .double 1
    const_130: .double 2
    const_131: .double 3
    const_132: .double 4
    const_133: .double 5
    const_134: .double 6
    const_135: .double 7
    const_136: .double 8
    const_137: .double 9
    const_138: .double 2
    const_139: .double 3
    const_140: .double 4
    const_141: .double 5
    const_142: .double 6
    const_143: .double 7
    const_144: .double 100
    const_145: .double 200
    const_146: .double 300
    const_147: .double 400
    const_148: .double 500
    const_149: .double 9
    const_150: .double 3
    const_151: .double 8
    const_152: .double 2
    const_153: .double 7
    const_154: .double 1
    const_155: .double 6
    const_156: .double 3
    const_157: .double 5
    const_158: .double 2
    const_159: .double 1
    const_160: .double 2
    const_161: .double 3
    const_162: .double 4
    const_163: .double 5
    const_164: .double 6
    const_165: .double 7
    const_166: .double 8
    const_167: .double 2
    const_168: .double 3
    const_169: .double 10
    const_170: .double 3.14
    const_171: .double 5
    const_172: .double 50
    var_VARA: .space 8
    var_VALOR_GRAVADO: .space 8
    const_173: .double 10

.text
.global _start
_start:
    @ Inicializacao do programa

    @ ====== PROCESSANDO LINHA 1 ======
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_0
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 4 ---
    ldr r0, =const_1
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 1 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 2 ======
    @ --- Empilhando numero: 10 ---
    ldr r0, =const_2
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_3
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 2 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 3 ======
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_4
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 6 ---
    ldr r0, =const_5
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 3 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 4 ======
    @ --- Empilhando numero: 8 ---
    ldr r0, =const_6
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_7
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: - ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vsub.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 4 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 5 ======
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_8
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_9
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: ^ ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Salvando resultado final da Linha 5 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 6 ======
    @ --- Empilhando numero: 12 ---
    ldr r0, =const_10
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_11
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 6 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 7 ======
    @ --- Empilhando numero: 7 ---
    ldr r0, =const_12
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_13
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 7 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 8 ======
    @ --- Empilhando numero: 9 ---
    ldr r0, =const_14
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_15
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 8 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 9 ======
    @ --- Empilhando numero: 15 ---
    ldr r0, =const_16
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 4 ---
    ldr r0, =const_17
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: - ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vsub.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 9 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 10 ======
    @ --- Empilhando numero: 6 ---
    ldr r0, =const_18
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_19
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: % ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Salvando resultado final da Linha 10 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 11 ======
    @ --- Empilhando numero: 3.5 ---
    ldr r0, =const_20
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_21
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 11 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 12 ======
    @ --- Empilhando numero: 4.2 ---
    ldr r0, =const_22
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 1.8 ---
    ldr r0, =const_23
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 12 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 13 ======
    @ --- Empilhando numero: 7.0 ---
    ldr r0, =const_24
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_25
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 13 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 14 ======
    @ --- Empilhando numero: 10.5 ---
    ldr r0, =const_26
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_27
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 14 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 15 ======
    @ --- Empilhando numero: 8.1 ---
    ldr r0, =const_28
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 1.1 ---
    ldr r0, =const_29
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: - ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vsub.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 15 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 16 ======
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_30
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_31
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 4 ---
    ldr r0, =const_32
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 16 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 17 ======
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_33
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 1 ---
    ldr r0, =const_34
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: - ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vsub.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_35
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: ^ ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Salvando resultado final da Linha 17 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 18 ======
    @ --- Empilhando numero: 9 ---
    ldr r0, =const_36
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_37
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_38
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 18 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 19 ======
    @ --- Empilhando numero: 6 ---
    ldr r0, =const_39
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_40
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_41
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 19 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 20 ======
    @ --- Empilhando numero: 8 ---
    ldr r0, =const_42
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 4 ---
    ldr r0, =const_43
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: - ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vsub.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_44
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 20 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 21 ======
    @ --- Empilhando numero: 10 ---
    ldr r0, =const_45
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Gravando na variavel MEM ---
    vpop {d0}               @ Puxa o valor do topo
    ldr r0, =var_MEM @ Pega o endereco da variavel
    vstr.f64 d0, [r0]       @ Salva na memoria
    vpush {d0}              @ Devolve pra pilha pra continuar
    @ --- Salvando resultado final da Linha 21 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 22 ======
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_46
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 22 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 23 ======
    @ --- Empilhando numero: 8 ---
    ldr r0, =const_47
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 23 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 24 ======
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_48
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_49
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 24 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 25 ======
    @ --- Empilhando numero: 7 ---
    ldr r0, =const_50
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_51
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 25 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 26 ======
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_52
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_53
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 4 ---
    ldr r0, =const_54
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Gravando na variavel RESULTADO ---
    vpop {d0}               @ Puxa o valor do topo
    ldr r0, =var_RESULTADO @ Pega o endereco da variavel
    vstr.f64 d0, [r0]       @ Salva na memoria
    vpush {d0}              @ Devolve pra pilha pra continuar
    @ --- Salvando resultado final da Linha 26 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 27 ======
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_55
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 1 ---
    ldr r0, =const_56
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: - ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vsub.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_57
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: ^ ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Gravando na variavel RESULTADO ---
    vpop {d0}               @ Puxa o valor do topo
    ldr r0, =var_RESULTADO @ Pega o endereco da variavel
    vstr.f64 d0, [r0]       @ Salva na memoria
    vpush {d0}              @ Devolve pra pilha pra continuar
    @ --- Salvando resultado final da Linha 27 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 28 ======
    @ --- Empilhando numero: 9 ---
    ldr r0, =const_58
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_59
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_60
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Gravando na variavel RESULTADO ---
    vpop {d0}               @ Puxa o valor do topo
    ldr r0, =var_RESULTADO @ Pega o endereco da variavel
    vstr.f64 d0, [r0]       @ Salva na memoria
    vpush {d0}              @ Devolve pra pilha pra continuar
    @ --- Salvando resultado final da Linha 28 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 29 ======
    @ --- Empilhando numero: 6 ---
    ldr r0, =const_61
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_62
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_63
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Gravando na variavel RESULTADO ---
    vpop {d0}               @ Puxa o valor do topo
    ldr r0, =var_RESULTADO @ Pega o endereco da variavel
    vstr.f64 d0, [r0]       @ Salva na memoria
    vpush {d0}              @ Devolve pra pilha pra continuar
    @ --- Salvando resultado final da Linha 29 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 30 ======
    @ --- Empilhando numero: 8 ---
    ldr r0, =const_64
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 4 ---
    ldr r0, =const_65
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: - ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vsub.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_66
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Gravando na variavel RESULTADO ---
    vpop {d0}               @ Puxa o valor do topo
    ldr r0, =var_RESULTADO @ Pega o endereco da variavel
    vstr.f64 d0, [r0]       @ Salva na memoria
    vpush {d0}              @ Devolve pra pilha pra continuar
    @ --- Salvando resultado final da Linha 30 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 31 ======
    @ --- Empilhando numero: 1 ---
    ldr r0, =const_67
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_68
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_69
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 4 ---
    ldr r0, =const_70
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 31 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 32 ======
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_71
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_72
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 4 ---
    ldr r0, =const_73
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_74
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 32 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 33 ======
    @ --- Empilhando numero: 100 ---
    ldr r0, =const_75
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_76
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_77
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 33 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 34 ======
    @ --- Empilhando numero: 9 ---
    ldr r0, =const_78
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_79
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: ^ ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_80
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: ^ ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Salvando resultado final da Linha 34 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 35 ======
    @ --- Empilhando numero: 50 ---
    ldr r0, =const_81
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_82
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: % ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_83
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 35 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 36 ======
    @ --- Empilhando numero: 1.1 ---
    ldr r0, =const_84
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2.2 ---
    ldr r0, =const_85
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 36 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 37 ======
    @ --- Empilhando numero: 3.3 ---
    ldr r0, =const_86
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 1.1 ---
    ldr r0, =const_87
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: - ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vsub.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 37 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 38 ======
    @ --- Empilhando numero: 4.4 ---
    ldr r0, =const_88
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_89
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 38 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 39 ======
    @ --- Empilhando numero: 5.5 ---
    ldr r0, =const_90
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_91
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 39 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 40 ======
    @ --- Empilhando numero: 6.6 ---
    ldr r0, =const_92
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_93
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: ^ ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Salvando resultado final da Linha 40 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 41 ======
    @ --- Empilhando numero: 10 ---
    ldr r0, =const_94
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_95
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_96
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 41 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 42 ======
    @ --- Empilhando numero: 20 ---
    ldr r0, =const_97
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_98
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: - ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vsub.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_99
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 42 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 43 ======
    @ --- Empilhando numero: 30 ---
    ldr r0, =const_100
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_101
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_102
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 43 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 44 ======
    @ --- Empilhando numero: 40 ---
    ldr r0, =const_103
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 8 ---
    ldr r0, =const_104
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_105
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: - ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vsub.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 44 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 45 ======
    @ --- Empilhando numero: 50 ---
    ldr r0, =const_106
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 7 ---
    ldr r0, =const_107
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: % ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Empilhando numero: 4 ---
    ldr r0, =const_108
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 45 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 46 ======
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_109
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_110
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_111
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_112
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 46 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 47 ======
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_113
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_114
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_115
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_116
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 47 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 48 ======
    @ --- Empilhando numero: 4 ---
    ldr r0, =const_117
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_118
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_119
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_120
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 48 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 49 ======
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_121
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_122
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: ^ ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_123
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: ^ ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_124
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: ^ ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Salvando resultado final da Linha 49 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 50 ======
    @ --- Empilhando numero: 6 ---
    ldr r0, =const_125
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_126
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: % ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Empilhando numero: 4 ---
    ldr r0, =const_127
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: % ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_128
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: % ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Salvando resultado final da Linha 50 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 51 ======
    @ --- Empilhando numero: 1 ---
    ldr r0, =const_129
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_130
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_131
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 51 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 52 ======
    @ --- Empilhando numero: 4 ---
    ldr r0, =const_132
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_133
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 6 ---
    ldr r0, =const_134
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 52 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 53 ======
    @ --- Empilhando numero: 7 ---
    ldr r0, =const_135
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 8 ---
    ldr r0, =const_136
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 9 ---
    ldr r0, =const_137
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 53 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 54 ======
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_138
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_139
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 4 ---
    ldr r0, =const_140
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: ^ ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 54 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 55 ======
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_141
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 6 ---
    ldr r0, =const_142
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 7 ---
    ldr r0, =const_143
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: - ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vsub.f64 d2, d1, d0
    vpush {d2}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 55 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 56 ======
    @ --- Empilhando numero: 100 ---
    ldr r0, =const_144
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 56 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 57 ======
    @ --- Empilhando numero: 200 ---
    ldr r0, =const_145
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: - ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vsub.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 57 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 58 ======
    @ --- Empilhando numero: 300 ---
    ldr r0, =const_146
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 58 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 59 ======
    @ --- Empilhando numero: 400 ---
    ldr r0, =const_147
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 59 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 60 ======
    @ --- Empilhando numero: 500 ---
    ldr r0, =const_148
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: % ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Salvando resultado final da Linha 60 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 61 ======
    @ --- Empilhando numero: 9 ---
    ldr r0, =const_149
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_150
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 61 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 62 ======
    @ --- Empilhando numero: 8 ---
    ldr r0, =const_151
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_152
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 62 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 63 ======
    @ --- Empilhando numero: 7 ---
    ldr r0, =const_153
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 1 ---
    ldr r0, =const_154
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: - ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vsub.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 63 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 64 ======
    @ --- Empilhando numero: 6 ---
    ldr r0, =const_155
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_156
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 64 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 65 ======
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_157
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_158
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: ^ ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Salvando resultado final da Linha 65 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 66 ======
    @ --- Empilhando numero: 1 ---
    ldr r0, =const_159
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_160
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Lendo da variavel MEM ---
    ldr r0, =var_MEM
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Salvando resultado final da Linha 66 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 67 ======
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_161
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 4 ---
    ldr r0, =const_162
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 67 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 68 ======
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_163
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 6 ---
    ldr r0, =const_164
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: - ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vsub.f64 d2, d1, d0
    vpush {d2}
    @ --- Lendo da variavel MEM ---
    ldr r0, =var_MEM
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Salvando resultado final da Linha 68 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 69 ======
    @ --- Empilhando numero: 7 ---
    ldr r0, =const_165
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 8 ---
    ldr r0, =const_166
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: / ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vdiv.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 69 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 70 ======
    @ --- Empilhando numero: 2 ---
    ldr r0, =const_167
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Empilhando numero: 3 ---
    ldr r0, =const_168
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: ^ ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vpush {d2}
    @ --- Lendo da variavel MEM ---
    ldr r0, =var_MEM
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Salvando resultado final da Linha 70 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 71 ======
    @ --- Empilhando numero: 10 ---
    ldr r0, =const_169
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Salvando resultado final da Linha 71 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 72 ======
    @ --- Empilhando numero: 3.14 ---
    ldr r0, =const_170
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Salvando resultado final da Linha 72 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 73 ======
    @ --- Lendo da variavel MEM ---
    ldr r0, =var_MEM
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Salvando resultado final da Linha 73 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 74 ======
    @ --- Salvando resultado final da Linha 74 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 75 ======
    @ --- Empilhando numero: 5 ---
    ldr r0, =const_171
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Salvando resultado final da Linha 75 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 76 ======
    @ --- Empilhando numero: 50 ---
    ldr r0, =const_172
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Gravando na variavel VARA ---
    vpop {d0}               @ Puxa o valor do topo
    ldr r0, =var_VARA @ Pega o endereco da variavel
    vstr.f64 d0, [r0]       @ Salva na memoria
    vpush {d0}              @ Devolve pra pilha pra continuar
    @ --- Lendo da variavel VALOR_GRAVADO ---
    ldr r0, =var_VALOR_GRAVADO
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Salvando resultado final da Linha 76 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 77 ======
    @ --- Empilhando numero: 10 ---
    ldr r0, =const_173
    vldr.f64 d0, [r0]
    vpush {d0}
    @ --- Operacao: + ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vadd.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 77 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ ====== PROCESSANDO LINHA 78 ======
    @ --- Operacao: * ---
    vpop {d0, d1}  @ d0 = op2 (topo), d1 = op1 (sub-topo)
    vmul.f64 d2, d1, d0
    vpush {d2}
    @ --- Salvando resultado final da Linha 78 no historico (RES) ---
    vpop {d0}
    ldr r0, =var_res
    vstr.f64 d0, [r0]
    vpush {d0}   @ Devolve pro topo

    @ --- Fim da execucao de todo o arquivo ---
_stop:
    b _stop         @ Loop infinito para segurar a execucao no Cpulator
