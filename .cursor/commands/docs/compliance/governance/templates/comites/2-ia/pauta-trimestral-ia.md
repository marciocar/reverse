---
title: "Pauta Trimestral Padrão - Comitê de IA"
version: "1.0"
quarter: "[Q1/Q2/Q3/Q4]"
year: "[YYYY]"
meeting_type: "Ordinária"
classification: "CONFIDENCIAL - USO INTERNO"
---

# Pauta Trimestral Padrão - Comitê de Inteligência Artificial

**{{COMPANY_NAME}} - INFRATECH DE RECEBÍVEIS**

> **Objetivo:** Esta pauta serve como template para reuniões ordinárias trimestrais do Comitê de IA, garantindo cobertura consistente de todos os tópicos críticos de governança de IA.

---

## 📋 Informações da Reunião

**Reunião:** [Número sequencial - ex: 001/2025]  
**Trimestre:** Q[1/2/3/4] / [YYYY]  
**Data:** [DD/MM/YYYY]  
**Horário:** [HH:MM] às [HH:MM]  
**Duração Estimada:** 2-3 horas  
**Local:** [ ] Presencial [ ] Remoto [ ] Híbrido

**Convocação:** Enviada em [DD/MM/YYYY] (antecedência de [N] dias úteis)

---

## 👥 Participantes Esperados

### Membros Permanentes (Obrigatórios)

- [ ] **CTO** (Presidente)
- [ ] **AI Engineer / Tech Lead**
- [ ] **Product Manager**
- [ ] **CISO** (Compliance)

### Convidados para esta Reunião (Opcionais)

- [ ] **Jurídico:** [Nome] - Para [motivo específico]
- [ ] **DPO:** [Nome] - Para [motivo específico]
- [ ] **Auditor:** [Nome] - Para [motivo específico]
- [ ] **Outros:** [Nome + motivo]

---

## 📚 Materiais de Suporte (Anexos)

**Os seguintes documentos devem ser preparados e anexados ao convite:**

1. [ ] **Ata da reunião anterior** ([Número da ata]) - Para aprovação
2. [ ] **Relatório Trimestral de Monitoramento de IA** - Q[N]/[YYYY]
3. [ ] **Dashboard de KPIs** (atualizado com dados do trimestre)
4. [ ] **Relatório de Incidentes** (se houver incidentes no trimestre)
5. [ ] **Formulários de Aprovação de Modelo** (se houver propostas)
6. [ ] **Matriz de Risco de IA** (atualizada)
7. [ ] **Relatório de Vendor Performance** (OpenAI SLA)

**Responsável pela Preparação:** AI Engineer + Product Manager  
**Prazo de Envio:** [DD/MM/YYYY] (2 dias úteis antes da reunião)

---

## 🗂️ Pauta Detalhada

### **BLOCO 1: ABERTURA E APROVAÇÕES** (~15 min)

#### 1.1 Abertura da Reunião

- Verificação de presença e quórum
- Confirmação de agenda e ajustes (se necessário)

#### 1.2 Aprovação da Ata Anterior

**Ata a Aprovar:** [Número da ata anterior]

**Decisão:**
- [ ] ✅ Ata aprovada sem alterações
- [ ] ⚠️ Ata aprovada com ajustes (especificar)
- [ ] ❌ Ata rejeitada (reenviar corrigida)

---

### **BLOCO 2: REVISÃO DE KPIs E PERFORMANCE** (~30 min)

#### 2.1 KPIs de Performance (Q[N]/[YYYY])

**Apresentador:** AI Engineer

**Métricas Obrigatórias:**

| Métrica | Target | Q Anterior | Q Atual | Variação | Status |
|---------|--------|-----------|---------|----------|--------|
| **Accuracy Rate** | > 85% | [%]% | **[%]%** | [+/-X]% | ✅/⚠️/❌ |
| **User Satisfaction** | > 4.0/5.0 | [X.X] | **[X.X]** | [+/-X.X] | ✅/⚠️/❌ |
| **Escalation Rate** | < 30% | [%]% | **[%]%** | [+/-X]% | ✅/⚠️/❌ |
| **Bias Incidents** | 0 | [N] | **[N]** | [+/-N] | ✅/⚠️/❌ |
| **Security Incidents** | 0 | [N] | **[N]** | [+/-N] | ✅/⚠️/❌ |
| **Response Time (p95)** | < 3s | [X.X]s | **[X.X]s** | [+/-X.X]s | ✅/⚠️/❌ |

**Base:** [AI Governance Policy - Métricas](../../ai-governance/ai-governance-policy.md#métricas-de-performance-e-governança)

**Score Geral:** [N]/6 metas atingidas ([%]%)

**Discussão:**
- **Metas não atingidas:** Análise de causa raiz + plano de ação
- **Tendências:** Identificar melhorias ou degradações ao longo dos trimestres
- **Benchmarking:** Comparar com indústria (se aplicável)

**Decisão:**
- [ ] KPIs satisfatórios - Manter estratégia atual
- [ ] Ajustes necessários - Definir plano de ação (ver Bloco 7)
- [ ] Alerta crítico - Convocar reunião extraordinária

---

#### 2.2 Análise de Tendências (Histórico)

**Gráfico de Evolução Trimestral:**

```
Accuracy Rate:    Q1: 88% → Q2: 87% → Q3: 89% → Q4: [%]%
User Satisfaction: Q1: 4.2 → Q2: 4.1 → Q3: 4.3 → Q4: [X.X]
...
```

**Insights:** [Identificar patterns de melhoria ou degradação]

---

### **BLOCO 3: PROCESSOS DE MONITORAMENTO** (~30 min)

**Base:** [AI Governance Policy - Mitigação de Viés](../../ai-governance/ai-governance-policy.md#mitigação-de-viés-e-comportamentos-indesejados)

#### 3.1 Revisão Humana Semanal

**Apresentador:** AI Engineer + QA Lead

**Consolidação Trimestral:**
- **Semanas cobertas:** [N] semanas
- **Total de conversas auditadas:** ~[N] conversas (target: ~1.200)
- **Taxa de cobertura:** [%]% do total de conversas do trimestre

**Principais Achados:**

| Categoria de Issue | Quantidade | Severidade | Ação Tomada |
|-------------------|-----------|------------|-------------|
| Resposta imprecisa | [N] | Baixa/Média | Ajuste de knowledge base |
| Tom inadequado | [N] | Baixa | Revisão de prompts |
| Viés detectado | [N] | Alta | [Ação específica] |
| Outro | [N] | [Severidade] | [Ação] |

**Melhorias Implementadas no Trimestre:**
1. [Descrição da melhoria + impacto]
2. [...]

**Decisão:**
- [ ] Processo funcionando adequadamente
- [ ] Aumentar frequência/amostragem
- [ ] Ajustar critérios de avaliação

---

#### 3.2 Automated Bias Detection (Diário)

**Apresentador:** AI Engineer

**Consolidação Trimestral:**
- **Dias monitorados:** [N] dias (~90 dias)
- **Total de alertas gerados:** [N]
- **Falsos positivos:** [N] ([%]%)
- **Issues reais confirmados:** [N]

**Análise de Padrões:**
- Keywords mais frequentes: [Lista]
- Tipos de viés detectados: [Ex: "Gênero (3 casos), Idade (1 caso)"]
- Severidade média: [Baixa/Média/Alta]

**Ajustes no Sistema de Detecção:**
- [Descrever ajustes feitos no trimestre para reduzir falsos positivos ou melhorar detecção]

**Decisão:**
- [ ] Sistema funcionando adequadamente
- [ ] Ajustar sensibilidade (especificar)
- [ ] Adicionar novos keywords/padrões

---

#### 3.3 Red Team Testing (Mensal)

**Apresentador:** AI Engineer

**Consolidação Trimestral:**

| Mês | Scenarios Testados | Vulnerabilidades Identificadas | Severidade | Status Mitigação |
|-----|-------------------|-------------------------------|-----------|------------------|
| [Mês 1] | [N] | [Descrição] | [Baixa/Média/Alta] | ✅ Mitigado |
| [Mês 2] | [N] | [Descrição] | [Baixa/Média/Alta] | 🔵 Em progresso |
| [Mês 3] | [N] | [Descrição] | [Baixa/Média/Alta] | ✅ Mitigado |

**Principais Vulnerabilidades:**
1. **[Categoria de Vulnerabilidade]:** [Descrição + como foi mitigado]
2. [...]

**Lições Aprendidas:**
- [O que funcionou bem nos testes]
- [O que precisa ser ajustado]

**Decisão:**
- [ ] Vulnerabilidades todas mitigadas
- [ ] Ações adicionais necessárias (especificar)
- [ ] Expandir escopo de testes (novos scenarios)

---

#### 3.4 User Feedback e Support Agent Feedback

**Apresentador:** Product Manager + CS Lead

**User Feedback (Thumbs Up/Down):**
- **Total de feedbacks:** [N]
- **Thumbs Up:** [N] ([%]%)
- **Thumbs Down:** [N] ([%]%)
- **Principais motivos de insatisfação:** [Lista]

**Support Agent Feedback (Flags):**
- **Total de flags de "resposta inadequada":** [N]
- **Principais categorias:** [Ex: "Resposta incorreta (X), Tom inadequado (Y)"]
- **Ações tomadas:** [Ex: "Atualização de knowledge base, ajuste de prompts"]

**Decisão:**
- [ ] Feedback positivo - Manter estratégia
- [ ] Melhorias identificadas - Implementar ajustes
- [ ] Escalar para desenvolvimento (feature request)

---

### **BLOCO 4: MODEL REGISTRY E CHANGE MANAGEMENT** (~20 min)

**Base:** [AI Governance Policy - Governança de Modelos](../../ai-governance/ai-governance-policy.md#governança-de-modelos)

#### 4.1 Modelos em Produção

**Apresentador:** AI Engineer

**Status Atual:**

| Modelo | Versão | Desde | Use Case | Performance | Drift Detectado? | Status |
|--------|--------|-------|----------|-------------|------------------|--------|
| GPT-4 (ChatBot) | gpt-4-2024-08 | [DD/MM/YYYY] | Atendimento Nível 1 | ✅ Estável | ❌ Não | ✅ Produção |
| [Futuro] | - | - | - | - | - | ⏳ Desenvolvimento |

**Análise de Drift:**
- **Metodologia:** [Descrever como drift é detectado]
- **Baseline:** [Versão de referência]
- **Resultado:** [Sem drift / Drift detectado em X%]

**Decisão:**
- [ ] Modelos estáveis - Nenhuma ação necessária
- [ ] Drift detectado - Avaliar atualização de modelo
- [ ] Performance degradada - Plano de ação (ver Bloco 7)

---

#### 4.2 Mudanças de Modelo no Trimestre

**Se houve mudanças:**

| Data | Mudança | Motivo | Aprovação | Testing | Rollback Plan | Resultado |
|------|---------|--------|-----------|---------|---------------|-----------|
| [DD/MM] | [Ex: GPT-4 → GPT-4-Turbo] | [Motivo] | ✅ Comitê [Data] | ✅ 1 semana staging | ✅ Doc | ✅ Sucesso |

**Se não houve mudanças:**
- _"Nenhuma mudança de modelo realizada neste trimestre. Modelos atuais estão performando adequadamente."_

---

#### 4.3 Model Registry Atualizado

**Link:** [URL do Model Registry interno]

**Verificação:**
- [ ] Todos os modelos em produção estão registrados
- [ ] Versões atualizadas
- [ ] Documentação completa (performance, riscos, mitigação)

---

### **BLOCO 5: VENDOR MANAGEMENT** (~15 min)

**Base:** [AI Governance Policy - Governança de Modelos](../../ai-governance/ai-governance-policy.md#governança-de-modelos)

#### 5.1 OpenAI (GPT-4) - SLA e Performance

**Apresentador:** AI Engineer

**SLA Contratual:**
- **Uptime Target:** 99.9%
- **Uptime Real Q[N]:** [%]%
- **Delta:** [+/-X]%
- **Status:** ✅ Dentro do SLA / ⚠️ Abaixo do SLA

**Incidentes de Indisponibilidade:**

| Data | Duração | Motivo (OpenAI) | Impacto no {{COMPANY_NAME}} | Compensação |
|------|---------|-----------------|-------------------|-------------|
| [DD/MM] | [X] min | [Descrição] | [Impacto] | [Sim/Não - Descrição] |

**Total de Downtime no Trimestre:** [X] minutos

**Análise:**
- [Descrever se impacto foi aceitável ou se ação é necessária]

---

#### 5.2 Compliance do Vendor

**Certificações OpenAI:**
- **SOC 2 Type II:** ✅ Válido até [DD/MM/YYYY]
- **ISO 27001:** ✅ Válido até [DD/MM/YYYY]
- **GDPR Compliance:** ✅ Confirmado

**Decisão:**
- [ ] Vendor performance satisfatória
- [ ] Reavaliar contrato (custos, SLA)
- [ ] Considerar vendors alternativos (backup strategy)

---

### **BLOCO 6: GUARDRAILS E SEGURANÇA** (~20 min)

**Base:** [AI Governance Policy - Segurança e Privacidade](../../ai-governance/ai-governance-policy.md#segurança-e-privacidade-de-dados)

#### 6.1 Input Validation

**Apresentador:** AI Engineer

**Estatísticas do Trimestre:**

| Tipo de Bloqueio | Quantidade | % do Total | Tendência vs Q Anterior |
|------------------|-----------|------------|-------------------------|
| Dados sensíveis (CPF, senhas, cartões) | [N] | [%]% | [↑/↓/→] |
| Prompt injection attempts | [N] | [%]% | [↑/↓/→] |
| Linguagem ofensiva | [N] | [%]% | [↑/↓/→] |
| Fora do escopo | [N] | [%]% | [↑/↓/→] |

**Total de Inputs Bloqueados:** [N]

**Análise de Padrões:**
- [Identificar se há padrões de abuse ou tentativas coordenadas]

**Decisão:**
- [ ] Guardrails funcionando adequadamente
- [ ] Ajustar sensibilidade (especificar)
- [ ] Adicionar novas regras de validação

---

#### 6.2 Output Validation

**Estatísticas do Trimestre:**

| Tipo de Bloqueio | Quantidade | % do Total | Tendência vs Q Anterior |
|------------------|-----------|------------|-------------------------|
| Conteúdo sensível exposto | [N] | [%]% | [↑/↓/→] |
| Viés detectado automaticamente | [N] | [%]% | [↑/↓/→] |
| Tone check failed | [N] | [%]% | [↑/↓/→] |

**Total de Outputs Bloqueados:** [N]

**Análise:**
- [Descrever se bloqueios foram adequados ou se há falsos positivos/negativos]

---

#### 6.3 Rate Limiting e Abuse Prevention

**Incidentes do Trimestre:**

| Data | Tipo de Abuse | Ação Tomada | Usuário Bloqueado? | Resolução |
|------|---------------|-------------|-------------------|-----------|
| [DD/MM] | [Ex: Scraping, Spam] | [Ação] | ✅ Sim / ❌ Não | [Descrição] |

**Total de Usuários Bloqueados:** [N]

**Análise:**
- [Identificar patterns de abuse e efetividade das medidas]

---

### **BLOCO 7: CONFORMIDADE REGULATÓRIA** (~15 min)

#### 7.1 Compliance LGPD

**Apresentador:** CISO

**Checklist de Conformidade:**

- [ ] ✅ **Transparência:** Disclaimer de IA exibido aos usuários
- [ ] ✅ **Minimização:** Apenas metadados essenciais coletados
- [ ] ✅ **Retenção:** Metadados deletados após 90 dias
- [ ] ✅ **Não Armazenamento:** Conversas NÃO persistidas
- [ ] ✅ **Opt-out:** Opção de escalar para humano disponível
- [ ] ✅ **Direitos dos Titulares:** Processos para acesso/exclusão/portabilidade funcionando

**Solicitações de Titulares no Trimestre:**
- Acesso: [N] solicitações
- Exclusão: [N] solicitações
- Portabilidade: [N] solicitações
- **Todas atendidas no prazo legal (15 dias)?** [ ] Sim [ ] Não

**Incidentes de Privacidade:**
- [ ] Nenhum incidente
- [ ] [N] incidentes (descrever + ações corretivas)

**Decisão:**
- [ ] Compliance LGPD mantido
- [ ] Ajustes necessários (especificar)

---

#### 7.2 Compliance Serasa Experian Due Diligence

**Apresentador:** CISO

**Seção VIII - Inteligência Artificial:**

- [ ] ✅ **Política de Governança de IA** atualizada e disponível
- [ ] ✅ **Evidências de monitoramento** documentadas
- [ ] ✅ **Zero compartilhamento** de dados Serasa com OpenAI
- [ ] ✅ **Ambiente dedicado** (AWS segregado)
- [ ] ✅ **Relatórios trimestrais** enviados à Serasa

**Última Entrega à Serasa:** [DD/MM/YYYY]  
**Próxima Entrega:** [DD/MM/YYYY]

**Feedback da Serasa:**
- [Descrever se houve feedback ou solicitações adicionais]

---

#### 7.3 Preparação para Regulações Futuras

**EU AI Act (Draft):**
- **Status:** Monitoramento contínuo
- **Classificação esperada do ChatBot:** [ ] Alto Risco [ ] Risco Limitado [ ] Baixo Risco
- **Ações Preparatórias:** [Ex: "Documentar transparência, auditabilidade"]

**Outras Regulações:**
- [Identificar outras regulações emergentes relevantes]

---

### **BLOCO 8: NOVOS CASOS DE USO E APROVAÇÕES** (~30-45 min)

#### 8.1 Propostas de Novos Modelos / Casos de Uso

**Se houver propostas:**

**Proposta #1: [Nome do Modelo/Caso de Uso]**

**Apresentador:** [Nome + Cargo]

**Resumo:**
- **Objetivo:** [O que se pretende alcançar]
- **Modelo Proposto:** [Ex: "GPT-4-Turbo" ou "Claude 3" ou "Modelo proprietário ML"]
- **Use Case:** [Ex: "Credit Scoring Aumentado por IA"]

**Documentação de Apoio:**
- [ ] Formulário de Aprovação de Modelo IA preenchido
- [ ] Matriz de Risco IA atualizada
- [ ] Plano de Testing (staging 1 semana)
- [ ] Rollback Plan documentado

**Tempo de Apresentação:** 15 minutos + 15 min Q&A

**Votação:**
- Ver [Template de Decisão com Votação](../_shared/template-decisao-votacao.md)

**Decisão:**
- [ ] ✅ Aprovado - Prosseguir para testing em staging
- [ ] ⚠️ Aprovado com condições (especificar)
- [ ] ❌ Rejeitado (especificar motivos)

---

**Se não houver propostas:**
- _"Nenhuma proposta de novo modelo ou caso de uso para este trimestre."_

---

#### 8.2 Mudanças Críticas em Guardrails

**Se houver propostas:**

**Proposta:** [Descrição da mudança proposta]

**Justificativa:** [Por que a mudança é necessária]

**Impacto:** [Potencial impacto em segurança, privacidade, performance]

**Votação:**
- Ver [Template de Decisão com Votação](../_shared/template-decisao-votacao.md)

**Decisão:**
- [ ] ✅ Aprovado
- [ ] ❌ Rejeitado

---

### **BLOCO 9: AUDITORIAS** (~10 min)

#### 9.1 Auditoria Interna

**Última Auditoria:** [DD/MM/YYYY]

**Principais Achados:**
1. [Achado 1 + Severidade]
2. [Achado 2 + Severidade]

**Status de Ações Corretivas:**

| Achado | Ação Corretiva | Responsável | Prazo | Status |
|--------|----------------|-------------|-------|--------|
| [Achado 1] | [Ação] | [Nome] | [DD/MM] | ✅ Concluído |
| [Achado 2] | [Ação] | [Nome] | [DD/MM] | 🔵 Em progresso |

**Próxima Auditoria Interna:** [DD/MM/YYYY]

---

#### 9.2 Auditoria Externa

**Status:** [ ] Planejada [ ] Em andamento [ ] Concluída [ ] Não planejada

**Se planejada/em andamento:**
- **Auditor:** [Nome da empresa]
- **Escopo:** [Descrição]
- **Data Prevista:** [DD/MM/YYYY]
- **Orçamento:** R$ [valor]

**Se concluída:**
- **Data de Conclusão:** [DD/MM/YYYY]
- **Resultado:** [Satisfatório / Com ressalvas / Insatisfatório]
- **Principais Recomendações:** [Lista]
- **Plano de Ação:** [Descrição]

---

### **BLOCO 10: REVISÃO DE POLÍTICAS E DIRETRIZES** (~10 min)

#### 10.1 AI Governance Policy

**Versão Atual:** [X.Y]  
**Última Revisão:** [DD/MM/YYYY]  
**Próxima Revisão Agendada:** [DD/MM/YYYY] (Anual)

**Mudanças Propostas:**
- [ ] Nenhuma mudança proposta
- [ ] [Descrever mudanças propostas]

**Se houver mudanças, Votação:**
- [ ] ✅ Aprovado (atualizar para versão [X.Y+1])
- [ ] ❌ Rejeitado / Adiado

---

#### 10.2 Outras Políticas Relacionadas

**Políticas Relacionadas a Revisar:**
- [ ] Política de Privacidade (LGPD)
- [ ] Política de Segurança da Informação (ISO 27001)
- [ ] [Outras]

**Ação:** [Coordenar revisão com CISO / DPO]

---

### **BLOCO 11: PLANEJAMENTO E AÇÕES FUTURAS** (~15 min)

#### 11.1 Plano de Ação Q[N+1]

**Prioridades para Próximo Trimestre:**

| Prioridade | Ação | Responsável | Prazo | Dependências |
|-----------|------|-------------|-------|--------------|
| 🥇 Alta | [Ação 1] | [Nome] | [DD/MM] | [Dependências] |
| 🥈 Média | [Ação 2] | [Nome] | [DD/MM] | [Dependências] |
| 🥉 Baixa | [Ação 3] | [Nome] | [DD/MM] | [Dependências] |

**Orçamento Necessário:** R$ [valor]

**Decisão:**
- [ ] Plano aprovado
- [ ] Ajustes necessários (especificar)

---

#### 11.2 Roadmap de IA (2025-2026)

**Revisão de Roadmap:**

- Q[N+1]/[YYYY]: [Iniciativas planejadas]
- Q[N+2]/[YYYY]: [Iniciativas planejadas]
- [YYYY+1]: [Visão de longo prazo]

**Discussão:**
- Alinhamento com estratégia de produto
- Recursos necessários (pessoas, orçamento, infraestrutura)
- Riscos e mitigações

---

### **BLOCO 12: OUTROS ASSUNTOS** (~10 min)

#### 12.1 [Assunto Ad Hoc 1]

[Descrever assunto não coberto pelos blocos anteriores]

**Decisão/Ação:**
- [Decisão tomada + responsável + prazo]

---

#### 12.2 [Assunto Ad Hoc 2]

[...]

---

### **BLOCO 13: ENCERRAMENTO** (~5 min)

#### 13.1 Resumo de Decisões

[Lista consolidada de todas as decisões tomadas na reunião]

#### 13.2 Action Items

[Lista consolidada de todos os action items com responsáveis e prazos]

#### 13.3 Próxima Reunião

**Data:** [DD/MM/YYYY]  
**Tipo:** [ ] Ordinária Q[N+1] [ ] Extraordinária

**Preparação Necessária:**
- [Lista de materiais a preparar]

#### 13.4 Encerramento

**Horário de Encerramento:** [HH:MM]

---

## 📝 Checklist de Preparação (Secretaria do Comitê)

**7 dias antes:**
- [ ] Solicitar materiais aos responsáveis (AI Engineer, Product Manager, CISO)
- [ ] Verificar disponibilidade dos membros permanentes
- [ ] Reservar sala/link de videoconferência

**2 dias antes:**
- [ ] Enviar convite com pauta + materiais anexos
- [ ] Confirmar presença dos membros

**1 dia depois:**
- [ ] Elaborar ata (prazo: 5 dias úteis)
- [ ] Enviar ata para revisão dos membros
- [ ] Distribuir action items aos responsáveis

---

## 🔗 Referências

- [Regimento do Comitê de IA](./regimento-comite-ia.md)
- [AI Governance Policy](../../ai-governance/ai-governance-policy.md)
- [Ata de Reunião - Template](./ata-reuniao-ia.md)
- [Formulário de Aprovação de Modelo IA](./formulario-aprovacao-modelo-ia.md)
- [Matriz de Risco de IA](./matriz-risco-ia.md)
- [Relatório Trimestral de Monitoramento](./relatorio-trimestral-monitoramento-ia.md)

---

**🔐 Classificação:** CONFIDENCIAL - USO INTERNO  
**🔄 Versão:** 1.0  
**📅 Data do Template:** 2025-10-06
