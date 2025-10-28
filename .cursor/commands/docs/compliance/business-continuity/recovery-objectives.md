# Recovery Objectives - RTOs e RPOs

> **Framework:** ISO 22301:2019 - Cláusula 8.4.2  
> **Versão:** 2.0  
> **Data de Aprovação:** [DATA]  
> **Próxima Revisão:** [DATA] (semestral)  
> **Status:** [STATUS]

---

## 📋 **Executive Summary**

Este documento estabelece os **Recovery Objectives** (Objetivos de Recuperação), definindo:

-  **RTO (Recovery Time Objective):** Tempo máximo aceitável para restaurar serviços
-  **RPO (Recovery Point Objective):** Perda máxima aceitável de dados
-  **MTPD (Maximum Tolerable Period of Disruption):** Tempo máximo de interrupção antes de impacto irreversível
-  **WRT (Work Recovery Time):** Tempo para restaurar nível de serviço normal pós-recovery

**Compliance**: [VALOR] uptime ✅ [COMPARAÇÃO COM SLA]

---

## 1. Visão Geral

Este documento detalha as políticas e procedimentos de backup e restauração para os principais serviços, com foco em definir **RPOs** e **RTOs** para garantir a continuidade dos negócios e atender aos requisitos de conformidade.

**Estratégia**: [DESCRIÇÃO]  
**Região**: [LOCALIZAÇÃO]

---

## 2. Definições e Conceitos

### 2.1. RTO (Recovery Time Objective)

**Definição:** Tempo máximo aceitável entre a **interrupção de um serviço** e sua **restauração**.

**Exemplo:** Se RTO = 2 horas, o serviço deve voltar a operar em no máximo 2 horas após falha.

```
Interrupção → Detecção → Resposta → Recovery → Serviço Restaurado
├────────────────────── RTO ──────────────────────┤
```

**Fatores que influenciam RTO:**
- Criticidade do serviço (core vs auxiliar)
- Impacto financeiro de downtime
- SLAs contratuais com stakeholders
- Disponibilidade de recursos (equipe, infraestrutura)
- Complexidade de recovery procedures

---

### 2.2. RPO (Recovery Point Objective)

**Definição:** Quantidade máxima aceitável de **perda de dados** em caso de desastre, medida em tempo.

**Exemplo:** Se RPO = 15 minutos, podemos perder no máximo 15 minutos de transações.

```
Último Backup ← ← ← RPO ← ← ← Disaster
(dados salvos)              (dados perdidos)
```

**Fatores que influenciam RPO:**
- Valor dos dados (transações financeiras vs logs)
- Frequência de mudanças (alta vs baixa)
- Capacidade de reprocessamento
- Custo de backup contínuo

---

### 2.3. MTPD (Maximum Tolerable Period of Disruption)

**Definição:** Tempo máximo que um processo de negócio pode ficar **interrompido** antes de causar **impacto irreversível** à organização.

**Exemplo:** MTPD de 24 horas significa que após 24h de downtime, danos irreversíveis podem ocorrer.

```
Interrupção → RTO → MTPD
              ├─ Serviço restaurado ✅
                            ├─ Impacto irreversível ❌
```

**MTPD sempre > RTO** (margem de segurança)

---

### 2.4. WRT (Work Recovery Time)

**Definição:** Tempo necessário para **processar o backlog** acumulado durante o downtime e **retornar ao nível de serviço normal**.

**Exemplo:** Serviço voltou após 2h (RTO), mas há 2h de transações enfileiradas. WRT = tempo para processar essa fila.

```
Disaster → RTO (serviço restaurado) → WRT (backlog processado) → Normal
├───────────────────────────────────────────────────────────────┤
                            MTPD (não deve exceder)
```

---

## 3. Resumo Executivo de RPO e RTO

### 3.1. Objetivos Atuais

| Serviço | Recovery Point Objective (RPO) | Recovery Time Objective (RTO) | Método |
|:--------|:-------------------------------|:------------------------------|:-------|
| **[SERVIÇO 1]** | [TEMPO] | [TEMPO] | [MÉTODO] |
| **[SERVIÇO 2]** | [TEMPO] | [TEMPO] | [MÉTODO] |
| **[SERVIÇO 3]** | [TEMPO] | [TEMPO] | [MÉTODO] |

### 3.2. Objetivos Futuros (Se aplicável)

| Serviço | RPO Target | RTO Target | Método Planejado |
|:--------|:-----------|:-----------|:-----------------|
| **[SERVIÇO 1]** | [TEMPO] | [TEMPO] | [MÉTODO] |
| **[SERVIÇO 2]** | [TEMPO] | [TEMPO] | [MÉTODO] |

**Status Roadmap**: [DESCRIÇÃO E PRAZO]

---

## 4. Planos de Backup

### 4.1. Plano: [NOME DO PLANO]

**Objetivo**: Proteger [DESCRIÇÃO DOS RECURSOS]

**Configuração**:
- **Recursos Abrangidos**: [CRITÉRIO DE SELEÇÃO]
- **Destino**: [LOCALIZAÇÃO]
- **Regra**: [NOME DA REGRA]

**Frequências e Retenção**:

| Frequência | Execução | Retenção | RPO Efetivo |
|:-----------|:---------|:---------|:------------|
| **Diária** | [HORÁRIO] | [PERÍODO] | [TEMPO] |
| **Semanal** | [HORÁRIO] | [PERÍODO] | [TEMPO] |
| **Mensal** | [HORÁRIO] | [PERÍODO] | [TEMPO] |
| **Anual** | [HORÁRIO] | [PERÍODO] | [TEMPO] |

### 4.2. [TIPO DE BACKUP ESPECIAL] (Se aplicável)

**[SERVIÇO]**  
**[CARACTERÍSTICA] Habilitado**: [SIM/NÃO]  
**Retention Period**: [PERÍODO]  
**RPO [TIPO]**: [TEMPO]

**Casos de Uso**:
-  [CASO 1]
-  [CASO 2]
-  [CASO 3]

**Procedimento de Restauração**:
1. [PASSO 1]
2. [PASSO 2]
3. [PASSO 3]
4. [VALIDAÇÃO]

**RTO Estimado**: [TEMPO]

---

## 5. Recovery Objectives por Serviço

### 5.1. Classificação de Criticidade

| Tier | Criticidade | RTO | RPO | MTPD | Exemplo de Serviços |
|------|-------------|-----|-----|------|---------------------|
| **Tier 0** | ⭐⭐⭐⭐⭐ Crítico | [TEMPO] | [TEMPO] | [TEMPO] | [EXEMPLOS] |
| **Tier 1** | ⭐⭐⭐⭐ Alto | [TEMPO] | [TEMPO] | [TEMPO] | [EXEMPLOS] |
| **Tier 2** | ⭐⭐⭐ Médio | [TEMPO] | [TEMPO] | [TEMPO] | [EXEMPLOS] |
| **Tier 3** | ⭐⭐ Baixo | [TEMPO] | [TEMPO] | [TEMPO] | [EXEMPLOS] |
| **Tier 4** | ⭐ Não-crítico | [TEMPO] | N/A | N/A | [EXEMPLOS] |

---

### 5.2. Tier 0: Serviços CRÍTICOS (⭐⭐⭐⭐⭐)

#### [SERVIÇO 1]

**RTO:** [TEMPO]  
**RPO:** [TEMPO]  
**MTPD:** [TEMPO]  
**WRT:** [TEMPO]

**Justificativa:**
- [RAZÃO 1]
- [RAZÃO 2]
- Impacto: [DESCRIÇÃO]

**Strategy:**
- [ESTRATÉGIA 1]
- [ESTRATÉGIA 2]
- [ESTRATÉGIA 3]

**Evidências de Conformidade ([PERÍODO]):**
- Uptime: [VALOR] [STATUS]
- Incidentes: [NÚMERO]
- Mean time to detect (MTTD): [TEMPO]

---

#### [SERVIÇO 2]

**RTO:** [TEMPO]  
**RPO:** [TEMPO]  
**MTPD:** [TEMPO]  
**WRT:** [TEMPO]

**Justificativa:**
- [RAZÃO 1]
- [RAZÃO 2]
- Receita bloqueada: [VALOR]
- Multas contratuais (SLA): [VALOR]

**Strategy:**
- [ESTRATÉGIA 1]
- [ESTRATÉGIA 2]
- [ESTRATÉGIA 3]

**Evidências de Conformidade ([PERÍODO]):**
- Uptime: [VALOR] [STATUS]
- Incidentes P0: [NÚMERO]
- RPO atingido: [TEMPO]

---

### 5.3. Tier 1: Serviços ALTOS (⭐⭐⭐⭐)

#### [SERVIÇO 3]

**RTO:** [TEMPO]  
**RPO:** [TEMPO]  
**MTPD:** [TEMPO]  
**WRT:** [TEMPO]

**Justificativa:**
- [RAZÃO 1]
- Impacto: [DESCRIÇÃO]

**Strategy:**
- [ESTRATÉGIA 1]
- [ESTRATÉGIA 2]

**Evidências de Conformidade ([PERÍODO]):**
- Uptime: [VALOR] [STATUS]
- Incidentes: [NÚMERO]

---

## 6. Estratégia de Backup por Serviço

### 6.1. [SERVIÇO PRINCIPAL]

**Estratégia Multi-Camada**:

| Camada | Método | Frequência | Retenção | RPO | RTO |
|:-------|:-------|:-----------|:---------|:----|:----|
| **1. [CAMADA 1]** | [MÉTODO] | [FREQ] | [TEMPO] | [TEMPO] | [TEMPO] |
| **2. [CAMADA 2]** | [MÉTODO] | [FREQ] | [TEMPO] | [TEMPO] | [TEMPO] |
| **3. [CAMADA 3]** | [MÉTODO] | [FREQ] | [TEMPO] | [TEMPO] | [TEMPO] |
| **4. [CAMADA 4]** | [MÉTODO] | [FREQ] | [TEMPO] | [TEMPO] | [TEMPO] |

**Prioridade de Recuperação**: 
1. **[CAMADA 1]** (se [CONDIÇÃO])
2. [CAMADA 2] (se [CONDIÇÃO])

**[CARACTERÍSTICA IMPORTANTE]**: [DESCRIÇÃO]

### 6.2. [OUTROS SERVIÇOS]

| [TIPO] | ID | Backup | Frequência | RPO | RTO |
|:-------|:---|:-------|:-----------|:----|:----|
| **[SERVIÇO A]** | [ID] | [MÉTODO] | [FREQ] | [TEMPO] | [TEMPO] |
| **[SERVIÇO B]** | [ID] | [MÉTODO] | [FREQ] | [TEMPO] | [TEMPO] |

**Método**: [DESCRIÇÃO]  
**Local**: [DESTINO]  
**Critério**: [SELEÇÃO]

**Procedimento**:
- [PASSO 1]
- [PASSO 2]
- [PASSO 3]
- [PASSO 4]

---

## 7. Procedimentos de Teste de Restauração

### 7.1. Status Atual

| Teste | Última Execução | Próximo Teste | Status |
|:------|:----------------|:--------------|:-------|
| **[TESTE 1]** | [DATA] | [DATA] | [STATUS] |
| **[TESTE 2]** | [DATA] | [DATA] | [STATUS] |
| **[TESTE 3]** | [DATA] | [DATA] | [STATUS] |
| **[TESTE 4]** | [DATA] | [DATA] | [STATUS] |

**Roadmap de Testes**:
- **[PERÍODO]**: [DESCRIÇÃO]
- **[PERÍODO]**: [DESCRIÇÃO]

### 7.2. Procedimentos de Teste (Futuro)

**Teste 1: [NOME] ([FREQUÊNCIA])**
1. [PASSO 1]
2. [PASSO 2]
3. [PASSO 3]
4. [PASSO 4]
5. [DOCUMENTAÇÃO]

**Teste 2: [NOME] ([FREQUÊNCIA])**
1. [PASSO 1]
2. [PASSO 2]
3. [PASSO 3]
4. [DOCUMENTAÇÃO]

---

## 8. Monitoramento de Backups

### 8.1. Validação Automática

**Sistema de Monitoramento**:
- Monitoramento via [FERRAMENTA 1]
- Alertas no [FERRAMENTA 2]
- Status em [FERRAMENTA 3]

**Métricas Monitoradas**:
-  Taxa de sucesso: [META] (objetivo)
-  Tamanho de backup (variação suspeita)
-  Duração do job (< [TEMPO])
-  Espaço em storage (< [PERCENTUAL])

### 8.2. Alertas Configurados

| Alerta | Condição | Ação | Responsável |
|:-------|:---------|:-----|:------------|
| Backup falhou | [CONDIÇÃO] | [AÇÃO] | [EQUIPE] |
| Backup atrasado | [CONDIÇÃO] | [AÇÃO] | [EQUIPE] |
| Storage cheio | [CONDIÇÃO] | [AÇÃO] | [EQUIPE] |
| [CARACTERÍSTICA] desabilitado | [CONDIÇÃO] | [AÇÃO] | [EQUIPE] |

---

## 9. Retenção e Compliance

### 9.1. Política de Retenção

| Tipo de Backup | Retenção Mínima | Retenção Máxima | Razão |
|:---------------|:----------------|:----------------|:------|
| **[TIPO 1]** | [TEMPO] | [TEMPO] | [JUSTIFICATIVA] |
| **[TIPO 2]** | [TEMPO] | [TEMPO] | [JUSTIFICATIVA] |
| **[TIPO 3]** | [TEMPO] | [TEMPO] | [JUSTIFICATIVA] |
| **[TIPO 4]** | [TEMPO] | [TEMPO] | [JUSTIFICATIVA] |

### 9.2. Compliance e Regulatório

**[REGULAÇÃO 1]**:
-  Backups criptografados ([MÉTODO])
-  Acesso restrito ([MÉTODO])
-  Audit trail ([SISTEMA])
-  Retention conforme necessidade

**Auditoria**:
- [MÉTODO 1]
- [MÉTODO 2]
- [MÉTODO 3]

---

## 10. Monitoramento e Alertas

### 10.1. Monitoramento de Compliance (RTO/RPO)

**Métricas Coletadas**:
```
RTO Tracking:
├── Time to Detect (MTTD): [DESCRIÇÃO]
├── Time to Respond (MTTR): [DESCRIÇÃO]
├── Time to Resolve (MTTR): [DESCRIÇÃO]
└── Total Downtime: [CÁLCULO]

RPO Tracking:
├── Last Successful Backup Timestamp
├── Replication Lag
├── Backup Failure Rate
└── Data Loss Simulation
```

**Dashboards:**
- [FERRAMENTA 1]: `[LINK]`
- [FERRAMENTA 2]: [DESCRIÇÃO]

---

### 10.2. Alertas Críticos

| Alert | Threshold | Severity | Action | Responsible |
|-------|-----------|----------|--------|-------------|
| **Serviço Down > [TEMPO]** | [CONDIÇÃO] | CRITICAL | [AÇÃO] | [RESPONSÁVEL] |
| **Replication Lag > [TEMPO]** | [CONDIÇÃO] | HIGH | [AÇÃO] | [RESPONSÁVEL] |
| **Backup Failure** | [CONDIÇÃO] | HIGH | [AÇÃO] | [RESPONSÁVEL] |
| **Replicação Lag > [TEMPO]** | [CONDIÇÃO] | MEDIUM | [AÇÃO] | [RESPONSÁVEL] |
| **Last Backup Age > [TEMPO]** | [CONDIÇÃO] | HIGH | [AÇÃO] | [RESPONSÁVEL] |

**Notification Channels:**
- [CANAL 1]
- [CANAL 2]
- [CANAL 3]

---

## 11. SLAs Contratuais

### 11.1. Commitment com Stakeholders

**[STAKEHOLDER 1]:**
- **Availability SLA:** [VALOR] uptime mensal
- **Penalidade:** [DESCRIÇÃO]
- **Máximo de downtime permitido:** [TEMPO] ([PERCENTUAL])
- **Atual ([PERÍODO]):** [VALOR] [STATUS]

**[OUTROS STAKEHOLDERS]:**
- **Availability SLA:** [VALOR] (padrão)
- **RTO Garantido:** < [TEMPO] para serviços Tier 0 e Tier 1
- **Compensação:** [DESCRIÇÃO]

**Monitoramento de SLA:**
- Status Page: `[LINK]`
- SLA Report: [DESCRIÇÃO]
- SLA Dashboard: `[LINK]`

---

## 12. Histórico de Conformidade

### 12.1. Performance de RTO/RPO (Últimos [PERÍODO])

| Incidente | Data | Serviço | RTO Meta | RTO Atingido | Status | RPO Meta | RPO Atingido | Status |
|-----------|------|---------|----------|--------------|--------|----------|--------------|--------|
| [INC-1] | [DATA] | [SERVIÇO] | [TEMPO] | [TEMPO] | [STATUS] | [TEMPO] | [TEMPO] | [STATUS] |
| [INC-2] | [DATA] | [SERVIÇO] | [TEMPO] | [TEMPO] | [STATUS] | [TEMPO] | [TEMPO] | [STATUS] |

**Success Rate ([PERÍODO]):**
- RTO: [PERCENTUAL]
- RPO: [PERCENTUAL]

**Lessons Learned:**
- Action Item 1: [DESCRIÇÃO] [STATUS]
- Action Item 2: [DESCRIÇÃO] [STATUS]

---

### 12.2. Compliance com SLAs (Últimos [PERÍODO])

| Mês | Uptime | SLA | Status | Downtime Total | Incidentes |
|-----|--------|-----|--------|----------------|------------|
| [MÊS] | [VALOR] | [VALOR] | [STATUS] | [TEMPO] | [NÚMERO] |
| [MÊS] | [VALOR] | [VALOR] | [STATUS] | [TEMPO] | [NÚMERO] |

**Média ([PERÍODO]):** [VALOR] [STATUS]

**Créditos/Compensações Emitidos:** [NÚMERO]

---

## 13. Melhorias Planejadas (Roadmap)

### 13.1. [PERÍODO] - [INICIATIVA]

**Prioridade**: [NÍVEL]

**Objetivo**: [DESCRIÇÃO]

**Ações**:
- [ ] [AÇÃO 1]
- [ ] [AÇÃO 2]
- [ ] [AÇÃO 3]

**Impacto**:
- [IMPACTO 1]
- [IMPACTO 2]

**Budget**: [VALOR]

---

## 14. Responsabilidades

### 14.1. [EQUIPE/PARCEIRO]

**[FUNÇÃO 1]**:
- [RESPONSABILIDADE 1]
- [RESPONSABILIDADE 2]

**[FUNÇÃO 2]**:
- [RESPONSABILIDADE 1]
- [RESPONSABILIDADE 2]

### 14.2. [EQUIPE INTERNA]

**[FUNÇÃO 1]**:
- [RESPONSABILIDADE 1]
- [RESPONSABILIDADE 2]

**[FUNÇÃO 2]**:
- [RESPONSABILIDADE 1]
- [RESPONSABILIDADE 2]

---

## 15. Revisão e Atualização de RTOs/RPOs

### 15.1. Quando Revisar?

**Revisão Obrigatória:**
- [FREQUÊNCIA]
- Após cada incidente [TIPO]
- Mudanças significativas de infraestrutura
- Novos SLAs contratuais

**Revisão Extraordinária:**
- [GATILHO 1]
- [GATILHO 2]
- [GATILHO 3]

**Processo de Revisão:**
1. [PASSO 1]
2. [PASSO 2]
3. [PASSO 3]
4. [PASSO 4]
5. [PASSO 5]
6. [PASSO 6]

---

## 16. Contatos e Suporte

### 16.1. Emergências de Backup/Restore

**[EQUIPE] [FREQUÊNCIA]**:
- [CANAL 1]: [DESCRIÇÃO]
- [CANAL 2]: [DESCRIÇÃO]
- [CANAL 3]: [DESCRIÇÃO]
- [CANAL 4]: [DESCRIÇÃO]

**SLA First Response**: [TEMPO]

### 16.2. Gestão de Backups

**[EQUIPE]**:
- [CANAL 1]: [DESCRIÇÃO]
- [CANAL 2]: [DESCRIÇÃO]
- [REUNIÕES]: [DESCRIÇÃO]

---

## 17. Cross-References

### 17.1. Documentos Relacionados

- `business-continuity-plan.md` - Contexto de processos críticos
- `disaster-recovery-plan.md` - Estratégias de recovery
- `resilience-testing.md` - Evidências de testes de RTO/RPO
- `crisis-management.md` - Gestão de crise

---

## 18. Conclusão

A política de backup e restauração garante:

✅ **RPO de [TEMPO]** para [TIPO DE DADOS]  
✅ **RTO de [TEMPO]** para recuperação [TIPO]  
✅ **Backups automatizados** com múltiplas camadas de retenção  
✅ **Monitoramento [FREQUÊNCIA]** via [FERRAMENTAS]  
✅ **Compliance** com [REGULAÇÕES]

**Próximos Passos**:
1. **[PRAZO]**: [AÇÃO]
2. **[PRAZO]**: [AÇÃO]
3. **[PRAZO]**: [AÇÃO]

**Status Atual**: [STATUS]

---

## 19. Controle de Versões

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
