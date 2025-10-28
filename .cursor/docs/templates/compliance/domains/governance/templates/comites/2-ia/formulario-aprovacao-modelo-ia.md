---
title: "Formulário de Aprovação de Modelo de IA"
version: "1.0"
submission_date: "[DD/MM/YYYY]"
owner: "AI Engineer / Tech Lead"
model_name: "[Nome do Modelo]"
classification: "CONFIDENCIAL - USO INTERNO"
---

# Formulário de Aprovação de Modelo de IA

**{{COMPANY_NAME}} - INFRATECH DE RECEBÍVEIS**

> **Objetivo:** Este formulário estrutura a avaliação técnica, ética e regulatória de novos modelos de IA ou mudanças significativas em modelos existentes, fundamentando a decisão do Comitê de IA sobre aprovar ou rejeitar a implementação.

---

## 📋 Instruções de Preenchimento

### **Quando Usar Este Formulário:**

Este formulário deve ser preenchido quando:
1. Proposta de implementação de **novo modelo de IA** (ex: GPT-5, Claude 3, modelo proprietário)
2. **Mudança significativa de versão** de modelo existente (ex: GPT-4 → GPT-4-Turbo)
3. **Novo caso de uso** para modelo já em produção (ex: ChatBot → Credit Scoring)
4. **Mudança crítica** em configuração de modelo (guardrails, knowledge base significativa)

### **Quem Preenche:**

- **AI Engineer / Tech Lead:** Responsável pela proposta (Seções 1-5)
- **CISO:** Revisão de conformidade (Seção 6)
- **Comitê de IA:** Deliberação e aprovação (Seção 7)

### **Processo:**

```
1. AI Engineer preenche Seções 1-5 (Identificação até Análise de Riscos)
2. CISO revisa Seção 6 (Conformidade Regulatória)
3. Jurídico revisa (se necessário) - Seção 6.4
4. Submissão ao Comitê de IA (inclusão na pauta da próxima reunião)
5. Comitê delibera (Seção 7)
6. Se aprovado → Testing obrigatório em staging (1 semana mínima)
7. Rollback plan documentado antes de deploy em produção
```

**Base:** [AI Governance Policy - Change Management](../../ai-governance/ai-governance-policy.md#governança-de-modelos)

---

## SEÇÃO 1: IDENTIFICAÇÃO DO MODELO

### 1.1 Dados Básicos

**Nome do Modelo:** [Ex: "GPT-4-Turbo", "Claude 3 Opus", "Modelo Proprietário Fraud Detection ML"]

**Vendor/Provider:** [Ex: "OpenAI", "Anthropic", "Interno", "Google", "AWS"]

**Versão Específica:** [Ex: "gpt-4-turbo-2024-04-09", "claude-3-opus-20240229"]

**Tipo de Modelo:**
- [ ] LLM (Large Language Model)
- [ ] ML Tradicional (Supervised/Unsupervised)
- [ ] Modelo de Visão Computacional
- [ ] Modelo de Séries Temporais
- [ ] Outro: _______________________________

**Data de Submissão:** [DD/MM/YYYY]

**Submissão #:** [Número sequencial - ex: MOD-001/2025]

---

### 1.2 Contexto da Proposta

**Esta proposta refere-se a:**
- [ ] **Novo Modelo** (primeira implementação)
- [ ] **Upgrade de Versão** (substituir modelo existente)
- [ ] **Novo Caso de Uso** (modelo já em produção, nova aplicação)
- [ ] **Mudança Crítica** (guardrails, configuração, knowledge base)

**Se upgrade de versão, especificar:**
- **Modelo Atual em Produção:** [Nome + Versão]
- **Desde:** [DD/MM/YYYY]
- **Motivo do Upgrade:** [Ex: "Performance degradada", "Nova versão com melhor accuracy", "Fim de suporte do vendor"]

---

## SEÇÃO 2: OBJETIVO E USE CASE

### 2.1 Objetivo de Negócio

**Descrever claramente o objetivo:**

[Ex: "Melhorar accuracy do ChatBot de 88% para >90%, reduzindo escalation rate de 25% para <20%"]

**Problema a Resolver:**

[Ex: "Usuários estão insatisfeitos com respostas genéricas do ChatBot atual, resultando em escalações desnecessárias para atendimento humano"]

---

### 2.2 Use Case Detalhado

**Caso de Uso:** [Ex: "Assistente de Atendimento Nível 1 (ChatBot)"]

**Escopo:**
- Funcionalidades cobertas: [Lista]
- Fora do escopo: [Lista]

**Público-Alvo:**
- Usuários finais: [Descrição - ex: "Credores e estabelecimentos comerciais"]
- Volume esperado: [Ex: "~5.000 interações/mês"]

**Integração:**
- [ ] Sistema existente (especificar): _______________________________
- [ ] Nova aplicação standalone
- [ ] API para terceiros

---

### 2.3 Métricas de Sucesso

**KPIs Esperados (após implementação):**

| Métrica | Baseline Atual | Target Novo Modelo | Melhoria Esperada |
|---------|---------------|-------------------|-------------------|
| **Accuracy Rate** | [%]% | [%]% | +[X]% |
| **User Satisfaction** | [X.X]/5.0 | [X.X]/5.0 | +[X.X] |
| **Escalation Rate** | [%]% | [%]% | -[X]% |
| **Response Time (p95)** | [X.X]s | [X.X]s | -[X.X]s |
| **Custo por Requisição** | R$ [valor] | R$ [valor] | -[X]% / +[X]% |

**Prazo para Atingir Targets:** [Ex: "30 dias após deploy em produção"]

---

## SEÇÃO 3: CHECKLIST TÉCNICO

### 3.1 Qualidade dos Dados

**Dados de Treinamento (se modelo proprietário):**

- [ ] ✅ Dataset curado e validado
- [ ] ✅ Ausência de viés nos dados de treinamento
- [ ] ✅ Conformidade com LGPD (dados anonimizados/pseudonimizados)
- [ ] ✅ Proveniência dos dados documentada
- [ ] ❌ Não aplicável (modelo de terceiro - ex: OpenAI)

**Dados de Inferência (runtime):**

- [ ] ✅ Dados de entrada validados (input validation)
- [ ] ✅ Dados sensíveis filtrados/mascarados
- [ ] ✅ Rate limiting implementado (especificar: [N] requisições/minuto)

---

### 3.2 Métricas de Performance

**Testes Realizados:**

| Métrica | Ambiente de Teste | Resultado | Target | Status |
|---------|------------------|-----------|--------|--------|
| **Accuracy** | [Staging/Lab] | [%]% | >[%]% | ✅/⚠️/❌ |
| **Precision** | [Staging/Lab] | [%]% | >[%]% | ✅/⚠️/❌ |
| **Recall** | [Staging/Lab] | [%]% | >[%]% | ✅/⚠️/❌ |
| **F1-Score** | [Staging/Lab] | [X.XX] | >[X.XX] | ✅/⚠️/❌ |
| **Response Time (p95)** | [Staging/Lab] | [X.X]s | <[X.X]s | ✅/⚠️/❌ |
| **Response Time (p99)** | [Staging/Lab] | [X.X]s | <[X.X]s | ✅/⚠️/❌ |

**Tamanho da Amostra de Teste:** [N] casos

**Comparação com Baseline:**
- Modelo Atual (Baseline): [Nome + Versão] - Accuracy: [%]%
- Modelo Proposto: [Nome + Versão] - Accuracy: [%]%
- **Melhoria:** +[X]%

---

### 3.3 Explicabilidade (XAI - Explainable AI)

**O modelo é explicável/interpretável?**

- [ ] ✅ **Sim - Alta Explicabilidade** (ex: Modelo linear, Decision Tree, LIME/SHAP implementado)
- [ ] ⚠️ **Parcial - Explicabilidade Moderada** (ex: LLM com prompts documentados, RAG com fontes citadas)
- [ ] ❌ **Não - Caixa Preta** (ex: Deep Learning complexo sem interpretabilidade)

**Se "Parcial" ou "Não", descrever mitigação:**

[Ex: "LLM GPT-4 é caixa preta, mas implementamos RAG que cita fontes da knowledge base, permitindo auditabilidade das respostas"]

**Processo de Auditoria:**
- [ ] Logs de decisões do modelo (registrados)
- [ ] Fontes de informação citadas (quando aplicável)
- [ ] Possibilidade de replay de decisões (reproduzibilidade)

---

### 3.4 Fairness e Mitigação de Viés

**Testes de Fairness Realizados:**

| Categoria de Teste | Método | Resultado | Status |
|-------------------|--------|-----------|--------|
| **Viés de Gênero** | [Ex: Scenarios de teste, Fairness metrics] | [Descrição] | ✅ Sem viés / ⚠️ Viés detectado (mitigado) / ❌ Viés crítico |
| **Viés de Raça/Etnia** | [Método] | [Descrição] | ✅/⚠️/❌ |
| **Viés de Idade** | [Método] | [Descrição] | ✅/⚠️/❌ |
| **Viés Socioeconômico** | [Método] | [Descrição] | ✅/⚠️/❌ |
| **Outros Viéses** | [Especificar] | [Descrição] | ✅/⚠️/❌ |

**Se viés detectado, descrever mitigação:**

[Ex: "Viés de gênero leve detectado em respostas sobre crédito. Mitigação: Ajuste de prompts para neutralidade, implementação de filtro de output validation específico para termos de gênero."]

**Processo de Monitoramento Contínuo:**
- [ ] ✅ Automated Bias Detection (diário)
- [ ] ✅ Revisão Humana (semanal - amostragem de [N] casos)
- [ ] ✅ Red Team Testing (mensal)
- [ ] ✅ User Feedback (thumbs up/down)

**Base:** [AI Governance Policy - Mitigação de Viés](../../ai-governance/ai-governance-policy.md#mitigação-de-viés-e-comportamentos-indesejados)

---

### 3.5 Privacidade e Conformidade LGPD

**Dados Pessoais Processados:**

- [ ] ⚠️ **Sim** (descrever quais categorias de dados: CPF, nome, email, etc.)
- [ ] ✅ **Não** (modelo não processa dados pessoais identificáveis)

**Se "Sim", garantias implementadas:**

- [ ] ✅ Dados anonimizados/pseudonimizados antes de processamento
- [ ] ✅ Minimização de dados (apenas essenciais)
- [ ] ✅ Criptografia em trânsito (TLS 1.3)
- [ ] ✅ Criptografia em repouso (AES-256)
- [ ] ✅ Retenção limitada (especificar prazo: [N] dias)
- [ ] ✅ Direitos dos titulares implementados (acesso, exclusão, portabilidade)

**Compartilhamento de Dados com Vendor (ex: OpenAI):**

- [ ] ✅ **NÃO compartilhamos dados de clientes com vendor** (zero data sharing)
- [ ] ⚠️ **Compartilhamos dados anonimizados** (descrever: _____________)
- [ ] ❌ **Compartilhamos dados identificáveis** (ALTO RISCO - justificar: _____________)

**DPA (Data Processing Agreement) com Vendor:**
- [ ] ✅ Assinado e vigente
- [ ] ⏳ Em negociação
- [ ] ❌ Não aplicável (modelo interno)
- [ ] ❌ Não assinado (BLOCKER)

**Compliance LGPD:**
- [ ] ✅ RIPD (Relatório de Impacto à Proteção de Dados) elaborado (se necessário)
- [ ] ✅ DPO revisou e aprovou
- [ ] ✅ Política de Privacidade atualizada (se impacto público)

---

### 3.6 Segurança

**Guardrails Implementados:**

#### **Input Validation:**
- [ ] ✅ Filtro de dados sensíveis (CPF, senhas, cartões)
- [ ] ✅ Proteção contra prompt injection
- [ ] ✅ Filtro de linguagem ofensiva
- [ ] ✅ Validação de escopo (bloquear solicitações fora do escopo)
- [ ] ✅ Sanitização de inputs (SQL injection, XSS, etc.)

**Especificar implementação:** [Ex: "Azure Content Safety API + Regex customizados + LangChain callbacks"]

#### **Output Validation:**
- [ ] ✅ Verificação de conteúdo sensível (remoção/mascaramento)
- [ ] ✅ Checagem de viés (alerta para revisão humana)
- [ ] ✅ Validação de fontes (respostas baseadas apenas em knowledge base autorizada)
- [ ] ✅ Tone check (profissionalismo)

**Especificar implementação:** [Ex: "Custom scripts + Análise de sentimento + Whitelist de fontes"]

#### **Rate Limiting e Abuse Prevention:**
- [ ] ✅ Limite de requisições por usuário: [N] requisições/minuto
- [ ] ✅ Bloqueio temporário após threshold
- [ ] ✅ Alertas de abuse (notificação para AI Engineer)
- [ ] ✅ CAPTCHA (se aplicável)

**Infraestrutura de Segurança:**
- [ ] ✅ Autenticação obrigatória (OAuth2 + JWT)
- [ ] ✅ MFA para admins e engineers
- [ ] ✅ RBAC (Role-Based Access Control) implementado
- [ ] ✅ Logs de auditoria (CloudWatch, ELK, etc.)
- [ ] ✅ Backup e disaster recovery (RTO: [X]h, RPO: [Y]h)

**Vendor Security Compliance:**
- [ ] ✅ Vendor possui SOC 2 Type II (válido até: [DD/MM/YYYY])
- [ ] ✅ Vendor possui ISO 27001 (válido até: [DD/MM/YYYY])
- [ ] ✅ Vendor compliance GDPR/LGPD
- [ ] ⏳ Em processo de certificação
- [ ] ❌ Vendor não certificado (justificar: _____________)

---

## SEÇÃO 4: ANÁLISE DE RISCOS

**Base:** [Matriz de Risco de IA](./matriz-risco-ia.md)

### 4.1 Identificação de Riscos

| Categoria de Risco | Risco Específico | Probabilidade | Impacto | Nível |
|-------------------|-----------------|---------------|---------|-------|
| **Técnico** | [Ex: Drift de performance ao longo do tempo] | [Baixa/Média/Alta] | [Baixo/Médio/Alto] | 🟢/🟡/🔴 |
| **Ético** | [Ex: Viés em decisões] | [Baixa/Média/Alta] | [Baixo/Médio/Alto] | 🟢/🟡/🔴 |
| **Regulatório** | [Ex: Não conformidade LGPD] | [Baixa/Média/Alta] | [Baixo/Médio/Alto] | 🟢/🟡/🔴 |
| **Reputacional** | [Ex: Incidente público de IA] | [Baixa/Média/Alta] | [Baixo/Médio/Alto] | 🟢/🟡/🔴 |
| **Operacional** | [Ex: Downtime do vendor] | [Baixa/Média/Alta] | [Baixo/Médio/Alto] | 🟢/🟡/🔴 |
| **Financeiro** | [Ex: Custo elevado de operação] | [Baixa/Média/Alta] | [Baixo/Médio/Alto] | 🟢/🟡/🔴 |

**Legenda:**
- 🟢 Verde: Risco baixo (aceitável)
- 🟡 Amarelo: Risco médio (mitigação necessária)
- 🔴 Vermelho: Risco alto (blocker se não mitigado)

---

### 4.2 Planos de Mitigação

**Para cada risco Médio (🟡) ou Alto (🔴), descrever mitigação:**

**Risco 1: [Nome do Risco]**
- **Severidade Original:** 🔴 Alta
- **Mitigação:** [Descrição detalhada da ação de mitigação]
- **Responsável:** [Nome + Cargo]
- **Prazo:** [DD/MM/YYYY]
- **Severidade Residual (após mitigação):** 🟡 Média

**Risco 2: [Nome do Risco]**
- [...]

---

### 4.3 Riscos Residuais Aceitáveis

**Após todas as mitigações, riscos que permanecem:**

| Risco Residual | Severidade | Justificativa de Aceitação |
|----------------|-----------|---------------------------|
| [Risco 1] | 🟡 Média | [Ex: "Monitoramento contínuo implementado, impacto controlado"] |
| [Risco 2] | 🟢 Baixa | [Justificativa] |

**Aprovação de Riscos Residuais:** Comitê de IA (Seção 7)

---

## SEÇÃO 5: PLANO DE IMPLEMENTAÇÃO

### 5.1 Testing em Staging

**Ambiente de Staging:**
- [ ] ✅ Ambiente separado de produção (isolado)
- [ ] ✅ Configuração idêntica à produção
- [ ] ✅ Dados de teste representativos (não dados reais de clientes)

**Duração Mínima de Testing:** **1 semana** (conforme [AI Governance Policy - Change Management](../../ai-governance/ai-governance-policy.md#governança-de-modelos))

**Critérios de Sucesso para Passar do Staging:**

| Critério | Target | Como Medir | Go/No-Go |
|----------|--------|------------|----------|
| **Accuracy** | >[%]% | [Metodologia] | [Go/No-Go] |
| **Response Time p95** | <[X.X]s | CloudWatch | [Go/No-Go] |
| **Zero Bias Incidents** | 0 | Red Team Testing | [Go/No-Go] |
| **Zero Security Breaches** | 0 | Pentest + Logs | [Go/No-Go] |
| **User Satisfaction (Beta)** | >[X.X]/5.0 | Feedback Beta Users | [Go/No-Go] |

**Responsável pelo Testing:** [Nome do AI Engineer]

**Data Prevista de Início:** [DD/MM/YYYY]  
**Data Prevista de Conclusão:** [DD/MM/YYYY]

---

### 5.2 Rollback Plan

**⚠️ OBRIGATÓRIO:** Plano de rollback documentado antes de deploy em produção

**Trigger de Rollback:**
- Accuracy cai abaixo de [%]%
- Bias incident crítico
- Security breach
- Downtime prolongado (>[X] minutos)
- User satisfaction cai abaixo de [X.X]/5.0

**Procedimento de Rollback:**

1. **Detecção:** [Como o problema será detectado - ex: "Alertas CloudWatch, User reports"]
2. **Decisão:** [Quem autoriza rollback - ex: "AI Engineer + CTO ou Presidente do Comitê IA"]
3. **Execução:** [Passos técnicos para reverter para versão anterior]
4. **Tempo Estimado de Rollback:** [X] minutos
5. **Comunicação:** [Quem comunicar - ex: "Usuários, CS Team, CEO"]
6. **Post-Mortem:** [Análise obrigatória em até 48h]

**Versão de Rollback (Fallback):**
- Modelo: [Nome + Versão atual em produção]
- Backup disponível: [ ] Sim [ ] Não (BLOCKER)

---

### 5.3 Monitoramento Pós-Deploy

**Monitoramento Intensificado (primeiras 2 semanas):**

- [ ] ✅ **KPIs monitorados diariamente** (em vez de trimestral)
- [ ] ✅ **Revisão humana aumentada:** [N] conversas/dia (em vez de semanal)
- [ ] ✅ **Automated bias detection:** Alertas em tempo real
- [ ] ✅ **Incident response team:** On-call 24/7 (primeira semana)

**Processo de Normalização:**
- Após 2 semanas sem incidentes → Retornar ao monitoramento padrão (trimestral)
- Se incidentes → Manter monitoramento intensificado + análise de causa raiz

**Relatório de Estabilização:**
- **Prazo:** 30 dias após deploy em produção
- **Responsável:** AI Engineer
- **Conteúdo:** Performance real vs esperada, incidentes, lições aprendidas
- **Audiência:** Comitê de IA (próxima reunião ordinária)

---

## SEÇÃO 6: CONFORMIDADE REGULATÓRIA

### 6.1 Compliance LGPD

**Revisado por:** [Nome do CISO / DPO]  
**Data da Revisão:** [DD/MM/YYYY]

**Checklist LGPD:**

- [ ] ✅ Base legal identificada (consentimento, legítimo interesse, etc.)
- [ ] ✅ Finalidade específica e legítima
- [ ] ✅ Minimização de dados (apenas essenciais)
- [ ] ✅ Retenção limitada (prazo definido: [N] dias)
- [ ] ✅ Direitos dos titulares garantidos (acesso, exclusão, portabilidade, oposição)
- [ ] ✅ Segurança adequada (criptografia, controle de acesso)
- [ ] ✅ Transparência (usuários informados sobre uso de IA)
- [ ] ✅ Não discriminação (medidas contra viés)

**RIPD (Relatório de Impacto) Necessário?**
- [ ] ✅ Sim - RIPD elaborado (anexar)
- [ ] ❌ Não - Justificar: [Ex: "Processamento de baixo risco, apenas metadados não identificáveis"]

**Aprovação do DPO:**
- [ ] ✅ Aprovado
- [ ] ⚠️ Aprovado com ressalvas (especificar)
- [ ] ❌ Rejeitado (blocker - especificar motivos)

---

### 6.2 Compliance Due Diligence de Cliente Enterprise

**Revisado por:** [Nome do CISO]  
**Data da Revisão:** [DD/MM/YYYY]

**Seção VIII - Inteligência Artificial:**

- [ ] ✅ Política de Governança de IA atualizada
- [ ] ✅ Processos de monitoramento documentados
- [ ] ✅ Zero compartilhamento de dados (Cliente Enterprise - {{CUSTOMER_NAME}}) com vendors
- [ ] ✅ Ambiente dedicado (segregação de dados)
- [ ] ✅ Evidências de testes de viés disponíveis
- [ ] ✅ Logs de auditoria acessíveis

**Evidências Disponíveis para Auditoria:**
- [ ] Relatório de Testes de Fairness
- [ ] Logs de Guardrails (input/output validation)
- [ ] Relatório de Monitoramento Trimestral
- [ ] Certificações de Vendor (SOC 2, ISO 27001)

**Aprovação do CISO:**
- [ ] ✅ Aprovado para submissão à (Cliente Enterprise - {{CUSTOMER_NAME}})
- [ ] ⚠️ Pendências (especificar)

---

### 6.3 Frameworks Internacionais

**EU AI Act (Draft) - Classificação de Risco:**

- [ ] **Alto Risco** (ex: Credit scoring, contratação, enforcement)
  - Requisitos adicionais: Documentação técnica completa, conformity assessment, registro
- [ ] **Risco Limitado** (ex: ChatBots com interação humana)
  - Requisitos: Transparência obrigatória
- [ ] **Baixo Risco ou Mínimo**
  - Requisitos: Autorregulação

**NIST AI Risk Management Framework:**
- [ ] ✅ Riscos identificados conforme NIST AI RMF
- [ ] ✅ Mitigações mapeadas para controles NIST

---

### 6.4 Revisão Jurídica (Se Necessário)

**Revisado por:** [Nome do Jurídico]  
**Data da Revisão:** [DD/MM/YYYY]

**Parecer Jurídico:**

[Espaço para parecer legal sobre riscos regulatórios, responsabilidade civil, contratos com vendors, etc.]

**Aprovação do Jurídico:**
- [ ] ✅ Aprovado
- [ ] ⚠️ Aprovado com ressalvas (especificar)
- [ ] ❌ Rejeitado (blocker - especificar motivos)

---

## SEÇÃO 7: DELIBERAÇÃO DO COMITÊ DE IA

### 7.1 Apresentação ao Comitê

**Data da Reunião:** [DD/MM/YYYY]

**Apresentador:** [Nome do AI Engineer]

**Tempo de Apresentação:** 15 minutos + 15 min Q&A

**Materiais de Apoio Fornecidos:**
- [ ] Este formulário preenchido
- [ ] Matriz de Risco de IA atualizada
- [ ] Relatório de Testes (performance, fairness)
- [ ] Plano de Testing em Staging
- [ ] Rollback Plan documentado
- [ ] Parecer do CISO/DPO
- [ ] Parecer Jurídico (se aplicável)

---

### 7.2 Discussão e Questões

**Questões Levantadas pelos Membros:**

1. **[Nome do Membro]:** [Questão/Preocupação]
   - **Resposta do Apresentador:** [Resposta]

2. **[Nome do Membro]:** [Questão/Preocupação]
   - **Resposta:** [Resposta]

3. [...]

---

### 7.3 Votação

**Proposta Submetida à Votação:**

_"Aprovar implementação do modelo [Nome + Versão] para [Use Case], condicionado a testing em staging de 1 semana e rollback plan documentado."_

**Votação:**

| Membro | Voto | Justificativa (opcional) |
|--------|------|--------------------------|
| [Nome CTO] | [ ] A favor [ ] Contra [ ] Abstenção | |
| [Nome AI Engineer] | [ ] A favor [ ] Contra [ ] Abstenção | |
| [Nome Product Manager] | [ ] A favor [ ] Contra [ ] Abstenção | |
| [Nome CISO] | [ ] A favor [ ] Contra [ ] Abstenção | |

**Resultado:** [X] a favor, [Y] contra, [Z] abstenções

---

### 7.4 Decisão Final

**O Comitê de IA decidiu:**

- [ ] ✅ **APROVADO** - Autorizado prosseguir para testing em staging
- [ ] ⚠️ **APROVADO COM CONDIÇÕES** (especificar condições obrigatórias abaixo)
- [ ] ❌ **REJEITADO** (especificar motivos abaixo)
- [ ] 🔵 **ADIADO** (solicitar informações adicionais - especificar)

**Por:** [X] votos a favor, [Y] contra, [Z] abstenções

---

**Se APROVADO COM CONDIÇÕES, especificar:**

1. [Condição obrigatória 1]
2. [Condição obrigatória 2]
3. [...]

**Prazo para atender condições:** [DD/MM/YYYY]

---

**Se REJEITADO, especificar motivos:**

[Explicação clara dos motivos de rejeição]

**Possibilidade de nova submissão:**
- [ ] Sim - Após ajustes (especificar quais)
- [ ] Não - Proposta descartada

---

### 7.5 Próximos Passos

**Se aprovado:**

| Ação | Responsável | Prazo | Status |
|------|-------------|-------|--------|
| Testing em staging (1 semana) | [Nome] | [DD/MM/YYYY] | ⏳ Pendente |
| Documentar rollback plan | [Nome] | [DD/MM/YYYY] | ⏳ Pendente |
| Deploy em produção (se testing OK) | [Nome] | [DD/MM/YYYY] | ⏳ Pendente |
| Monitoramento intensificado (2 semanas) | [Nome] | [DD/MM/YYYY] | ⏳ Pendente |
| Relatório de estabilização (30 dias) | [Nome] | [DD/MM/YYYY] | ⏳ Pendente |

**Follow-up obrigatório:** Próxima reunião ordinária do Comitê IA

---

## 📝 Aprovação e Assinaturas

### **Apresentador (AI Engineer):**

---

**Nome:** [Nome do AI Engineer]  
**Cargo:** AI Engineer / Tech Lead  
**Data:** [DD/MM/YYYY]  
**Assinatura:** ______________________________

---

### **Revisão de Conformidade (CISO):**

---

**Nome:** [Nome do CISO]  
**Cargo:** CISO  
**Data:** [DD/MM/YYYY]  
**Decisão:** [ ] Aprovado [ ] Aprovado com ressalvas [ ] Rejeitado  
**Assinatura:** ______________________________

---

### **Presidente do Comitê de IA (CTO):**

---

**Nome:** [Nome do CTO]  
**Cargo:** CTO - Presidente do Comitê de IA  
**Data:** [DD/MM/YYYY]  
**Decisão Final:** [ ] Aprovado [ ] Aprovado com condições [ ] Rejeitado [ ] Adiado  
**Assinatura:** ______________________________

---

## 🔗 Referências

- [Regimento do Comitê de IA](./regimento-comite-ia.md)
- [AI Governance Policy](../../ai-governance/ai-governance-policy.md)
- [Matriz de Risco de IA](./matriz-risco-ia.md)
- [Pauta Trimestral Padrão](./pauta-trimestral-ia.md)
- [NIST AI Risk Management Framework](https://www.nist.gov/itl/ai-risk-management-framework)
- [EU AI Act (Draft)](https://artificialintelligenceact.eu/)

---

**🔐 Classificação:** CONFIDENCIAL - USO INTERNO  
**📂 Armazenamento:** `/compliance/ai-governance/comite/aprovacoes/[ano]/[modelo-nome].md`  
**🔄 Versão:** 1.0  
**📅 Data do Template:** 2025-10-06
