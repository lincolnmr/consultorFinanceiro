quantia_poupada(21000).
ganhos(25000, estavel).
dependentes(2).
pussui_conta_em_Corretora('Sim').
pussui_conta_em_exchange('Sim').

/* Moderado, Arriscado, Conservador */
tipo_investidor('Arriscado').

poupanca_min(K, Y):- K is Y * 5000.
conta_poupanca(adequada):- quantia_poupada(X), dependentes(Y), poupanca_min(K, Y), X > K.
conta_poupanca(inadequada):- quantia_poupada(X), dependentes(Y), poupanca_min(K, Y), X < K.
conta_corretora(possui):- pussui_conta_em_Corretora('Sim').
conta_exchange(possui):- pussui_conta_em_exchange('Sim').

nivel_investidor(arriscado):- tipo_investidor('Arriscado').
nivel_investidor(moderado):- tipo_investidor('Moderado').
nivel_investidor(conservador):- tipo_investidor('Conservador').

renda_min(K, Y):- K is 15000 + (4000 * Y).
renda(adequada):- ganhos(X, estavel), dependentes(Y), renda_min(K, Y), X > K.
renda(inadequada):- ganhos(X, estavel), dependentes(Y), renda_min(K, Y), X < K.

investimento(poupanca):- conta_poupanca(inadequada), nivel_investidor(conservador).
investimento(acoes):- conta_poupanca(adequada), renda(adequada), conta_corretora(possui),  ( nivel_investidor(moderado) ; nivel_investidor(arriscado) ).
investimento(cdb):- conta_poupanca(adequada), renda(inadequada).
investimento(tesouroDireto):- conta_poupanca(adequada), renda(adequada), conta_corretora(possui), nivel_investidor(conservador) .
investimento(bitcoin):- conta_exchange(possui), conta_poupanca(adequada),  renda(adequada), nivel_investidor(arriscado).
investimento(fundosImobiliarios):- conta_corretora(possui), conta_poupanca(adequada),  renda(adequada), nivel_investidor(moderado).