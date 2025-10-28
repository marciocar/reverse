# Business Continuity Plan (BCP)

> **Framework:** ISO 22301:2019 - Cláusula 8.4  
> **Versão:** 2.0  
> **Data de Aprovação:** [DATA]  
> **Próxima Revisão:** [DATA] (semestral)  
> **Status:** [STATUS]

---

## 📋 **Executive Summary**

O **Business Continuity Plan (BCP)** estabelece estratégias e procedimentos para manter operações críticas durante e após eventos disruptivos que possam impactar os serviços.

Este plano visa garantir:

-  **Disponibilidade** de serviços críticos conforme SLAs definidos
-  **Recovery Time Objective (RTO):** [TEMPO] para serviços core
-  **Recovery Point Objective (RPO):** [TEMPO] (perda mínima de dados)
-  **Testes anuais** de DR (Disaster Recovery) com evidências documentadas
-  **Estratégia de recuperação** adequada ao modelo de negócio

---

## 1. Objetivo

O presente **Plano de Continuidade de Negócios (BCP)** tem como objetivo assegurar que as operações críticas possam continuar em níveis aceitáveis em caso de incidentes, falhas ou desastres que afetem a infraestrutura tecnológica ou processos operacionais.

Este documento complementa os planos de **Recuperação de Desastres (DRP)** e **Política de Backup e Restauração**, detalhando as medidas preventivas, responsáveis e fluxos operacionais que garantem a resiliência e a disponibilidade dos serviços essenciais.

---

## 2. Escopo

O plano cobre os processos de negócio e operacionais diretamente ligados à continuidade das operações, incluindo:

### 2.1. Serviços Cobertos

✅ **Disponibilidade da Aplicação**
- [LISTA DE SERVIÇOS CRÍTICOS]
- [COMPONENTES DE INFRAESTRUTURA]

✅ **Gestão de Incidentes e Comunicação**
- Sistema de tickets/gestão
- Canais de comunicação de crise
- Email/SMS de crise

✅ **Atendimento Técnico**
- Suporte interno/externo
- SLA First Response: [TEMPO]
- Monitoramento [FREQUÊNCIA]

✅ **Acesso e Autenticação**
- Sistema de SSO/Auth
- VPN ou acesso seguro

✅ **Monitoramento e Alertas**
- [FERRAMENTAS DE MONITORAMENTO]

✅ **Gestão de Mudanças (GMUD)**
- Sistema de gerenciamento de mudanças
- Pipeline CI/CD

✅ **Rotina de Backups e Testes de Restauração**
- Estratégia de backup
- Testes programados

### 2.2. Fora do Escopo

❌ **Processos administrativos** não-críticos (RH, financeiro interno, marketing)  
❌ **Sistemas de desenvolvimento e staging** (apenas produção é coberto)  
❌ **Aplicações de backoffice** não-críticas (toleram downtime > 24h)

---

## 3. Processos que Sustentam a Continuidade

### 3.1. Matriz de Processos Críticos

| Processo | Descrição | Ferramenta / Sistema | Frequência | Responsável |
|:---------|:----------|:---------------------|:-----------|:------------|
| **Monitoramento de Disponibilidade** | Acompanhamento contínuo de serviços críticos | [FERRAMENTAS] | [FREQUÊNCIA] | [EQUIPE] |
| **Abertura e Gestão de Chamados** | Registro e tratamento de incidentes | [SISTEMA ITSM] | [FREQUÊNCIA] | [EQUIPE] |
| **Backups e Restauração de Dados** | Execução e verificação de backups conforme RTO/RPO | [SOLUÇÃO DE BACKUP] | [FREQUÊNCIA] | [EQUIPE] |
| **Revisões de SLA e Indicadores** | Análise dos SLAs de suporte, disponibilidade e performance | [SISTEMA DE RELATÓRIOS] | [FREQUÊNCIA] | [RESPONSÁVEL] |
| **Controle de Mudanças (GMUD)** | Planejamento, aprovação e execução de alterações | [SISTEMA GMUD] | [FREQUÊNCIA] | [EQUIPE] |
| **Comunicação com Stakeholders** | Canal direto de escalonamento e atualizações | [CANAIS] | [FREQUÊNCIA] | [RESPONSÁVEL] |
| **Gestão de Acesso Seguro** | Controle de acesso e autenticação | [SISTEMA AUTH] | [FREQUÊNCIA] | [EQUIPE] |

### 3.2. Interdependências

```
┌─────────────────────────────────────────────┐
│        Continuidade de Negócios             │
└─────────────────────────────────────────────┘
                    ↓
        ┌──────────────────────┐
        │    Infraestrutura     │
        └──────────────────────┘
                    ↓
    ┌───────────────────────────────┐
    │    Parceiro/Equipe Responsável │
    └───────────────────────────────┘
                    ↓
    ┌──────────┬──────────┬──────────┐
    │   [EQUIPE│  [EQUIPE] │  [EQUIPE]│
    │     1]   │           │          │
    └──────────┴──────────┴──────────┘
```

**Dependências Críticas**:
1. [DEPENDÊNCIA 1]: [DESCRIÇÃO E MITIGAÇÃO]
2. [DEPENDÊNCIA 2]: [DESCRIÇÃO E MITIGAÇÃO]
3. [DEPENDÊNCIA 3]: [DESCRIÇÃO E MITIGAÇÃO]

---

## 4. Estratégia de Continuidade

### 4.1. Fase 1: Prevenção

**Objetivo**: Evitar interrupções antes que aconteçam

✅ **Monitoramento Proativo [FREQUÊNCIA]**
- [FERRAMENTAS E MÉTRICAS]

✅ **Backups Automáticos e Replicações**
- [ESTRATÉGIA DE BACKUP]
- [FREQUÊNCIAS E RETENÇÃO]

✅ **Controle de Acesso Seguro**
- MFA (Multi-Factor Authentication)
- [SOLUÇÕES DE ACESSO SEGURO]
- IAM/RBAC (Princípio do menor privilégio)
- Audit trail

✅ **Gestão de Mudanças**
- GMUD com aprovações formais
- Janelas de manutenção programadas
- Rollback plan obrigatório

### 4.2. Fase 2: Resposta

**Objetivo**: Agir rapidamente quando incidente ocorre

✅ **Acionamento do Plano de Resposta a Incidentes**
- Detecção via [FERRAMENTAS] (< [TEMPO])
- Abertura de ticket "[TIPO DE INCIDENTE]"
- Comunicação inicial (< [TEMPO])

✅ **Comunicação Imediata**
- [CANAL 1]: [DESCRIÇÃO]
- [CANAL 2]: [DESCRIÇÃO]
- Status updates a cada [TEMPO]

✅ **Prioridade para Serviços Críticos**
- **Tier 0**: [SERVIÇOS CRÍTICOS]
- **Tier 1**: [SERVIÇOS IMPORTANTES]
- **Tier 2**: [SERVIÇOS DE SUPORTE]

**Ver**: `disaster-recovery-plan.md` e `crisis-management.md` para detalhes completos

### 4.3. Fase 3: Recuperação

**Objetivo**: Restaurar serviços no menor tempo possível

✅ **Ativação do DRP** (Plano de Recuperação de Desastres)
- [PROCEDIMENTOS DE RECUPERAÇÃO POR SERVIÇO]

✅ **Restauração de Serviços**
- Ordem de prioridade: Tier 0 → Tier 1 → Tier 2
- Validação pós-restauração (smoke tests)
- Atualização de configurações (se necessário)

✅ **Validação Completa**
- Health checks passando
- Monitoramento ativo
- Stakeholders validam funcionalidade

**Ver**: `disaster-recovery-plan.md` para procedures técnicos

### 4.4. Fase 4: Retorno à Normalidade

**Objetivo**: Garantir estabilização e aprendizado

✅ **Comunicação de Normalização**
- Notificação formal aos stakeholders
- Resumo de downtime e ações tomadas
- Agendar post-mortem ([PRAZO])

✅ **Revisão de Causa Raiz (Post-Mortem)**
- Análise técnica detalhada
- Identificação de causa raiz
- Ações corretivas e preventivas
- Atualização de runbooks

✅ **Atualização de Métricas**
- Relatório de SLA
- Dashboard atualizado
- Lições aprendidas documentadas

**Ver**: `crisis-management.md` (Seção Pós-Crise)

---

## 5. Comunicação e Escalonamento

### 5.1. Matriz de Escalonamento

| Nível | Responsável | Função | Contato | Quando Acionar |
|:------|:------------|:-------|:--------|:---------------|
| **1º Nível** | [RESPONSÁVEL] | Monitoramento e resposta inicial | [CONTATO] | Detecção automática |
| **2º Nível** | [RESPONSÁVEL] | Validação técnica, execução de procedures | [CONTATO] | Imediato após 1º nível |
| **3º Nível** | [RESPONSÁVEL] | Decisões de negócio, aprovação de ações críticas | [CONTATO] | Imediato se necessário |
| **Gerência** | [RESPONSÁVEL] | Coordenação de crise, interface executiva | [CONTATO] | Após [TEMPO] sem resolução |
| **Diretoria** | [RESPONSÁVEL] | Aprovação de ações críticas, comunicação executiva | [CONTATO] | Após [TEMPO] ou desastre grave |

### 5.2. Fluxo de Comunicação em Crise

```
Incidente Detectado
         ↓
    [1º NÍVEL] (< [TEMPO])
         ↓
Ticket Aberto
         ↓
[2º NÍVEL] ← → [STAKEHOLDERS]
         ↓                ↓
Status Update ([FREQUÊNCIA]) → [COMUNICAÇÃO]
         ↓
Escalação (se necessário):
    T+[TEMPO1] → [NÍVEL 3]
    T+[TEMPO2] → [GERÊNCIA]
    T+[TEMPO3] → [DIRETORIA]
         ↓
Resolução
         ↓
Post-Mortem ([PRAZO])
```

### 5.3. Canais de Comunicação

**Internos**:
- [SISTEMA DE TICKETS]: Gerenciamento de incidentes
- [SISTEMA DE MONITORAMENTO]: Alertas automáticos
- [COMUNICAÇÃO INTERNA]: Coordenação de equipes

**Com Stakeholders**:
- [CANAL 1]: [DESCRIÇÃO E USO]
- [CANAL 2]: [DESCRIÇÃO E USO]
- [CANAL 3]: [DESCRIÇÃO E USO]

---

## 6. Análise de Impacto nos Negócios (BIA)

### 6.1. Serviços Críticos e Impactos

| Serviço | Criticidade | Impacto se Indisponível | RTO | RPO |
|:--------|:------------|:------------------------|:----|:----|
| **[SERVIÇO 1]** | 🔴 **CRÍTICO** | [DESCRIÇÃO DO IMPACTO] | [TEMPO] | [TEMPO] |
| **[SERVIÇO 2]** | 🟠 **ALTO** | [DESCRIÇÃO DO IMPACTO] | [TEMPO] | [TEMPO] |
| **[SERVIÇO 3]** | 🟡 **MÉDIO** | [DESCRIÇÃO DO IMPACTO] | [TEMPO] | [TEMPO] |

### 6.2. Estimativa de Impactos por Downtime

| Downtime | Impacto Financeiro | Impacto Reputacional | Impacto Operacional |
|:---------|:-------------------|:---------------------|:--------------------|
| **< 15 min** | Negligível | Baixo | Baixo |
| **15-60 min** | Baixo | Médio | Médio |
| **1-4 horas** | Médio | Alto | Alto |
| **> 4 horas** | Alto | Muito Alto | Crítico |
| **> 24 horas** | Crítico | Catastrófico | Catastrófico |

**Meta de Disponibilidade**: [META] (downtime máximo anual: [TEMPO])

---

## 7. Dependências Externas

### 7.1. Fornecedores e Parceiros Críticos

| Fornecedor | Serviço | Criticidade | Alternativa | Contact |
|:-----------|:--------|:------------|:------------|:--------|
| **[FORNECEDOR 1]** | [DESCRIÇÃO] | 🔴 CRÍTICO | [ALTERNATIVA] | [CONTATO] |
| **[FORNECEDOR 2]** | [DESCRIÇÃO] | 🟠 ALTO | [ALTERNATIVA] | [CONTATO] |

### 7.2. SLAs de Fornecedores

| Fornecedor | SLA Contratual | Uptime Atual | Status |
|:-----------|:---------------|:-------------|:-------|
| **[FORNECEDOR 1]** | [SLA] | [UPTIME] | [STATUS] |
| **[FORNECEDOR 2]** | [SLA] | [UPTIME] | [STATUS] |

---

## 8. Testes e Revisões

### 8.1. Programa de Testes

| Tipo de Teste | Objetivo | Frequência | Próxima Execução | Status |
|:--------------|:---------|:-----------|:-----------------|:-------|
| **BCP Drill** | Simular indisponibilidade e restauração completa | Anual | [DATA] | [STATUS] |
| **DR Drill** | Testar procedures de recovery técnico | Anual | [DATA] | [STATUS] |
| **Tabletop Exercise** | Treinar comunicação e coordenação | Semestral | [DATA] | [STATUS] |
| **Failover Test** | Testar failover automático | Trimestral | [DATA] | [STATUS] |

**Ver**: `resilience-testing.md` para cronograma completo e evidências

### 8.2. Revisão do Plano

**Frequência**: A cada **[PERÍODO]** ou quando houver mudanças significativas

**Próximas Revisões Agendadas**:
- **[DATA 1]**
- **[DATA 2]**

**Responsável**: [CARGO/EQUIPE]

**Gatilhos para Revisão Extraordinária**:
- Mudança de fornecedor crítico
- Incidente grave com lições aprendidas
- Mudança de arquitetura significativa
- Novos requisitos regulatórios/compliance

---

## 9. Indicadores de Desempenho (KPIs)

### 9.1. KPIs de Disponibilidade

| Indicador | Meta | Atual | Status |
|:----------|:-----|:------|:-------|
| **Uptime Geral** | [META] | [ATUAL] | [STATUS] |
| **Downtime Total (mês)** | < [TEMPO] | [ATUAL] | [STATUS] |
| **Incidentes Críticos** | ≤ [NÚMERO]/mês | [ATUAL] | [STATUS] |
| **Zero Data Loss** | 100% | [ATUAL] | [STATUS] |

### 9.2. KPIs de Resposta

| Indicador | Meta | Último Incidente | Status |
|:----------|:-----|:-----------------|:-------|
| **Time to Detect (TTD)** | < [TEMPO] | [TEMPO] | [STATUS] |
| **Time to Response (TTR)** | < [TEMPO] | [TEMPO] | [STATUS] |
| **Time to Resolve (MTTR)** | < [TEMPO] | [TEMPO] | [STATUS] |

### 9.3. KPIs de Testes

| Indicador | Meta | Status |
|:----------|:-----|:-------|
| **Testes Programados Executados** | 100% | [STATUS] |
| **RTO Atingido** | 100% | [STATUS] |
| **Cobertura de Treinamento** | 100% equipe | [STATUS] |

---

## 10. Plano de Melhorias (Roadmap)

### 10.1. [PERÍODO] - [NOME DA INICIATIVA]

**Prioridade**: [CRÍTICA/ALTA/MÉDIA]

**Objetivo**: [DESCRIÇÃO]

**Ações**:
- [ ] [AÇÃO 1]
- [ ] [AÇÃO 2]
- [ ] [AÇÃO 3]

**Impacto no BCP**:
- [IMPACTO 1]
- [IMPACTO 2]

**Budget**: [VALOR]

### 10.2. [PERÍODO] - [NOME DA INICIATIVA]

**Ações**:
- [ ] [AÇÃO 1]
- [ ] [AÇÃO 2]
- [ ] [AÇÃO 3]

**Impacto no BCP**:
- [IMPACTO 1]
- [IMPACTO 2]

---

## 11. Roles e Responsabilidades

### 11.1. [EQUIPE/PARCEIRO 1]

**[CARGO/FUNÇÃO 1]**:
- [RESPONSABILIDADE 1]
- [RESPONSABILIDADE 2]
- [RESPONSABILIDADE 3]

**[CARGO/FUNÇÃO 2]**:
- [RESPONSABILIDADE 1]
- [RESPONSABILIDADE 2]

### 11.2. [EQUIPE INTERNA]

**[CARGO 1]**:
- [RESPONSABILIDADE 1]
- [RESPONSABILIDADE 2]

**[CARGO 2]**:
- [RESPONSABILIDADE 1]
- [RESPONSABILIDADE 2]

---

## 12. Conclusão

### 12.1. Situação Atual

O presente plano confirma que a organização dispõe de:

✅ **Processos maduros e documentados** para garantir a continuidade das operações  
✅ **Monitoramento [FREQUÊNCIA]** via [FERRAMENTAS]  
✅ **SLAs atingidos**: [VALOR] (acima/conforme meta de [META])  
✅ **Backups automatizados**: RPO de [TEMPO]  
✅ **Documentação integrada e auditável**: BCP, DRP, Crisis, Backup

**Roadmap de Evolução**:
- 🎯 [EVOLUÇÃO 1] → [PRAZO]
- 🎯 [EVOLUÇÃO 2] → [PRAZO]
- 🎯 [EVOLUÇÃO 3] → [PRAZO]

### 12.2. Compromisso de Melhoria Contínua

A organização reafirma seu compromisso com:

🎯 **[INICIATIVA 1] em [PRAZO]** ([OBJETIVO])  
🎯 **[INICIATIVA 2] a partir de [PRAZO]** ([OBJETIVO])  
🎯 **[CERTIFICAÇÕES] até [PRAZO]**  
🎯 **Revisões [FREQUÊNCIA]** deste plano

---

## 13. Documentos Relacionados

| Documento | Descrição | Link |
|:----------|:----------|:-----|
| **disaster-recovery-plan.md** | Procedures técnicos de recovery | [Link] |
| **crisis-management.md** | Comunicação e escalonamento em crises | [Link] |
| **recovery-objectives.md** | RPO/RTO, backups, retenção | [Link] |
| **resilience-testing.md** | Programa de testes e evidências | [Link] |

---

## 14. Controle de Versões

| Versão | Data | Mudanças Principais | Responsável |
|:-------|:-----|:--------------------|:------------|
| 2.0 | [DATA] | Reestruturação baseada em ISO 22301:2019 | [RESPONSÁVEL] |
| 1.0 | [DATA] | Versão inicial | [RESPONSÁVEL] |

---

**Documento Preparado Por**: [RESPONSÁVEL]  
**Próxima Revisão**: [DATA]  
**Status**: [STATUS]

---

**🔐 Classificação:** [CLASSIFICAÇÃO]  
**📂 Retenção:** [PERÍODO]  
**🔄 Última Atualização:** [DATA]  
**✅ Status:** [STATUS]
