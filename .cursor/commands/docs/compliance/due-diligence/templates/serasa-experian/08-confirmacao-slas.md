---
title: "Confirmação Formal de SLAs de Disponibilidade"
document_type: "Carta Formal / Declaração Contratual"
classification: "CONFIDENCIAL - USO CONTRATUAL"
version: "1.0"
date: "[DATA]"
owner: "[CEO/CTO]"
review_frequency: "Anual ou por solicitação contratual"
---

# Confirmação Formal de SLAs de Disponibilidade

**[PAPEL TIMBRADO DA [NOME DA EMPRESA]]**

---

**Data:** [DD/MM/AAAA]

**Para:** [Nome do Cliente]  
**Ref:** Confirmação de Service Level Agreements (SLAs) - Contrato [NÚMERO DO CONTRATO]

---

## 1. Declaração Formal

A **[NOME DA EMPRESA]**, inscrita no CNPJ [NÚMERO], com sede em [ENDEREÇO COMPLETO], por meio de seu representante legal abaixo assinado, declara formalmente que:

1. **Compromete-se** a manter os níveis de serviço (SLAs) conforme especificados neste documento;
2. **Garante** a disponibilidade dos serviços de API fornecidos ao cliente **[NOME DO CLIENTE]**;
3. **Implementou** controles técnicos e organizacionais para assegurar o cumprimento dos SLAs;
4. **Monitora** continuamente a disponibilidade e performance dos serviços;
5. **Notificará** o cliente em caso de incidentes que afetem os SLAs conforme procedimentos estabelecidos.

---

## 2. SLAs Confirmados

### 2.1 Disponibilidade (Uptime)

| Serviço | SLA de Disponibilidade | Método de Cálculo | Janela de Medição |
|---------|----------------------|-------------------|-------------------|
| **APIs de Produção (Conjunto)** | **99.9%** (três noves) | `(Minutos Totais - Minutos Indisponíveis) / Minutos Totais × 100` | Mensal (720 horas) |
| **API de Autenticação** | **99.95%** | Idem | Mensal |
| **API de Consulta (Endpoint Principal)** | **99.9%** | Idem | Mensal |
| **API de Atualização** | **99.9%** | Idem | Mensal |
| **Webhooks de Notificações** | **99.5%** | Idem | Mensal |

**Interpretação:**
- **99.9%** de uptime = **até 43 minutos e 49 segundos** de downtime por mês
- **99.95%** de uptime = **até 21 minutos e 54 segundos** de downtime por mês
- **99.5%** de uptime = **até 3 horas e 37 minutos** de downtime por mês

**Downtime Planejado (Manutenção):**
- Janelas de manutenção pré-agendadas (notificação com 72 horas de antecedência) **não são contabilizadas** como downtime.
- Máximo de **2 janelas por trimestre**, cada uma com **até 2 horas de duração**.
- Janelas preferencialmente agendadas para **madrugadas** (02:00 - 06:00 BRT) de **domingos ou feriados**.

### 2.2 Performance (Latência)

| Métrica | SLA | Medição | Janela |
|---------|-----|---------|--------|
| **Latência P95** (95º percentil) | < 500ms | Tempo de resposta de requisições HTTP | Diário |
| **Latência P99** (99º percentil) | < 1000ms | Idem | Diário |
| **Latência Média** | < 200ms | Idem | Diário |

**Interpretação:**
- **P95 < 500ms:** 95% das requisições respondem em menos de 500 milissegundos
- **P99 < 1000ms:** 99% das requisições respondem em menos de 1 segundo

**Exceções:**
- Requisições de timeouts causados por problemas no lado do cliente **não são contabilizadas**.
- Latências de rede fora do controle da [NOME DA EMPRESA] (ISP, AWS) **não são contabilizadas**.

### 2.3 Taxa de Sucesso (Success Rate)

| Métrica | SLA | Medição | Janela |
|---------|-----|---------|--------|
| **Taxa de Sucesso de APIs** | ≥ 99.5% | `(Requisições 2xx + 3xx) / Total de Requisições × 100` | Mensal |

**Interpretação:**
- **≥ 99.5%:** Menos de 0.5% de erros 4xx/5xx (excluindo erros de cliente)

**Exceções:**
- Erros **4xx** causados por requisições inválidas do cliente (autenticação, parâmetros) **não são contabilizados** como falha do serviço.
- Apenas erros **5xx** (erros de servidor) são contabilizados como falha.

---

## 3. Objetivos de Recuperação (RTO/RPO)

| Objetivo | Valor Confirmado | Descrição |
|----------|------------------|-----------|
| **RTO (Recovery Time Objective)** | **2 horas** | Tempo máximo para restaurar serviços após incidente crítico (P1) |
| **RPO (Recovery Point Objective)** | **15 minutos** | Perda máxima de dados aceitável em caso de desastre |

**Procedimentos de DR (Disaster Recovery):**
- Arquitetura **multi-region** (AWS us-east-1 primária + us-west-2 secundária) - ver **[02-plano-recuperacao-desastres.md](02-plano-recuperacao-desastres.md)**
- Backups automatizados a cada **15 minutos** (RDS) - ver **[06-politica-backup-restauracao.md](06-politica-backup-restauracao.md)**
- Testes de DR realizados **semestralmente** com documentação completa - ver **[05-relatorio-testes-anuais.md](05-relatorio-testes-anuais.md)**

---

## 4. Metodologia de Cálculo

### 4.1 Disponibilidade (Uptime)

**Fórmula:**
```
Uptime % = (Minutos Totais no Mês - Minutos de Downtime) / Minutos Totais no Mês × 100
```

**Exemplo (mês de 30 dias = 43.200 minutos):**
- Downtime ocorrido: 40 minutos
- Uptime % = (43.200 - 40) / 43.200 × 100 = **99.907%** ✅ (acima de 99.9%)

**Coleta de Dados:**
- **Ferramenta Primária:** CloudWatch (métricas de health checks)
- **Ferramenta Secundária:** AWS CloudWatch (uptime de EKS, RDS, ALB)
- **Ferramenta Terciária:** UptimeRobot (monitoramento externo independente)
- **Frequência:** Health checks a cada **30 segundos**

**Definição de "Downtime":**
- Serviço é considerado **indisponível** se:
  - Health check falha por **3 vezes consecutivas** (90 segundos)
  - Taxa de erros 5xx > 50% por mais de 60 segundos
  - Latência P95 > 30 segundos por mais de 60 segundos
- Downtime é contabilizado até que o serviço seja restaurado (health checks passando por **5 minutos consecutivos**)

### 4.2 Performance (Latência)

**Coleta de Dados:**
- **Fonte:** Application Performance Monitoring (APM) - ex: Datadog, New Relic, ou Prometheus
- **Medição:** Tempo entre recepção da requisição HTTP e envio da resposta completa
- **Granularidade:** Por endpoint e agregado (todas as APIs)
- **Percentis:** Calculados sobre amostra de **todas as requisições** do período (não amostragem)

**Exemplo:**
```
1.000.000 de requisições em um dia:
P95: 450ms (950.000 requisições < 450ms)
P99: 890ms (990.000 requisições < 890ms)
Média: 180ms

Resultado: ✅ Dentro dos SLAs (P95 < 500ms, P99 < 1000ms, Média < 200ms)
```

### 4.3 Taxa de Sucesso

**Fórmula:**
```
Taxa de Sucesso % = (Requisições 2xx + 3xx) / (Total de Requisições - Requisições 4xx de Cliente) × 100
```

**Classificação de Erros:**
- **2xx (Success):** Requisições bem-sucedidas
- **3xx (Redirect):** Redirecionamentos (contam como sucesso)
- **4xx (Client Error):** Erros do cliente (não contabilizados se validados como erro do cliente)
- **5xx (Server Error):** Erros do servidor (contabilizados como falha)

**Exemplo:**
```
Total de requisições: 10.000.000
- 2xx: 9.950.000
- 3xx: 10.000
- 4xx: 35.000 (validados como erro de autenticação do cliente)
- 5xx: 5.000

Taxa de Sucesso = (9.950.000 + 10.000) / (10.000.000 - 35.000) × 100
                = 9.960.000 / 9.965.000 × 100
                = 99.95% ✅ (acima de 99.5%)
```

---

## 5. Ferramentas de Monitoramento

### 5.1 Infraestrutura de Monitoramento

| Ferramenta | Função | Dados Coletados | Retenção |
|------------|--------|-----------------|----------|
| **AWS CloudWatch** | Métricas de infraestrutura e aplicação | CPU, memória, latência, throughput, error rate | 90 dias (padrão) |
| **AWS CloudWatch** | Métricas de serviços AWS | RDS uptime, EKS health, ALB status | 15 meses |
| **UptimeRobot** | Monitoramento externo independente | Uptime de endpoints públicos | 12 meses |
| **CloudWatch** | Alertas e métricas | Histórico de alarmes e métricas | 90 dias (padrão) |
| **Datadog / New Relic** (opcional) | APM (Application Performance Monitoring) | Latência de endpoints, traces distribuídos | 15 dias (traces)<br/>15 meses (métricas) |

### 5.2 Acesso para Cliente (Transparência)

**Opção 1: Status Page (Público)**
- URL: `https://status.[NOME-EMPRESA].com`
- **Atualização:** Automática (alimentada por CloudWatch)
- **Informações:** Uptime atual, incidentes, manutenções agendadas
- **Disponível 24/7** para qualquer pessoa

**Opção 2: Dashboard Dedicado (Cliente VIP)**
- **Acesso:** Restrito ao cliente (login/senha)
- **Informações:**
  - Uptime mensal (últimos 12 meses)
  - Latência P95/P99 (últimas 24 horas, 7 dias, 30 dias)
  - Taxa de sucesso (últimos 30 dias)
  - Incidentes recentes
  - Próximas manutenções

**Opção 3: Relatórios Mensais (Email)**
- **Frequência:** Primeiro dia útil de cada mês
- **Formato:** PDF executivo + planilha Excel detalhada
- **Conteúdo:**
  - Uptime alcançado vs. SLA
  - Incidentes ocorridos (P1/P2)
  - RTO/RPO alcançados (se aplicável)
  - Melhorias implementadas

---

## 6. Penalidades por Descumprimento (Service Credits)

**⚠️ NOTA:** As penalidades abaixo estão sujeitas aos termos contratuais específicos entre [NOME DA EMPRESA] e [NOME DO CLIENTE]. Esta seção serve como referência e deve ser ajustada conforme negociação contratual.

### 6.1 Tabela de Service Credits

| Uptime Alcançado | Downtime Mensal | Service Credit | Aplicação |
|------------------|-----------------|----------------|-----------|
| ≥ 99.9% | < 43 min 50s | **0%** | ✅ SLA cumprido - sem crédito |
| 99.0% - 99.9% | 43 min - 7h 12min | **10%** | 10% de desconto na mensalidade do mês |
| 95.0% - 99.0% | 7h 12min - 36h | **25%** | 25% de desconto na mensalidade do mês |
| < 95.0% | > 36 horas | **50%** | 50% de desconto na mensalidade do mês |

**Observações:**
- Service credits são aplicados **automaticamente** no mês seguinte (desconto na fatura).
- Cliente **não precisa solicitar** - processo automático baseado em relatório mensal.
- Credits **não são cumulativos** entre meses.
- Credits **não são reembolsáveis** em dinheiro (apenas descontos em serviço).

**Exceções (SLA não aplicável):**
- ❌ Downtime causado por **ações do cliente** (ex: credenciais inválidas, rate limiting)
- ❌ Downtime durante **manutenções pré-agendadas** (notificação com 72h)
- ❌ Downtime causado por **força maior** (desastres naturais, guerras, pandemias, etc.)
- ❌ Downtime causado por **falhas de terceiros fora do controle** (ex: AWS global outage)
  - Nota: Falhas regionais da AWS são cobertas (temos DR multi-region)

---

## 7. Processo de Notificação de Incidentes

### 7.1 Classificação de Severidade

| Severidade | Definição | Exemplo | SLA de Notificação | SLA de Resolução |
|------------|-----------|---------|-------------------|------------------|
| **P1 (Crítico)** | Serviço completamente indisponível ou degradação severa | APIs retornando 100% erro 5xx | **15 minutos** | **2 horas** |
| **P2 (Alto)** | Degradação parcial afetando funcionalidade importante | Latência P95 > 2 segundos | **30 minutos** | **4 horas** |
| **P3 (Médio)** | Problema menor afetando funcionalidade não crítica | Dashboard admin lento | **2 horas** | **24 horas** |
| **P4 (Baixo)** | Inconveniência ou questão cosmética | Typo em mensagem de erro | **24 horas** | **7 dias** |

### 7.2 Canais de Notificação

**Incidentes P1 (Crítico):**
1. **Email imediato** para: [EMAIL DO CONTATO TÉCNICO SERASA]
2. **Telefone/SMS** para: [TELEFONE 24/7 SERASA]
3. **Atualização Status Page:** `https://status.[NOME-EMPRESA].com`
4. **Slack** (se integração configurada): Canal #incidents-[cliente]

**Incidentes P2/P3/P4:**
1. **Email** para: [EMAIL DO CONTATO TÉCNICO SERASA]
2. **Atualização Status Page**

**Template de Notificação:** Ver **[03-plano-gerenciamento-crise.md](03-plano-gerenciamento-crise.md)** - Seção 3.5

### 7.3 Contatos de Emergência ([NOME DA EMPRESA])

| Papel | Nome | Email | Telefone 24/7 | Backup |
|-------|------|-------|---------------|--------|
| **CTO** | [NOME] | [EMAIL] | [TELEFONE] | [NOME BACKUP] |
| **DevOps Lead** | [NOME] | [EMAIL] | [TELEFONE] | [NOME BACKUP] |
| **On-Call (Primary)** | [ROTATIVO] | oncall@[EMPRESA].com | [TELEFONE] | 24/7 |

---

## 8. Vigência e Revisão

**Vigência:** Esta confirmação de SLAs é válida de **[DATA INÍCIO]** até **[DATA FIM]** (coincidente com período contratual).

**Revisão:**
- **Anual:** SLAs serão revisados a cada 12 meses para ajustes com base em performance histórica.
- **Por Solicitação:** Qualquer parte pode solicitar revisão mediante justificativa.
- **Melhoria de SLAs:** [NOME DA EMPRESA] pode oferecer SLAs superiores mediante upgrade de plano.

**Comunicação de Mudanças:**
- Mudanças em SLAs serão comunicadas com **60 dias de antecedência**.
- Mudanças que melhorem SLAs (ex: 99.9% → 99.95%) serão comunicadas com **30 dias**.

---

## 9. Conformidade e Auditoria

**Frameworks de Conformidade:**
-  **ISO 22301:2019** - Business Continuity Management
-  **ISO 27001:2022** - Information Security Management
-  **SOC 2 Type II** - Trust Service Criteria (Security + Availability)

**Status de Certificação:** Ver **[07-certificacao-compliance.md](07-certificacao-compliance.md)**

**Direito de Auditoria:**
- Cliente tem direito de **auditar** (ou contratar auditor independente) os controles de [NOME DA EMPRESA] mediante:
  - Notificação com **30 dias de antecedência**
  - Assinatura de NDA
  - Agendamento em horário comercial
  - Máximo de **1 auditoria por ano** (sem custo adicional)

---

## 10. Assinatura e Autorização

Esta declaração foi autorizada e assinada pelo representante legal de **[NOME DA EMPRESA]**:

---

**Assinatura:**

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

**Nome:** [NOME COMPLETO - CEO ou CTO]  
**Cargo:** [CEO / CTO / Diretor Executivo]  
**CPF:** [NÚMERO]  
**Data:** [DD/MM/AAAA]  
**Local:** [CIDADE - UF]

---

**Testemunhas:**

1. \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
   **Nome:** [NOME - CISO]  
   **CPF:** [NÚMERO]

2. \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
   **Nome:** [NOME - CFO]  
   **CPF:** [NÚMERO]

---

## 11. Anexos

### Anexo A: Glossário de Termos

| Termo | Definição |
|-------|-----------|
| **SLA** | Service Level Agreement - Acordo de Nível de Serviço |
| **Uptime** | Tempo em que o serviço está disponível e funcional |
| **Downtime** | Tempo em que o serviço está indisponível ou não funcional |
| **RTO** | Recovery Time Objective - Tempo máximo para restaurar serviços |
| **RPO** | Recovery Point Objective - Perda máxima de dados aceitável |
| **P95 (Percentil 95)** | 95% das requisições têm latência menor ou igual ao valor especificado |
| **P99 (Percentil 99)** | 99% das requisições têm latência menor ou igual ao valor especificado |
| **Health Check** | Verificação automática de disponibilidade do serviço |
| **Service Credit** | Crédito (desconto) concedido por descumprimento de SLA |

### Anexo B: Histórico de Performance (Últimos 12 Meses)

| Mês | Uptime Alcançado | Downtime | SLA Cumprido | Incidentes P1 | Incidentes P2 |
|-----|------------------|----------|--------------|---------------|---------------|
| [MÊS-12] | [XX.XX]% | [X]min | ✅ / ❌ | [N] | [N] |
| [MÊS-11] | [XX.XX]% | [X]min | ✅ / ❌ | [N] | [N] |
| ... | ... | ... | ... | ... | ... |
| [MÊS-1] | [XX.XX]% | [X]min | ✅ / ❌ | [N] | [N] |

**Uptime Médio (12 meses):** [XX.XX]%  
**Meses com SLA cumprido:** [N]/12 ([XX]%)

### Anexo C: Próximas Manutenções Agendadas

| Data | Horário | Duração Estimada | Impacto | Descrição |
|------|---------|------------------|---------|-----------|
| [DATA] | [HH:MM - HH:MM BRT] | [X] horas | [Alto/Médio/Baixo] | [Descrição da manutenção] |
| [DATA] | [HH:MM - HH:MM BRT] | [X] horas | [Alto/Médio/Baixo] | [Descrição da manutenção] |

**Observação:** Manutenções serão notificadas com **72 horas de antecedência** via email e Status Page.

---

**🔒 Classificação:** CONFIDENCIAL - USO CONTRATUAL  
**📁 Categoria:** Contrato - SLA Confirmation  
**📅 Data de Emissão:** [DATA]  
**🔄 Validade:** [DATA INÍCIO] até [DATA FIM]  
**👤 Responsável:** [NOME - CEO/CTO]  
**📧 Contato:** [EMAIL] | [TELEFONE]

---

**Versão do Template:** 1.0 - Genérico  
**Data de Criação:** 09/10/2025  
**Para uso com:** Clientes enterprise  
**Tipo:** Declaração Formal de SLAs

