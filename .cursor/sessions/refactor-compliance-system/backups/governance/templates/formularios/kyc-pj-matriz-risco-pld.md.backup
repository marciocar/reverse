---
title: "Formulário: KYC Pessoa Jurídica + Matriz de Risco PLD/FT"
version: "1.0"
effective_date: "2025-01-15"
document_type: "Formulário Google Forms + Planilha Automatizada"
purpose: "Onboarding de FORNECEDORES e PARCEIROS PJ"
compliance: "Lei 9.613/1998, Resolução COAF 40/2021"
---

# FORMULÁRIO: KYC PESSOA JURÍDICA + MATRIZ DE RISCO PLD/FT

**GRANAAI - INFRATECH DE RECEBÍVEIS**

---

## ⚠️ CONTEXTO DE NEGÓCIO DO GRANAAI

### **Quem precisa preencher este KYC?**

✅ **FORNECEDORES** do Granaai (serviços de TI, consultorias, etc.)  
✅ **PARCEIROS COMERCIAIS** (não registradoras)  
✅ **OUTROS TERCEIROS** com relacionamento comercial

❌ **CREDORES NÃO PREENCHEM** este formulário

**Por quê?**  
O Granaai é uma **infratech que conecta credores às 4 registradoras brasileiras**. O **KYC dos credores é executado pelas próprias registradoras**, que fazem due diligence completa e liberam chaves de integração após aprovação. O Granaai **não executa KYC direto dos credores** - esse processo é responsabilidade das registradoras, conforme regulação.

**📚 Contexto:** [Modelo de Negócio Granaai](../../../../business-context/business-model.md)

---

## 📋 OBJETIVO

Este formulário combinado serve para:

1. **Coleta KYC** (Know Your Customer) - Identificação completa de **fornecedores e parceiros PJ**
2. **Avaliação automática de risco PLD/FT** - Matriz com score automatizado
3. **Decisão de onboarding** - Aprovação/Rejeição/Análise Aprofundada de **terceiros** (não credores)

**📋 Referências:**
- [Política PLD/FT](../../aml-policy.md)
- [Procedimentos KYC - Anexo I](../../aml-policy.md#anexo-i-formulário-kyc-pessoa-jurídica)
- [Matriz de Risco - Anexo II](../../aml-policy.md#anexo-ii-matriz-de-risco-pldft)

---

## 🔄 FLUXO DE USO

```
1. Cliente preenche formulário Google Forms → 
2. Dados salvos em Google Sheets → 
3. Planilha calcula score automaticamente (Fórmulas) → 
4. Classificação: 🟢 Baixo | 🟡 Médio | 🔴 Alto → 
5. Notificação para Compliance → 
6. Decisão de onboarding
```

---

## 🔹 PARTE 1: FORMULÁRIO GOOGLE FORMS (KYC)

---

### **SEÇÃO 1: IDENTIFICAÇÃO DA EMPRESA**

**[Texto curto - Obrigatório]**  
**Razão Social:**

---

**[Texto curto]**  
**Nome Fantasia:**

---

**[Texto curto - Obrigatório]**  
**CNPJ:**  
*Validação: Formato XX.XXX.XXX/XXXX-XX*

---

**[Data - Obrigatório]**  
**Data de Constituição:**

---

**[Texto curto]**  
**Inscrição Estadual:**

---

**[Texto curto]**  
**Inscrição Municipal:**

---

**[Múltipla escolha - Obrigatório]**  
**Porte da Empresa:**
- [ ] MEI (Microempreendedor Individual)
- [ ] ME (Microempresa - Faturamento até R$ 360k/ano)
- [ ] EPP (Pequena Empresa - Faturamento R$ 360k - R$ 4,8mi/ano)
- [ ] Média Empresa (Faturamento R$ 4,8mi - R$ 300mi/ano)
- [ ] Grande Empresa (Faturamento > R$ 300mi/ano)

---

**[Múltipla escolha - Obrigatório]**  
**Natureza Jurídica:**
- [ ] EIRELI (Empresa Individual de Responsabilidade Limitada)
- [ ] Ltda. (Sociedade Limitada)
- [ ] S.A. (Sociedade Anônima)
- [ ] MEI
- [ ] EI (Empresário Individual)
- [ ] Cooperativa
- [ ] Associação
- [ ] Fundação
- [ ] Outro: _____

---

### **SEÇÃO 2: ENDEREÇO DA SEDE**

**[Texto curto - Obrigatório]**  
**CEP:**

---

**[Texto curto - Obrigatório]**  
**Logradouro (Rua/Av):**

---

**[Texto curto - Obrigatório]**  
**Número:**

---

**[Texto curto]**  
**Complemento:**

---

**[Texto curto - Obrigatório]**  
**Bairro:**

---

**[Texto curto - Obrigatório]**  
**Cidade:**

---

**[Múltipla escolha - Obrigatório]**  
**Estado:**  
*[Lista de todos os estados brasileiros]*

---

### **SEÇÃO 3: CONTATOS**

**[Texto curto - Obrigatório]**  
**Telefone Principal:**  
*Formato: (XX) XXXXX-XXXX*

---

**[Texto curto]**  
**Telefone Alternativo:**

---

**[E-mail - Obrigatório]**  
**E-mail Principal:**

---

**[Texto curto]**  
**Website:**

---

### **SEÇÃO 4: ATIVIDADE ECONÔMICA**

**[Texto curto - Obrigatório]**  
**CNAE Principal:**  
*Código + Descrição*

---

**[Parágrafo]**  
**CNAEs Secundários:**  
*Liste códigos + descrições*

---

**[Parágrafo - Obrigatório]**  
**Descrição da Atividade Principal:**  
*Descreva em detalhes o que a empresa faz*

---

**[Múltipla escolha - Obrigatório]**  
**Setor de Atuação:**
- [ ] Comércio Varejista
- [ ] Comércio Atacadista
- [ ] Indústria/Manufatura
- [ ] Serviços Profissionais
- [ ] Tecnologia/Software
- [ ] Saúde
- [ ] Educação
- [ ] Construção Civil
- [ ] Transportes e Logística
- [ ] Alimentos e Bebidas
- [ ] Agronegócio
- [ ] Financeiro (banco, fintech, corretora)
- [ ] Imobiliário
- [ ] Turismo e Hotelaria
- [ ] Outro: _____

---

**[Múltipla escolha - Obrigatório]**  
**Faturamento Anual Estimado:**
- [ ] Até R$ 360 mil
- [ ] R$ 360 mil - R$ 1 milhão
- [ ] R$ 1 milhão - R$ 4,8 milhões
- [ ] R$ 4,8 milhões - R$ 10 milhões
- [ ] R$ 10 milhões - R$ 50 milhões
- [ ] Acima de R$ 50 milhões

---

### **SEÇÃO 5: SÓCIOS / ADMINISTRADORES (Quadro Societário)**

**[Informação]**  
Liste TODOS os sócios e administradores com participação ≥ 10% ou que tenham poderes de administração.

---

**[Texto - Repetível]**  
Para cada sócio/administrador, forneça:

**Sócio/Administrador 1:**

---

**[Texto curto - Obrigatório]**  
**Nome Completo:**

---

**[Texto curto - Obrigatório]**  
**CPF:**

---

**[Data - Obrigatório]**  
**Data de Nascimento:**

---

**[Múltipla escolha - Obrigatório]**  
**Papel:**
- [ ] Sócio Administrador
- [ ] Sócio (sem poderes de administração)
- [ ] Administrador (não sócio)

---

**[Texto curto - Obrigatório]**  
**Percentual de participação:**  
*Formato: XX,XX%*

---

**[Múltipla escolha - Obrigatório]**  
**Pessoa Politicamente Exposta (PPE)?**
- [ ] Sim
- [ ] Não
- [ ] Não sei / Preciso verificar

**[Se SIM]** 🔽

---

**[Parágrafo - Condicional]**  
**Detalhe a condição de PPE:**  
*Cargo/função que configura PPE*

---

**[Texto curto - Obrigatório]**  
**Nacionalidade:**

---

**[Múltipla escolha]**  
**Reside no Brasil?**
- [ ] Sim
- [ ] Não

---

**[Parágrafo]**  
**Endereço Completo:**

---

**[Botão]**  
➕ **Adicionar outro sócio/administrador**

---

### **SEÇÃO 6: BENEFICIÁRIO FINAL (BENEFICIAL OWNER)**

**[Informação]**  
Beneficiário Final = Pessoa física que, em última instância, de forma direta ou indireta, possui, controla ou beneficia-se de ≥ 25% do capital social ou exerce controle da empresa.

**📋 Referência:** [Política PLD - Seção 3.9](../../aml-policy.md#39-identificação-de-beneficiário-final-beneficial-owner)

---

**[Múltipla escolha - Obrigatório]**  
**Os sócios listados acima são os beneficiários finais?**
- [ ] Sim, os sócios são pessoas físicas e beneficiários finais
- [ ] Não, há estrutura societária complexa (holding, fundos, etc.)
- [ ] Não sei / Preciso verificar

**[Se NÃO]** 🔽

---

**[Parágrafo - Condicional]**  
**Descreva a estrutura societária:**  
*Identifique as pessoas físicas que controlam/beneficiam-se da empresa*

---

**[Arquivo - Condicional]**  
**Upload de Contrato Social ou Estrutura Societária (PDF):**

---

### **SEÇÃO 7: INFORMAÇÕES FINANCEIRAS E OPERACIONAIS**

**[Múltipla escolha - Obrigatório]**  
**Volume Mensal Estimado de Transações com Granaai:**
- [ ] Até R$ 50 mil/mês
- [ ] R$ 50 mil - R$ 200 mil/mês
- [ ] R$ 200 mil - R$ 500 mil/mês
- [ ] R$ 500 mil - R$ 1 milhão/mês
- [ ] Acima de R$ 1 milhão/mês

---

**[Parágrafo - Obrigatório]**  
**Origem dos Recursos:**  
*De onde vem o dinheiro que será transacionado? (vendas, recebíveis, investimento, etc.)*

---

**[Múltipla escolha - Obrigatório]**  
**Opera com clientes internacionais?**
- [ ] Sim, frequentemente
- [ ] Sim, ocasionalmente
- [ ] Não
- [ ] Planeja operar futuramente

**[Se SIM]** 🔽

---

**[Parágrafo - Condicional]**  
**Liste os principais países:**

---

**[Múltipla escolha]**  
**Utiliza contas bancárias no exterior?**
- [ ] Sim
- [ ] Não

---

### **SEÇÃO 8: DEVIDO DILIGENCE - FATORES DE RISCO**

**[Informação]**  
As perguntas abaixo ajudam a avaliar o risco PLD/FT do cliente.

---

**[Múltipla escolha - Obrigatório]**  
**8.1 A empresa já sofreu investigação, processo ou condenação por lavagem de dinheiro, corrupção ou fraude?**
- [ ] Sim
- [ ] Não
- [ ] Não sei

**[Se SIM]** 🔽

---

**[Parágrafo - Condicional]**  
**Detalhe:**

---

**[Múltipla escolha - Obrigatório]**  
**8.2 Algum sócio/administrador consta em listas restritivas (OFAC, ONU, PEPs)?**
- [ ] Sim
- [ ] Não
- [ ] Não sei / Preciso verificar

---

**[Múltipla escolha - Obrigatório]**  
**8.3 A empresa opera em setores de alto risco?**  
*Ex: Câmbio, criptomoedas, cassinos, joias, arte, comércio exterior, negociação de imóveis*
- [ ] Sim
- [ ] Não
- [ ] Não tenho certeza

---

**[Múltipla escolha - Obrigatório]**  
**8.4 A empresa possui estrutura societária complexa ou opaca?**  
*Ex: Múltiplas holdings, offshores, trustees, estruturas fiduciárias*
- [ ] Sim
- [ ] Não

---

**[Múltipla escolha - Obrigatório]**  
**8.5 Há transações frequentes com países de alto risco PLD/FT?**  
*Conforme FATF/GAFI (Afeganistão, Coreia do Norte, Irã, Myanmar, etc.)*
- [ ] Sim
- [ ] Não
- [ ] Não sei

---

### **SEÇÃO 9: DOCUMENTAÇÃO OBRIGATÓRIA**

**[Informação]**  
Anexe os seguintes documentos (todos obrigatórios):

---

**[Upload de arquivo - Obrigatório]**  
**1. Contrato Social / Estatuto Social (última alteração):**  
*Formato: PDF*

---

**[Upload de arquivo - Obrigatório]**  
**2. Cartão CNPJ (atualizado - emitido pela Receita Federal):**  
*Formato: PDF*

---

**[Upload de arquivo - Obrigatório]**  
**3. Comprovante de Endereço da Empresa (até 90 dias):**  
*Conta de luz, água, telefone, contrato de locação*

---

**[Upload de arquivo - Obrigatório]**  
**4. Documento de identidade (RG ou CNH) de TODOS os sócios/administradores:**  
*Pode ser um arquivo ZIP com múltiplos documentos*

---

**[Upload de arquivo - Obrigatório]**  
**5. CPF de TODOS os sócios/administradores:**

---

**[Upload de arquivo]**  
**6. Comprovante de Faturamento/Demonstrativo Financeiro (opcional para ME/EPP, obrigatório para >R$ 4,8mi/ano):**

---

**[Upload de arquivo]**  
**7. Referências Bancárias ou Comerciais (opcional):**

---

### **SEÇÃO 10: TIPO DE RELACIONAMENTO**

**[Múltipla escolha - Obrigatório]**  
**Tipo de relacionamento com o Granaai:**
- [ ] Fornecedor de Serviços de TI
- [ ] Fornecedor de Consultoria
- [ ] Fornecedor de Infraestrutura (cloud, servidores, etc.)
- [ ] Parceiro Comercial
- [ ] Prestador de Serviços Gerais
- [ ] Outro: _____

**⚠️ Nota:** Se você é um **credor** buscando integração com registradoras, o KYC é realizado diretamente pelas registradoras. Entre em contato com suporte@grana.ai para mais informações.

---

### **SEÇÃO 11: DECLARAÇÕES**

**[Informação - Texto fixo]**

A empresa declara que:

1. ✅ Todas as informações fornecidas são **verdadeiras, completas e atualizadas**.

2. ✅ **Não está envolvida** em atividades ilícitas, lavagem de dinheiro, financiamento ao terrorismo ou corrupção.

3. ✅ **Não consta** em listas restritivas nacionais ou internacionais (OFAC, ONU, COAF, etc.).

4. ✅ Compromete-se a **atualizar** as informações caso haja mudanças relevantes (alteração de sócios, endereço, atividade, etc.).

5. ✅ Autoriza o Granaai a:
   - Consultar bancos de dados públicos e privados para verificação cadastral
   - Realizar monitoramento contínuo conforme Política PLD/FT
   - Comunicar operações suspeitas ao COAF (sem comunicação ao cliente - Lei 9.613/1998)

6. ✅ Está ciente de que a **falsidade ou omissão** de informações pode resultar em:
   - Recusa de relacionamento comercial
   - Encerramento de conta/contrato
   - Comunicação ao COAF
   - Responsabilização civil e criminal

**📋 Referências:**
- [Política PLD/FT](../../aml-policy.md)
- [Código de Conduta](../../code-of-conduct.md)
- [Lei 9.613/1998](http://www.planalto.gov.br/ccivil_03/leis/l9613.htm)
- [Resolução COAF 40/2021](https://www.gov.br/coaf/)

---

**[Caixa de seleção - Obrigatório]**  
☐ **Confirmo que li, compreendo e concordo com as declarações acima**

---

**[Texto curto - Obrigatório]**  
**Nome Completo do Representante Legal:**

---

**[Texto curto - Obrigatório]**  
**CPF do Representante Legal:**

---

**[Texto curto - Obrigatório]**  
**Cargo do Representante Legal:**

---

**[Data - Obrigatório]**  
**Data de Preenchimento:**

---

**[Botão de Envio]**  
🚀 **ENVIAR CADASTRO KYC**

---

## 📊 PARTE 2: MATRIZ DE RISCO AUTOMATIZADA (GOOGLE SHEETS)

### **Estrutura da Planilha**

A planilha recebe automaticamente os dados do Google Forms e calcula o score de risco.

**Colunas:**

| Coluna | Conteúdo | Fonte |
|--------|----------|-------|
| A-Z | Dados do formulário | Google Forms |
| AA | **SCORE TOTAL** | Fórmula automatizada |
| AB | **CLASSIFICAÇÃO** | Fórmula (Baixo/Médio/Alto) |
| AC | **DECISÃO** | Fórmula (Aprovar/Rejeitar/Análise) |
| AD | **OBSERVAÇÕES** | Manual (Compliance) |
| AE | **STATUS** | Manual (Pendente/Aprovado/Rejeitado) |

---

### **FÓRMULAS DE CÁLCULO**

**📋 Referência:** [Matriz de Risco PLD - Anexo II](../../aml-policy.md#anexo-ii-matriz-de-risco-pldft)

**Fatores de Risco (7 critérios):**

#### **1. Porte da Empresa (Coluna F)**
```
=IF(F2="MEI",0,IF(F2="ME",1,IF(F2="EPP",2,IF(F2="Média Empresa",3,5))))
```
- MEI: 0 pontos
- ME: 1 ponto
- EPP: 2 pontos
- Média: 3 pontos
- Grande: 5 pontos

#### **2. Setor de Atuação (Coluna V)**
```
=IF(OR(V2="Financeiro",V2="Câmbio",V2="Criptomoedas"),5,
  IF(OR(V2="Imobiliário",V2="Joias",V2="Cassinos"),4,
  IF(OR(V2="Comércio Atacadista",V2="Transportes"),2,1)))
```
- Alto risco (Financeiro, Câmbio, Cripto): 5 pontos
- Médio-alto (Imobiliário, Joias): 4 pontos
- Médio (Atacado, Transportes): 2 pontos
- Baixo (demais): 1 ponto

#### **3. Localização Geográfica (Coluna O - Estado)**
```
=IF(OR(O2="SP",O2="RJ",O2="MG",O2="RS",O2="PR"),0,
  IF(OR(O2="AC",O2="RR",O2="AP",O2="TO"),3,1))
```
- Estados principais (SP, RJ, MG, RS, PR): 0 pontos
- Estados de fronteira (AC, RR, AP, TO): 3 pontos
- Demais: 1 ponto

#### **4. Volume de Transações (Coluna AB)**
```
=IF(AB2="Até R$ 50 mil/mês",0,
  IF(AB2="R$ 50 mil - R$ 200 mil/mês",1,
  IF(AB2="R$ 200 mil - R$ 500 mil/mês",2,
  IF(AB2="R$ 500 mil - R$ 1 milhão/mês",3,5))))
```
- Até R$ 50k: 0 pontos
- R$ 50k-200k: 1 ponto
- R$ 200k-500k: 2 pontos
- R$ 500k-1mi: 3 pontos
- > R$ 1mi: 5 pontos

#### **5. PPE (Pessoa Politicamente Exposta) (Coluna AM)**
```
=IF(AM2="Sim",10,0)
```
- Sim: 10 pontos (CRÍTICO)
- Não: 0 pontos

#### **6. Operações Internacionais (Coluna AE)**
```
=IF(AE2="Sim, frequentemente",4,
  IF(AE2="Sim, ocasionalmente",2,0))
```
- Sim, frequente: 4 pontos
- Sim, ocasional: 2 pontos
- Não: 0 pontos

#### **7. Histórico Negativo (Coluna AJ - pergunta 8.1)**
```
=IF(AJ2="Sim",15,0)
```
- Sim: 15 pontos (CRÍTICO)
- Não: 0 pontos

---

### **SCORE TOTAL (Coluna AA)**
```
=SUM([fator1]+[fator2]+[fator3]+[fator4]+[fator5]+[fator6]+[fator7])
```

---

### **CLASSIFICAÇÃO (Coluna AB)**
```
=IF(AA2<=5,"🟢 BAIXO",
  IF(AA2<=15,"🟡 MÉDIO",
  "🔴 ALTO"))
```

**Faixas:**
- **🟢 Baixo**: 0-5 pontos
- **🟡 Médio**: 6-15 pontos
- **🔴 Alto**: 16+ pontos

---

### **DECISÃO AUTOMATIZADA (Coluna AC)**
```
=IF(AA2<=5,"✅ APROVAR AUTOMATICAMENTE",
  IF(AA2<=10,"⚠️ ANÁLISE COMPLIANCE",
  IF(AA2<=15,"⚠️ ANÁLISE APROFUNDADA (CISO)",
  "🚫 REJEITAR OU ESCALAÇÃO CEO")))
```

**Regras:**
- **0-5 pontos**: Aprovação automática (risco baixo)
- **6-10 pontos**: Análise Compliance (48h)
- **11-15 pontos**: Análise aprofundada CISO (5 dias úteis)
- **16+ pontos**: Rejeição ou escalação CEO

---

### **TRIGGERS AUTOMÁTICOS (CRÍTICOS)**

Independente do score, **REJEITAR ou ESCALAR** se:

- ❌ PPE não declarado ou ocultado
- ❌ Histórico de investigação/condenação PLD/corrupção
- ❌ Consta em listas restritivas (OFAC, ONU)
- ❌ Documentação fraudulenta ou incompleta
- ❌ Recusa em fornecer beneficiário final
- ❌ Estrutura societária offshore em paraíso fiscal

---

## 📈 GESTÃO E MONITORAMENTO

### **Responsabilidades:**

| Atividade | Responsável | Prazo |
|-----------|-------------|-------|
| Envio do formulário | Cliente (com suporte CS) | Onboarding |
| Análise automática (Baixo risco) | Sistema | Imediato |
| Análise Médio risco | Compliance | 48h |
| Análise Alto risco | CISO + Compliance | 5 dias úteis |
| Decisão final (>15 pontos) | CEO + CISO | 10 dias úteis |
| Atualização cadastral | CS + Compliance | Anual |

### **Armazenamento:**

- **Google Forms**: Coleta
- **Google Sheets**: Score + análise
- **Sistema CRM**: Registro aprovação/rejeição
- **Arquivos físicos/digitais**: Documentos (10 anos)

---

## 📚 RECURSOS ADICIONAIS

- [Política PLD/FT](../../aml-policy.md)
- [Procedimentos KYC](../../aml-policy.md#3-procedimentos-kyc-know-your-customer)
- [Matriz de Risco](../../aml-policy.md#anexo-ii-matriz-de-risco-pldft)
- [Listas Restritivas](../../aml-policy.md#36-consulta-a-listas-restritivas)
- [Lei 9.613/1998](http://www.planalto.gov.br/ccivil_03/leis/l9613.htm)
- [Resolução COAF 40/2021](https://www.gov.br/coaf/)

---

**📄 Documento controlado - Revisão semestral**  
**🔒 CONFIDENCIAL - USO INTERNO**

**Granaai © 2025**
