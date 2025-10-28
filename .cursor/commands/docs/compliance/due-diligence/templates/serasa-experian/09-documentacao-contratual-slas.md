---
title: "Documentação Contratual dos SLAs - Extrato e Cláusulas"
document_type: "Extrato Contratual"
classification: "CONFIDENCIAL - USO CONTRATUAL"
version: "1.0"
date: "[DATA]"
owner: "[Jurídico/CEO]"
---

# Documentação Contratual dos SLAs

## 📋 Controle de Versão

| Versão | Data | Autor | Descrição | Aprovador |
|--------|------|-------|-----------|-----------|
| 1.0 | [DATA] | [NOME - Jurídico] | Versão inicial do extrato contratual | [NOME - CEO] |

---

## 📄 1. Identificação do Contrato

| Campo | Informação |
|-------|------------|
| **Contrato Nº** | [NÚMERO DO CONTRATO - ex: CTR-SRS-2025-001] |
| **Partes** | **CONTRATANTE:** [NOME DO CLIENTE]<br/>**CONTRATADA:** [NOME DA EMPRESA] |
| **Objeto** | Prestação de serviços de [DESCRIÇÃO - ex: APIs de dados financeiros] |
| **Data de Assinatura** | [DD/MM/AAAA] |
| **Vigência** | [DD/MM/AAAA] até [DD/MM/AAAA] ([X] meses/anos) |
| **Renovação** | [Automática / Mediante aditivo / Não renovável] |
| **Foro** | [CIDADE - UF] |

---

## 2. Extrato das Cláusulas de SLA

### Cláusula [N]º - DOS NÍVEIS DE SERVIÇO (SLAs)

**[CÓPIA TEXTUAL DA CLÁUSULA CONTRATUAL - EXEMPLO]:**

> **CLÁUSULA [N]ª – DOS NÍVEIS DE SERVIÇO (SERVICE LEVEL AGREEMENTS - SLAs)**
>
> **[N].1.** A CONTRATADA compromete-se a prestar os serviços objeto deste contrato observando os seguintes níveis de serviço:
>
> **a) Disponibilidade (Uptime):**
> - **99,9% (noventa e nove vírgula nove por cento)** de disponibilidade mensal dos serviços de API, calculado conforme metodologia definida na Cláusula [N].5.
>
> **b) Performance:**
> - **Latência P95:** inferior a 500ms (quinhentos milissegundos)
> - **Latência P99:** inferior a 1000ms (um segundo)
> - **Latência Média:** inferior a 200ms (duzentos milissegundos)
>
> **c) Taxa de Sucesso:**
> - Mínimo de **99,5% (noventa e nove vírgula cinco por cento)** de requisições bem-sucedidas (códigos HTTP 2xx e 3xx), excluindo erros de client (4xx).
>
> **[N].2. Objetivos de Recuperação:**
> - **RTO (Recovery Time Objective):** 2 (duas) horas - tempo máximo para restauração completa dos serviços após incidente crítico.
> - **RPO (Recovery Point Objective):** 15 (quinze) minutos - perda máxima de dados aceitável em caso de desastre.
>
> **[N].3. Janelas de Manutenção:**
> - A CONTRATADA poderá realizar manutenções programadas em janelas pré-agendadas, com notificação ao CONTRATANTE com antecedência mínima de 72 (setenta e duas) horas.
> - As janelas de manutenção não serão contabilizadas como tempo de indisponibilidade (downtime) para fins de cálculo do SLA.
> - Limite de **2 (duas) janelas de manutenção por trimestre**, cada uma com duração máxima de **2 (duas) horas**.
>
> **[N].4. Exclusões:**
> - Não serão contabilizados como descumprimento de SLA os seguintes eventos:
>   - a) Indisponibilidade causada por ação ou omissão do CONTRATANTE;
>   - b) Falhas de conectividade de rede não atribuíveis à CONTRATADA;
>   - c) Eventos de força maior (desastres naturais, guerras, pandemias, etc.);
>   - d) Falhas de fornecedores terceiros fora do controle razoável da CONTRATADA, desde que a CONTRATADA possua plano de contingência implementado (ex: multi-region architecture).
>
> **[N].5. Metodologia de Cálculo:**
> - O cálculo de disponibilidade mensal será realizado pela fórmula: **Uptime % = [(Minutos Totais - Minutos de Downtime) / Minutos Totais] × 100**
> - Considera-se **downtime** o período em que os serviços estão inacessíveis por **3 (três) tentativas consecutivas de health check** (intervalo de 30 segundos), totalizando 90 (noventa) segundos de indisponibilidade contínua.
> - As métricas serão coletadas através de sistemas de monitoramento da CONTRATADA (AWS CloudWatch) e, opcionalmente, validadas por ferramenta de monitoramento externo independente (ex: UptimeRobot).
>
> **[N].6. Créditos por Descumprimento (Service Credits):**
> - Em caso de descumprimento dos SLAs de disponibilidade, a CONTRATADA aplicará automaticamente os seguintes créditos ao CONTRATANTE:
>
> | Uptime Alcançado | Service Credit |
> |------------------|----------------|
> | ≥ 99.9% | 0% (SLA cumprido) |
> | 99.0% a < 99.9% | 10% da mensalidade |
> | 95.0% a < 99.0% | 25% da mensalidade |
> | < 95.0% | 50% da mensalidade |
>
> - Os créditos serão aplicados na fatura do mês subsequente ao descumprimento.
> - Os créditos não são cumulativos entre meses.
> - Os créditos representam a **única e exclusiva compensação** pelo descumprimento de SLA, renunciando as partes a quaisquer outras indenizações.
>
> **[N].7. Notificação de Incidentes:**
> - A CONTRATADA notificará o CONTRATANTE sobre incidentes que afetem a disponibilidade conforme os seguintes prazos:
>   - **Incidentes P1 (Críticos):** Notificação em até **15 (quinze) minutos**
>   - **Incidentes P2 (Altos):** Notificação em até **30 (trinta) minutos**
>   - **Incidentes P3 (Médios):** Notificação em até **2 (duas) horas**
>
> - A notificação será realizada via email para [EMAIL DO CONTRATANTE] e, em caso de P1, também via telefone/SMS para [TELEFONE 24/7].
>
> **[N].8. Relatórios de Desempenho:**
> - A CONTRATADA fornecerá ao CONTRATANTE relatórios mensais de desempenho contendo:
>   - Percentual de disponibilidade alcançado
>   - Latências P95, P99 e média
>   - Taxa de sucesso de requisições
>   - Detalhamento de incidentes (P1/P2)
>   - Ações corretivas implementadas
>
> - Os relatórios serão enviados até o **5º (quinto) dia útil** do mês subsequente.
>
> **[N].9. Revisão de SLAs:**
> - As partes se comprometem a revisar os SLAs anualmente ou sempre que necessário para ajustes baseados em desempenho histórico e evolução tecnológica.

---

## 3. Tabela Resumo de SLAs (Quick Reference)

### 3.1 SLAs de Disponibilidade e Performance

| Métrica | Valor Contratual | Unidade | Período de Medição |
|---------|------------------|---------|-------------------|
| **Uptime** | **99.9%** | % | Mensal |
| **Downtime Máximo Permitido** | 43 min 49s | minutos | Mensal |
| **Latência P95** | < 500 | milissegundos | Diário/Mensal |
| **Latência P99** | < 1000 | milissegundos | Diário/Mensal |
| **Latência Média** | < 200 | milissegundos | Diário/Mensal |
| **Taxa de Sucesso** | ≥ 99.5% | % | Mensal |
| **RTO** | ≤ 2 | horas | Por incidente P1 |
| **RPO** | ≤ 15 | minutos | Por incidente |

### 3.2 SLAs de Notificação

| Severidade | SLA de Notificação | Canais | SLA de Resolução |
|------------|-------------------|--------|------------------|
| **P1 (Crítico)** | 15 minutos | Email + Telefone/SMS + Status Page | 2 horas |
| **P2 (Alto)** | 30 minutos | Email + Status Page | 4 horas |
| **P3 (Médio)** | 2 horas | Email + Status Page | 24 horas |
| **P4 (Baixo)** | 24 horas | Email | 7 dias |

### 3.3 Service Credits

| Uptime Alcançado | Downtime Mensal | Credit (% da mensalidade) | Cálculo (mensalidade R$ 10.000) |
|------------------|-----------------|---------------------------|----------------------------------|
| ≥ 99.9% | < 43 min 50s | 0% | R$ 0 (SLA cumprido) |
| 99.0% - 99.9% | 43 min - 7h 12min | 10% | R$ 1.000 de desconto |
| 95.0% - 99.0% | 7h 12min - 36h | 25% | R$ 2.500 de desconto |
| < 95.0% | > 36 horas | 50% | R$ 5.000 de desconto |

**Nota:** Valores hipotéticos para ilustração. Ajustar conforme valor contratual real.

---

## 4. Glossário de Termos Contratuais

| Termo | Definição Contratual | Referência no Contrato |
|-------|---------------------|------------------------|
| **SLA** | Service Level Agreement - Nível de Serviço contratualmente acordado entre as partes | Cláusula [N] |
| **Uptime** | Percentual de tempo em que os serviços estão disponíveis e funcionais conforme especificado | Cláusula [N].1.a |
| **Downtime** | Período em que os serviços estão inacessíveis ou não funcionais, conforme critérios de health check | Cláusula [N].5 |
| **Health Check** | Verificação automática de disponibilidade dos serviços realizada a cada 30 segundos | Cláusula [N].5 |
| **RTO (Recovery Time Objective)** | Tempo máximo contratual para restauração completa dos serviços após incidente crítico (P1) | Cláusula [N].2 |
| **RPO (Recovery Point Objective)** | Perda máxima de dados aceitável em caso de desastre, medida em minutos | Cláusula [N].2 |
| **P95 (Percentil 95)** | 95% das requisições têm latência menor ou igual ao valor especificado | Cláusula [N].1.b |
| **Service Credit** | Crédito (desconto) aplicado pelo descumprimento de SLA, conforme tabela estabelecida | Cláusula [N].6 |
| **Janela de Manutenção** | Período pré-agendado para manutenção programada, não contabilizado como downtime | Cláusula [N].3 |
| **Incidente P1** | Incidente de severidade crítica: serviço completamente indisponível ou degradação severa | Cláusula [N].7 |

---

## 5. Processo de Reporte e Monitoramento

### 5.1 Ferramentas de Monitoramento (Referência)

Conforme especificado no **[08-confirmacao-slas.md](08-confirmacao-slas.md)** - Seção 5:

| Ferramenta | Função | Acesso Cliente |
|------------|--------|----------------|
| **AWS CloudWatch** | Monitoramento interno (métricas de infra e aplicação) | Via dashboard dedicado (login fornecido) |
| **UptimeRobot** | Monitoramento externo independente (validação de uptime) | Via relatório mensal |
| **Status Page** | Status público dos serviços + histórico de incidentes | Público: `https://status.[EMPRESA].com` |
| **AWS CloudWatch** | Métricas de serviços AWS (RDS, EKS, ALB) | Não disponível para cliente |

### 5.2 Relatórios Mensais

**Formato:** PDF executivo + planilha Excel detalhada

**Conteúdo Obrigatório:**
1. **Resumo Executivo:**
   - Uptime alcançado vs. SLA contratual (99.9%)
   - Service credits aplicados (se houver)
   - Número de incidentes por severidade (P1/P2/P3/P4)

2. **Métricas Detalhadas:**
   - Uptime diário (gráfico 30 dias)
   - Latência P95/P99 (gráfico 30 dias)
   - Taxa de sucesso de APIs
   - Distribuição de erros (4xx vs. 5xx)

3. **Incidentes:**
   - Lista de incidentes P1/P2 com:
     - Data/hora de início e fim
     - Duração (em minutos)
     - Causa raiz
     - Ações corretivas implementadas
     - RTO/RPO alcançados (se aplicável)

4. **Manutenções:**
   - Janelas de manutenção realizadas
   - Janelas de manutenção agendadas (próximos 30 dias)

5. **Melhorias:**
   - Melhorias de infraestrutura implementadas
   - Plano de melhorias para próximo mês

**Envio:** Até o **5º dia útil** do mês subsequente para: [EMAIL DO CONTRATANTE]

**Exemplo de Nome de Arquivo:**
```
[NOME-EMPRESA]-SLA-Report-[CLIENTE]-[ANO]-[MÊS].pdf
{{COMPANY_NAME}}-SLA-Report-Serasa-2025-Jan.pdf
```

### 5.3 Alertas em Tempo Real

**Para Incidentes P1 (Críticos):**
1. **T+0min:** Sistema detecta falha (3 health checks consecutivos)
2. **T+5min:** Equipe interna notificada (PagerDuty)
3. **T+15min:** Cliente notificado (email + telefone)
   - Para: [EMAIL CONTATO TÉCNICO]
   - Para: [TELEFONE 24/7]
   - Assunto: `🚨 CRÍTICO - Incidente P1 - [DESCRIÇÃO]`
4. **T+30min:** Atualização de status (progresso da resolução)
5. **A cada 1h:** Atualizações até resolução
6. **T+Resolução:** Notificação de "Serviços Restaurados"
7. **T+24h:** Post-Mortem enviado

**Template de Notificação:** Ver **[03-plano-gerenciamento-crise.md](03-plano-gerenciamento-crise.md)** - Seção 3.5

---

## 6. Histórico de Cumprimento de SLAs

### 6.1 Últimos 12 Meses (Performance Real)

| Mês/Ano | Uptime Alcançado | Downtime Total | SLA Cumprido? | Incidentes P1 | Incidentes P2 | Service Credit Aplicado |
|---------|------------------|----------------|---------------|---------------|---------------|-------------------------|
| Jan/[ANO-1] | 99.95% | 21 min | ✅ Sim | 0 | 1 | 0% |
| Fev/[ANO-1] | 99.92% | 32 min | ✅ Sim | 0 | 0 | 0% |
| Mar/[ANO-1] | 99.98% | 8 min | ✅ Sim | 0 | 0 | 0% |
| Abr/[ANO-1] | 99.87% | 56 min | ❌ Não | 1 | 1 | 10% |
| Mai/[ANO-1] | 99.99% | 4 min | ✅ Sim | 0 | 0 | 0% |
| Jun/[ANO-1] | 99.94% | 25 min | ✅ Sim | 0 | 1 | 0% |
| Jul/[ANO-1] | 99.96% | 17 min | ✅ Sim | 0 | 0 | 0% |
| Ago/[ANO-1] | 99.91% | 38 min | ✅ Sim | 0 | 1 | 0% |
| Set/[ANO-1] | 99.98% | 8 min | ✅ Sim | 0 | 0 | 0% |
| Out/[ANO-1] | 99.89% | 47 min | ❌ Não | 1 | 0 | 10% |
| Nov/[ANO-1] | 99.97% | 13 min | ✅ Sim | 0 | 0 | 0% |
| Dez/[ANO-1] | 99.99% | 4 min | ✅ Sim | 0 | 0 | 0% |

**Resumo Anual:**
- **Uptime Médio:** 99.94%
- **Meses com SLA cumprido:** 10/12 (83.3%)
- **Meses com SLA descumprido:** 2/12 (16.7%)
- **Total de Service Credits:** 20% (2 meses × 10%)
- **Incidentes P1 Totais:** 2
- **Incidentes P2 Totais:** 5

**Observações:**
- Os 2 meses com descumprimento de SLA tiveram downtimes de 56 min e 47 min (acima de 43 min 49s permitido).
- Causas raízes dos P1:
  - Abr/[ANO-1]: Falha regional da AWS us-east-1 (DZ única caiu, antes de implementar Multi-AZ)
  - Out/[ANO-1]: Bug em deploy que causou crash de pods (rollback em 47 min)
- Ações corretivas implementadas:
  - Multi-AZ habilitado em todos os serviços críticos (Abr/[ANO-1])
  - Blue-Green deployment implementado para evitar bugs em produção (Nov/[ANO-1])

---

## 7. Vigência e Termos de Renovação

### 7.1 Vigência do Contrato

| Campo | Informação |
|-------|------------|
| **Início da Vigência** | [DD/MM/AAAA] |
| **Término da Vigência** | [DD/MM/AAAA] |
| **Duração Total** | [X] meses / [Y] anos |
| **Renovação** | [Automática por períodos sucessivos de [X] meses / Mediante aditivo contratual / Não renovável] |

### 7.2 Condições de Renovação (se aplicável)

**Renovação Automática:**
- O contrato será renovado automaticamente por períodos sucessivos de **[X] meses**, salvo manifestação contrária de qualquer das partes com antecedência mínima de **[Y] dias** do término da vigência.

**Reajuste de Valores:**
- Os valores contratuais serão reajustados anualmente pelo índice **[ÍNDICE - ex: IPCA, IGP-M]**, aplicado na data de aniversário do contrato.

**Revisão de SLAs:**
- Os SLAs serão revisados a cada **[X] meses** ou por solicitação de qualquer das partes, podendo ser ajustados mediante aditivo contratual.

### 7.3 Rescisão

**Rescisão Sem Justa Causa:**
- Qualquer das partes pode rescindir o contrato mediante notificação por escrito com antecedência mínima de **[X] dias**.

**Rescisão Por Justa Causa (CONTRATANTE):**
- Descumprimento reiterado de SLAs (ex: **3 (três) meses consecutivos** com uptime < 99.9%)
- Violação de cláusulas de segurança ou confidencialidade
- Insolvência ou falência da CONTRATADA

**Penalidades por Rescisão Antecipada:**
- [Especificar se há multa rescisória ou não]

---

## 8. Contatos Contratuais

### 8.1 Contatos do CONTRATANTE ([NOME DO CLIENTE])

| Papel | Nome | Email | Telefone | Observações |
|-------|------|-------|----------|-------------|
| **Gestor do Contrato** | [NOME] | [EMAIL] | [TELEFONE] | Ponto focal principal |
| **Contato Técnico** | [NOME] | [EMAIL] | [TELEFONE] | Recebe notificações de incidentes |
| **Contato Financeiro** | [NOME] | [EMAIL] | [TELEFONE] | Faturamento e service credits |
| **Contato Jurídico** | [NOME] | [EMAIL] | [TELEFONE] | Questões contratuais |
| **Contato 24/7 (Emergências P1)** | [NOME] | [EMAIL] | [TELEFONE CELULAR] | Apenas incidentes críticos |

### 8.2 Contatos da CONTRATADA ([NOME DA EMPRESA])

| Papel | Nome | Email | Telefone | Observações |
|-------|------|-------|----------|-------------|
| **CEO** | [NOME] | [EMAIL] | [TELEFONE] | Autoridade máxima |
| **CTO** | [NOME] | [EMAIL] | [TELEFONE] | Gestão técnica |
| **CISO** | [NOME] | [EMAIL] | [TELEFONE] | Segurança e compliance |
| **Customer Success Manager** | [NOME] | [EMAIL] | [TELEFONE] | Ponto focal do cliente |
| **On-Call 24/7** | [ROTATIVO] | oncall@[EMPRESA].com | [TELEFONE] | Incidentes P1/P2 |
| **Financeiro** | [NOME] | financeiro@[EMPRESA].com | [TELEFONE] | Faturamento |
| **Jurídico** | [NOME] | juridico@[EMPRESA].com | [TELEFONE] | Questões contratuais |

---

## 9. Documentos Relacionados

| Documento | Descrição | Localização |
|-----------|-----------|-------------|
| **Contrato Principal** | Contrato completo assinado entre as partes | [CAMINHO/SISTEMA] |
| **Aditivos Contratuais** | Aditivos e alterações ao contrato original | [CAMINHO/SISTEMA] |
| **08-confirmacao-slas.md** | Confirmação formal de SLAs (declaração técnica) | Este repositório |
| **01-plano-continuidade-negocios.md** | BCP - Plano de Continuidade de Negócios | Este repositório |
| **02-plano-recuperacao-desastres.md** | DRP - Plano de Recuperação de Desastres | Este repositório |
| **03-plano-gerenciamento-crise.md** | Plano de Gestão de Crise e Notificação | Este repositório |
| **05-relatorio-testes-anuais.md** | Relatórios de testes de DR/BC | Este repositório |
| **06-politica-backup-restauracao.md** | Política de Backup (suporta RTO/RPO) | Este repositório |
| **Relatórios Mensais de SLA** | Relatórios históricos de cumprimento de SLA | [CAMINHO/SISTEMA] |

---

## 10. Checklist de Validação

- [ ] Número do contrato e partes identificadas
- [ ] Extrato de cláusulas de SLA transcrito corretamente
- [ ] Tabela resumo de SLAs preenchida
- [ ] Glossário de termos contratuais completo
- [ ] Processo de reporte documentado
- [ ] Histórico de performance (12 meses) atualizado
- [ ] Vigência e condições de renovação especificadas
- [ ] Contatos contratuais de ambas as partes atualizados
- [ ] Documentos relacionados referenciados
- [ ] Documento aprovado por Jurídico + CEO

---

## ✍️ 11. Aprovação

| Papel | Nome | Assinatura | Data |
|-------|------|------------|------|
| **Elaborado por** | [NOME - Customer Success / Jurídico] | __________ | [DATA] |
| **Revisado por** | [NOME - CTO] | __________ | [DATA] |
| **Revisado por** | [NOME - Jurídico] | __________ | [DATA] |
| **Aprovado por** | [NOME - CEO] | __________ | [DATA] |

---

**🔒 Classificação:** CONFIDENCIAL - USO CONTRATUAL  
**📁 Categoria:** Contrato - SLA Documentation  
**📅 Data de Criação:** [DATA]  
**🔄 Atualização:** A cada revisão contratual ou aditivo  
**👤 Responsável:** [NOME - Jurídico/CEO]  
**📧 Dúvidas:** [EMAIL]

---

**Versão do Template:** 1.0 - Genérico  
**Data de Criação:** 09/10/2025  
**Para uso com:** Clientes enterprise  
**Tipo:** Extrato Contratual e Documentação de SLAs

