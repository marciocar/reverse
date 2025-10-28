---
title: "Matriz de Risco de IA"
version: "1.0"
last_update: "[DD/MM/YYYY]"
next_review: "[DD/MM/YYYY]"
owner: "Comitê de IA"
classification: "CONFIDENCIAL - USO INTERNO"
---

# Matriz de Risco de IA

**GRANAAI - INFRATECH DE RECEBÍVEIS**

> **Objetivo:** Identificar, avaliar e gerenciar riscos associados ao desenvolvimento e uso de sistemas de Inteligência Artificial, garantindo governança responsável e mitigação proativa.

---

## 📋 Metodologia

### Framework Base

**Esta matriz segue:**
- **NIST AI Risk Management Framework (AI RMF 1.0)**
- **ISO 31000:2018** (Gestão de Riscos)
- **AI Governance Policy do Granaai**

**Referências:**
- [NIST AI RMF](https://www.nist.gov/itl/ai-risk-management-framework)
- [AI Governance Policy](../../ai-governance/ai-governance-policy.md)

---

### Escala de Avaliação

#### **Probabilidade:**

| Nível | Descrição | Frequência Esperada |
|-------|-----------|---------------------|
| **Baixa** | Improvável de ocorrer | < 1 vez/ano |
| **Média** | Pode ocorrer eventualmente | 1-4 vezes/ano |
| **Alta** | Provável de ocorrer | > 4 vezes/ano |

#### **Impacto:**

| Nível | Descrição | Consequências |
|-------|-----------|---------------|
| **Baixo** | Impacto mínimo | Sem danos significativos, resolução rápida |
| **Médio** | Impacto moderado | Requer atenção, pode afetar poucos usuários |
| **Alto** | Impacto crítico | Afeta muitos usuários, danos reputacionais/financeiros |

#### **Nível de Risco (Probabilidade × Impacto):**

| Probabilidade | Impacto Baixo | Impacto Médio | Impacto Alto |
|---------------|---------------|---------------|--------------|
| **Alta** | 🟡 Médio | 🔴 Alto | 🔴 Crítico |
| **Média** | 🟢 Baixo | 🟡 Médio | 🔴 Alto |
| **Baixa** | 🟢 Baixo | 🟢 Baixo | 🟡 Médio |

**Legenda:**
- 🟢 **Verde:** Risco aceitável (monitoramento padrão)
- 🟡 **Amarelo:** Risco médio (mitigação necessária)
- 🔴 **Vermelho:** Risco alto (ação urgente obrigatória)

---

## 📊 Matriz de Riscos de IA

### **CATEGORIA 1: RISCOS TÉCNICOS**

#### 1.1 Degradação de Performance (Drift)

**Descrição:** Performance do modelo degrada ao longo do tempo devido a mudanças nos dados de entrada ou contexto operacional.

| Atributo | Valor |
|----------|-------|
| **Probabilidade** | Média |
| **Impacto** | Médio |
| **Nível de Risco** | 🟡 **Médio** |

**Indicadores:**
- Accuracy cai abaixo de 85%
- User Satisfaction cai abaixo de 4.0/5.0
- Escalation Rate aumenta acima de 30%

**Controles Atuais:**
-  Monitoramento trimestral de KPIs
-  Comparação com baseline (GPT-4-2023-11)
-  Alertas automatizados se thresholds críticos

**Plano de Mitigação:**
- [ ] Implementar detecção automática de drift (mensal)
- [ ] Estabelecer processo de retraining/atualização (se modelo proprietário)
- [ ] Avaliar upgrade de versão de modelo (ex: GPT-4 → GPT-4-Turbo)

**Responsável:** AI Engineer  
**Prazo:** Q2/2025

**Risco Residual:** 🟢 Baixo (após mitigação)

---

#### 1.2 Falha de Modelo em Produção

**Descrição:** Modelo apresenta erro crítico, causando indisponibilidade ou respostas incorretas em massa.

| Atributo | Valor |
|----------|-------|
| **Probabilidade** | Baixa |
| **Impacto** | Alto |
| **Nível de Risco** | 🟡 **Médio** |

**Indicadores:**
- Erro rate > 5%
- Downtime > 5 minutos
- Usuários reportam comportamento anormal

**Controles Atuais:**
-  Testing obrigatório em staging (1 semana)
-  Rollback plan documentado para cada modelo
-  Monitoramento CloudWatch (alertas em tempo real)
-  Incident response team on-call

**Plano de Mitigação:**
-  Processo de rollback < 10 minutos
-  Backup de modelo anterior (fallback)
-  Circuit breaker (desabilitar automaticamente se error rate alto)

**Responsável:** AI Engineer + CTO  
**Prazo:** Implementado

**Risco Residual:** 🟢 Baixo

---

#### 1.3 Dependência de Vendor Único (OpenAI)

**Descrição:** Dependência crítica de um único vendor (OpenAI) para GPT-4, sem alternativa de backup.

| Atributo | Valor |
|----------|-------|
| **Probabilidade** | Média |
| **Impacto** | Alto |
| **Nível de Risco** | 🔴 **Alto** |

**Indicadores:**
- OpenAI com downtime frequente
- Mudança abrupta de pricing
- Descontinuação de versão do modelo

**Controles Atuais:**
-  SLA de 99.9% com OpenAI
-  Monitoramento de uptime
- ⚠️ Sem vendor alternativo implementado

**Plano de Mitigação:**
- [ ] Avaliar vendors alternativos (Anthropic Claude, Google Gemini, Azure OpenAI)
- [ ] Implementar architecture agnóstica (fácil troca de vendor)
- [ ] Estabelecer contrato de backup com vendor secundário
- [ ] Desenvolver modelo proprietário (longo prazo)

**Responsável:** CTO + AI Engineer  
**Prazo:** Q3/2025 (avaliação) | Q4/2025 (implementação backup)

**Risco Residual:** 🟡 Médio (após mitigação)

---

#### 1.4 Latência Elevada (Response Time)

**Descrição:** Tempo de resposta do modelo excede limites aceitáveis, prejudicando experiência do usuário.

| Atributo | Valor |
|----------|-------|
| **Probabilidade** | Baixa |
| **Impacto** | Médio |
| **Nível de Risco** | 🟢 **Baixo** |

**Indicadores:**
- Response Time p95 > 3 segundos
- User complaints sobre lentidão

**Controles Atuais:**
-  Target p95 < 3s monitorado trimestralmente
-  Caching de respostas frequentes
-  Otimização de prompts

**Plano de Mitigação:**
- [ ] Implementar CDN para assets estáticos
- [ ] Avaliar modelo mais rápido (ex: GPT-3.5-Turbo para casos simples)
- [ ] Otimizar knowledge base (reduzir tokens)

**Responsável:** AI Engineer  
**Prazo:** Sob demanda (se p95 > 3s)

**Risco Residual:** 🟢 Baixo

---

### **CATEGORIA 2: RISCOS ÉTICOS**

#### 2.1 Viés e Discriminação

**Descrição:** Modelo apresenta viés sistemático baseado em gênero, raça, idade ou outras características protegidas.

| Atributo | Valor |
|----------|-------|
| **Probabilidade** | Média |
| **Impacto** | Alto |
| **Nível de Risco** | 🔴 **Alto** |

**Indicadores:**
- Bias incidents > 0
- User reports de discriminação
- Automated bias detection com alertas frequentes

**Controles Atuais:**
-  Revisão Humana Semanal (100 conversas)
-  Automated Bias Detection (diário)
-  Red Team Testing (mensal)
-  Prompts ajustados para neutralidade
-  Output validation (filtro de viés)

**Base:** [AI Governance Policy - Mitigação de Viés](../../ai-governance/ai-governance-policy.md#mitigação-de-viés-e-comportamentos-indesejados)

**Plano de Mitigação:**
-  Processo de monitoramento robusto (implementado)
- [ ] Expandir Red Team scenarios (incluir mais categorias)
- [ ] Treinamento de equipe CS sobre identificação de viés
- [ ] Implementar fairness metrics automatizadas

**Responsável:** AI Engineer + QA Lead  
**Prazo:** Q2/2025 (expansão de testes)

**Risco Residual:** 🟡 Médio (após mitigação)

---

#### 2.2 Falta de Transparência (Black Box)

**Descrição:** Decisões do modelo não são explicáveis, dificultando auditoria e confiança dos usuários.

| Atributo | Valor |
|----------|-------|
| **Probabilidade** | Alta |
| **Impacto** | Médio |
| **Nível de Risco** | 🟡 **Médio** |

**Indicadores:**
- Usuários questionam "como a IA chegou a essa resposta?"
- Impossibilidade de auditar decisões específicas

**Controles Atuais:**
-  RAG pattern (Retrieval-Augmented Generation) - fontes citadas
-  Logs de auditoria (contexto da resposta registrado)
-  Knowledge base documentada

**Plano de Mitigação:**
-  RAG já implementado (mitigação principal)
- [ ] Melhorar citação de fontes nas respostas (mais explícita)
- [ ] Implementar "explain this answer" feature (usuário pode solicitar detalhes)

**Responsável:** Product Manager + AI Engineer  
**Prazo:** Q3/2025

**Risco Residual:** 🟢 Baixo (após mitigação)

---

#### 2.3 Comportamento Inadequado ou Prejudicial

**Descrição:** Modelo gera respostas ofensivas, prejudiciais ou inapropriadas.

| Atributo | Valor |
|----------|-------|
| **Probabilidade** | Baixa |
| **Impacto** | Alto |
| **Nível de Risco** | 🟡 **Médio** |

**Indicadores:**
- User reports de respostas inadequadas
- Support Agent flags
- Automated content safety alerts

**Controles Atuais:**
-  Azure Content Safety API (filtro de conteúdo sensível)
-  Output validation (tone check)
-  Prompts com instruções de profissionalismo
-  User feedback (thumbs down)

**Base:** [AI Governance Policy - Guardrails](../../ai-governance/ai-governance-policy.md#guardrails-implementados)

**Plano de Mitigação:**
-  Guardrails robustos (implementados)
- [ ] Expandir lista de keywords bloqueados
- [ ] Implementar sentiment analysis mais sofisticado

**Responsável:** AI Engineer  
**Prazo:** Contínuo

**Risco Residual:** 🟢 Baixo

---

### **CATEGORIA 3: RISCOS REGULATÓRIOS**

#### 3.1 Não Conformidade com LGPD

**Descrição:** Violação da LGPD por processamento inadequado de dados pessoais ou falta de transparência.

| Atributo | Valor |
|----------|-------|
| **Probabilidade** | Baixa |
| **Impacto** | Alto |
| **Nível de Risco** | 🟡 **Médio** |

**Indicadores:**
- Reclamação à ANPD
- Auditoria LGPD identifica não conformidades
- Dados pessoais vazados ou processados indevidamente

**Controles Atuais:**
-  Conversas NÃO armazenadas (apenas metadados)
-  Retenção limitada (90 dias)
-  Disclaimer de IA para usuários (transparência)
-  Opt-out disponível (escalar para humano)
-  Direitos dos titulares implementados
-  DPO revisou e aprovou

**Base:** [AI Governance Policy - Compliance LGPD](../../ai-governance/ai-governance-policy.md#compliance-com-lgpd)

**Plano de Mitigação:**
-  Compliance robusto (implementado)
- [ ] Auditoria LGPD anual (externa)
- [ ] Treinamento contínuo de equipe sobre LGPD

**Responsável:** CISO / DPO  
**Prazo:** Anual (auditoria)

**Risco Residual:** 🟢 Baixo

---

#### 3.2 Futuras Regulações de IA (EU AI Act, etc.)

**Descrição:** Novas regulações de IA podem exigir compliance adicional, gerando custos e atrasos.

| Atributo | Valor |
|----------|-------|
| **Probabilidade** | Média |
| **Impacto** | Médio |
| **Nível de Risco** | 🟡 **Médio** |

**Indicadores:**
- EU AI Act ou regulação brasileira de IA aprovada
- Requisitos de conformidade não atendidos

**Controles Atuais:**
-  Monitoramento contínuo de regulações emergentes
-  Documentação técnica robusta (facilitará compliance)
-  Processo de governança estruturado (Comitê IA)

**Plano de Mitigação:**
- [ ] Acompanhar tramitação de regulações
- [ ] Preparar documentação técnica conforme draft EU AI Act
- [ ] Realizar gap analysis quando regulação for aprovada

**Responsável:** CISO + Jurídico  
**Prazo:** Contínuo

**Risco Residual:** 🟡 Médio

---

#### 3.3 Responsabilidade Civil por Decisões de IA

**Descrição:** Granaai pode ser responsabilizada civilmente por decisões incorretas ou prejudiciais da IA.

| Atributo | Valor |
|----------|-------|
| **Probabilidade** | Baixa |
| **Impacto** | Alto |
| **Nível de Risco** | 🟡 **Médio** |

**Indicadores:**
- Usuário sofre dano por seguir recomendação incorreta da IA
- Processo judicial

**Controles Atuais:**
-  Disclaimer: IA é assistente, decisões finais são humanas
-  Escalation para humano sempre disponível
-  ChatBot limitado a Nível 1 (sem decisões críticas)
-  Logs de auditoria (rastreabilidade)

**Plano de Mitigação:**
-  Disclaimers e limitações claras (implementado)
- [ ] Seguro de responsabilidade civil (cyber insurance)
- [ ] Revisão de Termos de Uso (cláusula sobre IA)

**Responsável:** Jurídico + CEO  
**Prazo:** Q2/2025 (seguro)

**Risco Residual:** 🟢 Baixo (após mitigação)

---

### **CATEGORIA 4: RISCOS REPUTACIONAIS**

#### 4.1 Incidente Público de IA

**Descrição:** Incidente de IA (viés, erro grave, vazamento) torna-se público, danificando reputação da Granaai.

| Atributo | Valor |
|----------|-------|
| **Probabilidade** | Baixa |
| **Impacto** | Alto |
| **Nível de Risco** | 🟡 **Médio** |

**Indicadores:**
- Notícia negativa em mídia
- Viralização negativa em redes sociais
- Perda de clientes

**Controles Atuais:**
-  Governança robusta (Comitê IA)
-  Monitoramento contínuo (bias, security)
-  Incident response plan
-  Comunicação transparente (princípio)

**Plano de Mitigação:**
-  Processos preventivos (implementados)
- [ ] Media training para CEO/CMO (comunicação de crise IA)
- [ ] Plano de comunicação de crise (específico para IA)
- [ ] Simulação de incidente público (tabletop exercise)

**Responsável:** CMO + CEO + CISO  
**Prazo:** Q3/2025

**Risco Residual:** 🟢 Baixo (após mitigação)

---

#### 4.2 Perda de Confiança dos Usuários

**Descrição:** Usuários perdem confiança na IA devido a experiências negativas (respostas ruins, viés percebido).

| Atributo | Valor |
|----------|-------|
| **Probabilidade** | Média |
| **Impacto** | Médio |
| **Nível de Risco** | 🟡 **Médio** |

**Indicadores:**
- User Satisfaction < 4.0/5.0
- Aumento de thumbs down
- Usuários optam por atendimento humano sistematicamente

**Controles Atuais:**
-  Monitoramento de User Satisfaction (trimestral)
-  Feedback loop (thumbs up/down)
-  Melhorias contínuas baseadas em feedback

**Plano de Mitigação:**
-  Processo de melhoria contínua (implementado)
- [ ] Comunicação proativa sobre melhorias de IA
- [ ] Educar usuários sobre capacidades e limitações da IA

**Responsável:** Product Manager + CS  
**Prazo:** Contínuo

**Risco Residual:** 🟢 Baixo

---

### **CATEGORIA 5: RISCOS OPERACIONAIS**

#### 5.1 Downtime do Vendor (OpenAI)

**Descrição:** OpenAI apresenta indisponibilidade prolongada, impactando operação do ChatBot.

| Atributo | Valor |
|----------|-------|
| **Probabilidade** | Média |
| **Impacto** | Médio |
| **Nível de Risco** | 🟡 **Médio** |

**Indicadores:**
- OpenAI uptime < 99.9%
- Downtime > 15 minutos
- Usuários não conseguem usar ChatBot

**Controles Atuais:**
-  SLA de 99.9% com OpenAI
-  Monitoramento de uptime (CloudWatch)
-  Fallback para atendimento humano
- ⚠️ Sem vendor alternativo

**Base:** [AI Governance Policy - Vendor Management](../../ai-governance/ai-governance-policy.md#governança-de-modelos)

**Plano de Mitigação:**
- [ ] Implementar vendor secundário (backup)
- [ ] Mensagem clara aos usuários em caso de downtime
- [ ] Queue para atendimento humano automatizado

**Responsável:** CTO + AI Engineer  
**Prazo:** Q4/2025

**Risco Residual:** 🟡 Médio (até implementar backup)

---

#### 5.2 Custo Elevado de Operação

**Descrição:** Custo de operação da IA (tokens, infraestrutura) excede orçamento planejado.

| Atributo | Valor |
|----------|-------|
| **Probabilidade** | Média |
| **Impacto** | Baixo |
| **Nível de Risco** | 🟢 **Baixo** |

**Indicadores:**
- Custo/mês > orçamento em >20%
- Crescimento descontrolado de uso

**Controles Atuais:**
-  Monitoramento de custos (AWS Cost Explorer)
-  Rate limiting (proteção contra abuse)
-  Otimização de prompts (reduzir tokens)

**Plano de Mitigação:**
-  Controles implementados
- [ ] Estabelecer budget alerts (AWS)
- [ ] Renegociar contrato com OpenAI (volume discount)

**Responsável:** CFO + CTO  
**Prazo:** Q2/2025

**Risco Residual:** 🟢 Baixo

---

#### 5.3 Falta de Expertise Interna

**Descrição:** Perda de AI Engineer ou falta de conhecimento técnico interno para gerenciar IA.

| Atributo | Valor |
|----------|-------|
| **Probabilidade** | Média |
| **Impacto** | Médio |
| **Nível de Risco** | 🟡 **Médio** |

**Indicadores:**
- Turnover de AI Engineer
- Dificuldade em resolver incidentes técnicos

**Controles Atuais:**
- ⚠️ Expertise concentrada em 1-2 pessoas
-  Documentação técnica robusta

**Plano de Mitigação:**
- [ ] Contratar AI Engineer adicional (redundância)
- [ ] Treinamento cruzado (Product Manager, TI)
- [ ] Documentar runbooks detalhados
- [ ] Contrato de consultoria externa (backup)

**Responsável:** CTO + RH  
**Prazo:** Q3/2025

**Risco Residual:** 🟢 Baixo (após mitigação)

---

## 📊 Dashboard de Riscos

### Resumo por Severidade

| Nível | Quantidade | % | Ação |
|-------|-----------|---|------|
| 🔴 **Alto** | 2 | 13% | Mitigação prioritária |
| 🟡 **Médio** | 11 | 73% | Planos de mitigação definidos |
| 🟢 **Baixo** | 2 | 14% | Monitoramento padrão |
| **Total** | **15** | **100%** | |

---

### Riscos Críticos (Prioridade Máxima)

| # | Risco | Severidade | Prazo de Mitigação | Responsável |
|---|-------|-----------|-------------------|-------------|
| 1 | Viés e Discriminação | 🔴 Alto | Q2/2025 | AI Engineer |
| 2 | Dependência de Vendor Único | 🔴 Alto | Q4/2025 | CTO |

---

### Riscos Residuais Aceitáveis (Após Mitigação)

| Risco | Severidade Original | Severidade Residual | Justificativa |
|-------|-------------------|-------------------|---------------|
| Degradação de Performance | 🟡 Médio | 🟢 Baixo | Monitoramento trimestral robusto |
| Falha de Modelo | 🟡 Médio | 🟢 Baixo | Rollback plan < 10min |
| Não Conformidade LGPD | 🟡 Médio | 🟢 Baixo | Compliance implementado + DPO |

---

## 🔄 Revisão e Atualização

### Periodicidade de Revisão

**Esta matriz deve ser revisada:**
- **Trimestralmente:** Pelo Comitê de IA (reuniões ordinárias)
- **Sob Demanda:** Quando novo risco identificado ou incidente ocorrer
- **Anualmente:** Revisão completa com ajuste de metodologia

**Última Revisão:** [DD/MM/YYYY]  
**Próxima Revisão:** [DD/MM/YYYY] (Trimestral)

---

### Processo de Atualização

**Quando adicionar novo risco:**
1. Identificar risco (fonte: incidente, auditoria, nova regulação, etc.)
2. Avaliar probabilidade e impacto
3. Determinar nível de risco
4. Definir plano de mitigação
5. Submeter ao Comitê de IA para aprovação
6. Atualizar versão da matriz

**Responsável:** AI Engineer (proposta) + Comitê de IA (aprovação)

---

## 📝 Histórico de Versões

| Versão | Data | Mudanças | Aprovado por |
|--------|------|----------|--------------|
| 1.0 | 06/10/2025 | Versão inicial | Comitê de IA |
| | | | |

---

## 🔗 Referências

- [Regimento do Comitê de IA](./regimento-comite-ia.md)
- [AI Governance Policy](../../ai-governance/ai-governance-policy.md)
- [Formulário de Aprovação de Modelo IA](./formulario-aprovacao-modelo-ia.md)
- [NIST AI Risk Management Framework](https://www.nist.gov/itl/ai-risk-management-framework)
- [ISO 31000:2018 - Risk Management](https://www.iso.org/iso-31000-risk-management.html)

---

**🔐 Classificação:** CONFIDENCIAL - USO INTERNO  
**📂 Retenção:** Permanente (histórico de versões)  
**🔄 Versão:** 1.0  
**📅 Data:** 2025-10-06
