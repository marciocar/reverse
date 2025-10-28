---
meeting_number: "[Número sequencial - ex: 001/2025]"
meeting_date: "[DD/MM/YYYY]"
meeting_type: "Ordinária" # ou "Extraordinária"
meeting_start_time: "[HH:MM]"
meeting_end_time: "[HH:MM]"
location: "[Presencial/Remoto/Híbrido]"
secretary: "[Nome do Secretário]"
version: "1.0"
classification: "CONFIDENCIAL - USO INTERNO"
---

# Ata de Reunião - Comitê de Inteligência Artificial

**{{COMPANY_NAME}} - INFRATECH DE RECEBÍVEIS**

---

## 📋 Identificação

**Número da Reunião:** [Número sequencial - ex: 001/2025]  
**Tipo:** [ ] Ordinária [ ] Extraordinária  
**Data:** [DD/MM/YYYY]  
**Horário:** [HH:MM] às [HH:MM] ([X] horas de duração)  
**Local:** [ ] Presencial [ ] Remoto (Google Meet/Zoom) [ ] Híbrido  
**Link da Reunião (se remoto):** [URL]

---

## 👥 Participantes

### Membros Permanentes

| Nome | Cargo | Status |
|------|-------|--------|
| [Nome do CTO] | CTO - Presidente | [ ] Presente [ ] Ausente |
| [Nome do AI Engineer] | AI Engineer / Tech Lead | [ ] Presente [ ] Ausente |
| [Nome do Product Manager] | Product Manager | [ ] Presente [ ] Ausente |
| [Nome do CISO] | CISO (Compliance) | [ ] Presente [ ] Ausente |

**Quórum:** [N] de 4 membros permanentes presentes ([%]%)  
**Status do Quórum:** [ ] ✅ Deliberativo (≥3) [ ] ⚠️ Consultivo (<3)

---

### Convidados (Não Votantes)

| Nome | Cargo/Função | Justificativa da Presença |
|------|--------------|---------------------------|
| [Nome] | [Cargo] | [Ex: "Apresentação de novo modelo de fraud detection"] |
| [Nome] | [Cargo] | [Ex: "Consultoria jurídica sobre EU AI Act"] |

---

### Ausências Justificadas

| Nome | Cargo | Motivo |
|------|-------|--------|
| [Nome] | [Cargo] | [Ex: "Viagem de negócios"] |

---

## 📝 Pauta

### 1. Abertura
- Verificação de quórum
- Aprovação da pauta
- Aprovação da ata anterior ([Número da ata anterior])

### 2. Revisão de KPIs Trimestrais (Q[N]/[YYYY])

**KPIs de Performance:**

| Métrica | Target | Q Anterior | Q Atual | Variação | Status |
|---------|--------|-----------|---------|----------|--------|
| **Accuracy Rate** | > 85% | [%]% | [%]% | [+/-X]% | ✅/⚠️/❌ |
| **User Satisfaction** | > 4.0/5.0 | [X.X] | [X.X] | [+/-X.X] | ✅/⚠️/❌ |
| **Escalation Rate** | < 30% | [%]% | [%]% | [+/-X]% | ✅/⚠️/❌ |
| **Bias Incidents** | 0 | [N] | [N] | [+/-N] | ✅/⚠️/❌ |
| **Security Incidents** | 0 | [N] | [N] | [+/-N] | ✅/⚠️/❌ |
| **Response Time (p95)** | < 3s | [X.X]s | [X.X]s | [+/-X.X]s | ✅/⚠️/❌ |

**Base:** [AI Governance Policy - Métricas](../../ai-governance/ai-governance-policy.md#métricas-de-performance-e-governança)

**Score Geral:** [N]/6 metas atingidas ([%]%)

---

### 3. Processos de Monitoramento

**3.1 Revisão Humana Semanal (~13 semanas = ~1.300 conversas auditadas)**

| Semana | Conversas Auditadas | Issues Identificados | Ações Tomadas |
|--------|---------------------|----------------------|---------------|
| [Data] | [N] | [Descrição] | [Ação] |
| ... | ... | ... | ... |

**Resumo:** [Descrição executiva dos principais achados]

---

**3.2 Automated Bias Detection (Diário)**

- **Total de Alertas no Trimestre:** [N]
- **Falsos Positivos:** [N] ([%]%)
- **Issues Reais:** [N]
- **Ações Corretivas:** [Descrever]

---

**3.3 Red Team Testing (Mensal)**

| Mês | Scenarios Testados | Vulnerabilidades Identificadas | Mitigação |
|-----|-------------------|-------------------------------|-----------|
| [Mês 1] | [N] | [Descrição] | [Status] |
| [Mês 2] | [N] | [Descrição] | [Status] |
| [Mês 3] | [N] | [Descrição] | [Status] |

**Resumo:** [Descrição executiva]

---

### 4. Model Registry e Change Management

**4.1 Modelos em Produção**

| Modelo | Versão Atual | Desde | Performance | Status |
|--------|--------------|-------|-------------|--------|
| GPT-4 (ChatBot) | gpt-4-2024-08 | [DD/MM/YYYY] | ✅ Estável | ✅ Produção |
| [Futuro: Credit Scoring ML] | - | - | - | ⏳ Desenvolvimento |

---

**4.2 Mudanças de Modelo no Trimestre**

| Data | Mudança | Motivo | Aprovação | Testing | Rollback Plan |
|------|---------|--------|-----------|---------|---------------|
| [DD/MM] | [Descrição] | [Motivo] | ✅ Aprovado | ✅ 1 semana staging | ✅ Documentado |

**Se nenhuma mudança:** _"Nenhuma mudança de modelo realizada neste trimestre."_

---

### 5. Vendor Management

**5.1 OpenAI (GPT-4)**

- **SLA de Uptime:** 99.9% (Target: 99.9%)
- **Uptime Real no Trimestre:** [%]%
- **Incidentes de Indisponibilidade:** [N]
- **Duração Total de Downtime:** [X] minutos
- **Compliance SOC 2 Type II:** ✅ Certificado válido até [DD/MM/YYYY]

**Status:** ✅ Dentro do esperado / ⚠️ Atenção necessária

---

### 6. Guardrails e Segurança

**6.1 Input Validation Triggers**

- **Total de Inputs Bloqueados:** [N]
- **Motivos:**
  - Dados sensíveis (CPF, senhas): [N]
  - Prompt injection: [N]
  - Linguagem ofensiva: [N]
  - Fora do escopo: [N]

**Análise:** [Descrever se padrão esperado ou se há anomalias]

---

**6.2 Output Validation Triggers**

- **Total de Outputs Bloqueados:** [N]
- **Motivos:**
  - Conteúdo sensível: [N]
  - Viés detectado: [N]
  - Tone check failed: [N]

**Análise:** [Descrever]

---

**6.3 Rate Limiting Incidents**

- **Usuários bloqueados por abuse:** [N]
- **Ação Tomada:** [Ex: "Bloqueio temporário de IP, análise de padrão de uso"]

---

### 7. Conformidade LGPD e Privacidade

**7.1 Compliance Checklist**

- [ ] ✅ Conversas NÃO armazenadas (apenas metadados)
- [ ] ✅ Retenção de metadados: 90 dias (conforme política)
- [ ] ✅ Disclaimer de interação com IA exibido aos usuários
- [ ] ✅ Opção de escalação para humano disponível
- [ ] ✅ Nenhum dado da Serasa compartilhado com OpenAI
- [ ] ✅ Logs de auditoria funcionando corretamente

**Incidentes de Privacidade:** [N]

**Se houver incidentes:** [Descrever + ações corretivas]

---

### 8. Aprovações de Modelos / Mudanças Críticas

**8.1 Proposta: [Descrição da Proposta]**

**Tipo:** [ ] Novo Modelo [ ] Mudança de Versão [ ] Novo Caso de Uso [ ] Mudança em Guardrails

**Apresentador:** [Nome + Cargo]

**Resumo da Apresentação:**
[Descrição executiva da proposta, incluindo objetivos, riscos identificados, plano de mitigação]

**Documentação de Apoio:**
- [ ] Formulário de Aprovação de Modelo IA preenchido
- [ ] Matriz de Risco IA atualizada
- [ ] Plano de Testing (staging)
- [ ] Rollback Plan documentado

---

**Discussão:**

**Questões Levantadas pelos Membros:**

1. **[Nome do Membro]:** [Questão/Preocupação]
   - **Resposta:** [Resposta do apresentador]

2. **[Nome do Membro]:** [Questão/Preocupação]
   - **Resposta:** [Resposta]

3. [...]

---

**Votação:**

| Membro | Voto | Justificativa (se houver) |
|--------|------|---------------------------|
| [Nome CTO] | [ ] A favor [ ] Contra [ ] Abstenção | |
| [Nome AI Engineer] | [ ] A favor [ ] Contra [ ] Abstenção | |
| [Nome Product Manager] | [ ] A favor [ ] Contra [ ] Abstenção | |
| [Nome CISO] | [ ] A favor [ ] Contra [ ] Abstenção | |

**Resultado:** [X] a favor, [Y] contra, [Z] abstenções

**Decisão Final:**

[ ] ✅ **APROVADO** - Autorizado deploy após testing em staging (1 semana)  
[ ] ⚠️ **APROVADO COM CONDIÇÕES** - [Especificar condições obrigatórias]  
[ ] ❌ **REJEITADO** - [Especificar motivos]

**Próximos Passos:**
1. [Ação + Responsável + Prazo]
2. [Ação + Responsável + Prazo]
3. [...]

---

### 9. Análise de Incidentes (Se Aplicável)

**9.1 Incidente: [Descrição do Incidente]**

**Data/Hora do Incidente:** [DD/MM/YYYY HH:MM]

**Severidade:** [ ] Crítica [ ] Alta [ ] Média [ ] Baixa

**Resumo:**
[Descrição clara do que aconteceu, quantos usuários foram impactados, evidências]

**Causa Raiz:**
[Análise técnica da causa]

**Impacto:**
- Usuários afetados: [N]
- Duração: [X] minutos/horas
- Risco reputacional: [ ] Alto [ ] Médio [ ] Baixo

**Ações Imediatas Tomadas:**
1. [Ação + Responsável + Quando]
2. [...]

**Plano de Ação Corretiva:**

| Ação | Responsável | Prazo | Status |
|------|-------------|-------|--------|
| [Ação 1] | [Nome] | [DD/MM] | ⏳ Pendente |
| [Ação 2] | [Nome] | [DD/MM] | 🔵 Em progresso |
| [Ação 3] | [Nome] | [DD/MM] | ✅ Concluído |

**Follow-up Obrigatório:** [ ] Sim (próxima reunião ordinária) [ ] Não necessário

---

### 10. Revisão de Políticas e Diretrizes

**10.1 Política de Governança de IA**

- **Última Revisão:** [DD/MM/YYYY]
- **Próxima Revisão:** [DD/MM/YYYY] (Anual)
- **Mudanças Propostas:** [Descrever ou "Nenhuma mudança proposta"]

**Aprovação de Mudanças:**

[ ] Não há mudanças  
[ ] Mudanças aprovadas (especificar versão: [X.Y])  
[ ] Mudanças rejeitadas / adiadas

---

### 11. Auditorias Planejadas

**11.1 Auditoria Interna de IA**

- **Última Auditoria:** [DD/MM/YYYY]
- **Próxima Auditoria:** [DD/MM/YYYY] (Trimestral/Semestral)
- **Escopo:** [Ex: "Revisão completa de guardrails, bias detection, compliance LGPD"]

**11.2 Auditoria Externa**

- **Planejada para:** [Semestre/Ano]
- **Auditor:** [Nome da empresa ou "A contratar"]
- **Orçamento:** R$ [valor]

---

### 12. Outros Assuntos

**12.1 [Assunto 1]**

[Descrição]

**Decisão/Ação:** [Decisão tomada + responsável + prazo]

---

**12.2 [Assunto 2]**

[Descrição]

**Decisão/Ação:** [Decisão tomada + responsável + prazo]

---

## ✅ Decisões e Deliberações Consolidadas

| # | Decisão | Tipo | Resultado | Responsável | Prazo |
|---|---------|------|-----------|-------------|-------|
| 1 | [Decisão 1] | Aprovação/Rejeição/Orientação | [Aprovado/Rejeitado] | [Nome] | [DD/MM] |
| 2 | [Decisão 2] | Aprovação/Rejeição/Orientação | [Aprovado/Rejeitado] | [Nome] | [DD/MM] |
| 3 | [...] | | | | |

---

## 📋 Action Items

| # | Ação | Responsável | Prazo | Status |
|---|------|-------------|-------|--------|
| 1 | [Ação 1] | [Nome] | [DD/MM/YYYY] | ⏳ Pendente |
| 2 | [Ação 2] | [Nome] | [DD/MM/YYYY] | ⏳ Pendente |
| 3 | [...] | | | |

---

## 📅 Próxima Reunião

**Tipo:** [ ] Ordinária [ ] Extraordinária

**Data Prevista:** [DD/MM/YYYY]

**Horário:** [HH:MM] às [HH:MM]

**Local:** [ ] Presencial [ ] Remoto [ ] Híbrido

**Pauta Preliminar:**
1. Aprovação da ata desta reunião
2. Revisão de KPIs Q[N+1]/[YYYY]
3. [Outros itens já conhecidos]

---

## 📝 Encerramento

**Horário de Encerramento:** [HH:MM]

**Observações Finais:**
[Qualquer observação relevante não coberta acima]

---

## ✍️ Assinaturas

### **Secretário da Reunião:**

---

**Nome:** [Nome do Secretário]  
**Cargo:** [Cargo]  
**Data:** [DD/MM/YYYY]  
**Assinatura:** ______________________________

---

### **Presidente do Comitê:**

---

**Nome:** [Nome do CTO]  
**Cargo:** CTO - Presidente do Comitê de IA  
**Data:** [DD/MM/YYYY]  
**Assinatura:** ______________________________

---

### **Aprovação desta Ata (Reunião Seguinte):**

**Data de Aprovação:** [DD/MM/YYYY]

**Aprovado por:** [Nome dos membros presentes na reunião seguinte]

**Assinatura do Presidente:** ______________________________

---

## 📎 Anexos

**Documentos anexos a esta ata:**

- [ ] Anexo I: Apresentação de aprovação de modelo ([Nome do arquivo])
- [ ] Anexo II: Relatório Trimestral de Monitoramento
- [ ] Anexo III: Relatório de Incidente ([ID do incidente])
- [ ] Anexo IV: [Outros documentos]

---

## 🔗 Referências

- [Regimento do Comitê de IA](./regimento-comite-ia.md)
- [AI Governance Policy](../../ai-governance/ai-governance-policy.md)
- [Pauta Trimestral Padrão](./pauta-trimestral-ia.md)
- [Template de Decisão com Votação](../_shared/template-decisao-votacao.md)

---

**🔐 Classificação:** CONFIDENCIAL - USO INTERNO  
**📂 Armazenamento:** `/compliance/ai-governance/comite/atas/[ano]/ata-[número].md`  
**🔄 Versão da Ata:** 1.0  
**📅 Data de Elaboração:** [DD/MM/YYYY]

---

## 📝 Exemplo Preenchido (Referência)

<details>
<summary>Clique para ver exemplo de ata preenchida</summary>

**Número da Reunião:** 001/2025  
**Tipo:** Ordinária  
**Data:** 15/03/2025  
**Horário:** 14:00 às 16:30 (2h30 de duração)  
**Local:** Remoto (Google Meet)

### Participantes

**Membros Permanentes Presentes:**
- João Silva (CTO - Presidente) ✅
- Maria Santos (AI Engineer) ✅
- Pedro Oliveira (Product Manager) ✅
- Ana Costa (CISO) ✅

**Quórum:** 4/4 (100%) ✅ Deliberativo

### Resumo das Decisões

1. **KPIs Q1/2025:** Todas as metas atingidas (6/6) ✅
2. **Aprovação GPT-4-Turbo:** Aprovado por unanimidade (4-0) para testing em staging
3. **Plano de Auditoria Externa:** Aprovado contratação de auditor para Q3/2025

### Próxima Reunião

**Data:** 14/06/2025 (Q2 Ordinária)

</details>

---

**📞 Contatos:**
- **Comitê de IA:** comite-ia@{{COMPANY_DOMAIN}}
- **CTO:** {{CTO_EMAIL}}
