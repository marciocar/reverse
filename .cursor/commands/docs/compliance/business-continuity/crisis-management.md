# Crisis Management Plan (CMP)

> **Framework:** ISO 22301:2019 - Cláusula 8.4.4  
> **Versão:** 2.0  
> **Data de Aprovação:** [DATA]  
> **Próxima Revisão:** [DATA] (anual)  
> **Status:** [STATUS]

---

## 📋 **Executive Summary**

O **Plano de Gerenciamento de Crise (Crisis Management Plan)** estabelece a estrutura organizacional, processos e canais de comunicação para gerenciar situações de crise que possam impactar:

-  **Continuidade operacional** dos serviços críticos
-  **Stakeholders e clientes**
-  **Reputação corporativa** e confiança de mercado
-  **Conformidade regulatória** e compromissos contratuais
-  **Segurança de dados** e privacidade

---

## 1. Objetivo

O Plano de Gerenciamento de Crise (CMP) estabelece diretrizes, responsabilidades e fluxos de comunicação a serem seguidos em caso de incidentes críticos ou interrupções graves que impactem a operação.

O objetivo é assegurar uma **resposta coordenada, rápida e eficaz**, garantindo comunicação transparente e redução do tempo de indisponibilidade.

---

## 2. Definição de Crise

A organização classifica como **crise** todo incidente que impacte diretamente o ambiente produtivo, resultando em:

- ❌ **Indisponibilidade total ou parcial** do serviço
- ❌ **Degradação significativa** em sistemas críticos
- ❌ **Falhas de autenticação** ou erros generalizados de acesso
- ❌ **Ocorrências que afetem a integridade ou continuidade do negócio**
- ❌ **Violação de segurança** ou comprometimento de dados

Todo incidente **crítico** deve ser tratado como **Crise Operacional**, acionando o fluxo de gestão descrito neste plano.

### Classificação de Severidade

| Severidade | Definição | Impacto | Tempo de Resposta | Exemplo |
|------------|-----------|---------|-------------------|---------|
| **P0 - Crítico** | Serviços core completamente indisponíveis | > 50% usuários | < 15min | [EXEMPLO] |
| **P1 - Alto** | Funcionalidades críticas degradadas | 20-50% usuários | < 30min | [EXEMPLO] |
| **P2 - Médio** | Funcionalidades não-críticas afetadas | < 20% usuários | < 1h | [EXEMPLO] |
| **P3 - Baixo** | Impacto mínimo ou planejado | < 5% usuários | < 4h | [EXEMPLO] |

**Ativação do Crisis Management Plan:** Apenas para **P0** e **P1 com impacto significativo**.

---

## 3. Canais de Atuação e Pontos de Contato

### 3.1. Matriz de Comunicação

| Função | Responsável | Contato / Canal | Observações |
|:-------|:------------|:----------------|:------------|
| **Stakeholder (Ponto Focal)** | [CARGO] | [CANAL] | Recebe notificações e atualizações a cada [TEMPO] |
| **Especialista Técnico** | [EQUIPE] | [CANAL] | Diagnóstico e execução técnica |
| **Monitoramento [FREQUÊNCIA]** | [EQUIPE] | [CANAL] | Primeira linha de detecção e acionamento |
| **Gerente de Serviço** | [CARGO] | [CANAL] | Acompanha SLA e status de escalonamento |
| **Direção Técnica** | [CARGO] | [CANAL] | Intervenção executiva e reporte |

### 3.2. Ferramentas de Apoio

| Ferramenta | Propósito | Responsável |
|:-----------|:----------|:------------|
| **[SISTEMA ITSM]** | Registro, acompanhamento e comunicação de incidentes | [EQUIPE] |
| **[MONITORAMENTO]** | Detecção e monitoramento proativo | [EQUIPE] |
| **[COMUNICAÇÃO]** | Comunicação para incidentes críticos | [TODOS] |
| **[COORDENAÇÃO]** | Coordenação interna | [EQUIPE] |
| **[EMAIL/SMS]** | Comunicação formal | [GERÊNCIA] |
| **[IaC/DEPLOYMENT]** | Atuação técnica e correção | [EQUIPE TÉCNICA] |

---

## 4. Procedimento de Resposta a Crise

### 4.1. Fase 1: Detecção e Classificação

**Responsável**: [EQUIPE DE MONITORAMENTO]

```
1. Detecção de Falha Crítica
   → [SISTEMA] trigger: [CONDIÇÃO]
   → [ALERTA]: [TIPO]
   → Reporte: [ORIGEM]

2. Validação Inicial
   → Confirmar impacto (total ou parcial)
   → Identificar componentes afetados
   → Classificar severidade

3. Classificação como "Incidente Crítico / Crise"
   → Se impacto em produção
   → Se downtime > [TEMPO]
   → Se afeta [CRITÉRIO]
```

**SLA**: Detecção e classificação em **< [TEMPO]**

### 4.2. Fase 2: Abertura e Comunicação Inicial

**Responsável**: [EQUIPE]

```
1. Abertura de Ticket
   → Categoria: "Incidente Crítico"
   → Prioridade: [NÍVEL]
   → Descrição: [TEMPLATE]

2. Criação de Sala de Guerra (War Room)
   → **Interno**: [CANAIS]
   → **Com Stakeholders**: [CANAIS]
   → Adicionar: [PARTICIPANTES]

3. Comunicação Inicial
   → Template:

   🚨 INCIDENTE CRÍTICO ABERTO 🚨
   [CAMPOS]
   Início: [HH:MM]
   Status: Equipes técnicas atuando
   Próximo status: [TEMPO]
   Ticket: #[número]
```

**SLA**: Comunicação inicial em **< [TEMPO]** (First Response Time)

### 4.3. Fase 3: Ciclo de Comunicação

**Responsável**: [EQUIPE]

**Frequência**: Atualizações a cada **[TEMPO]**

**Template de Status**:
```
🕒 STATUS UPDATE - [HH:MM]

Situação: [Resumo técnico]
Ações em curso: [Lista de ações]
Causa provável: [Se identificada]
ETA recuperação: [Estimativa ou "investigando"]
Próxima atualização: [TEMPO]
```

**Canais**:
- **[CANAL 1]**: [USO]
- **[CANAL 2]**: [USO]
- **[CANAL 3]**: [USO]

### 4.4. Fase 4: Escalonamento Técnico

**Responsável**: [CARGO]

**Timeline de Escalonamento**:

| Tempo | Ação | Quem Aciona | Quem é Acionado |
|:------|:-----|:------------|:----------------|
| **Início** | Incidente aberto | [NÍVEL 1] | [NÍVEL 2] |
| **+ [TEMPO1]** | Sem resolução | [NÍVEL 2] | [NÍVEL 3] |
| **+ [TEMPO2]** | Sem resolução | [NÍVEL 3] | [GERÊNCIA] |
| **+ [TEMPO3]** | Sem resolução | [GERÊNCIA] | [DIRETORIA] |

**Nota**: Escalação pode ser acelerada se impacto for crítico

### 4.5. Fase 5: Resolução e Encerramento

**Responsável**: [EQUIPE]

```
1. Após Restabelecimento
   → Validar todos os serviços
   → Confirmar health checks
   → Validar com stakeholders

2. Comunicar Encerramento Formal
   → Template:

   🚨 INCIDENTE CRÍTICO RESOLVIDO 🚨
   🕒 Início: [HH:MM]
   🕒 Solução Iniciada: [HH:MM]
   🕒 Finalização: [HH:MM]
   🔧 Solução: [Resumo técnico]
   📊 Impacto: [Downtime: X minutos]
   📞 Status: Sistema estabilizado
   📋 Ticket: #[número] (fechado)

3. Fechar Ticket
   → Status: "Resolvido"
   → Solução: [Descrição]
   → RCA: [Causa raiz]

4. Agendar Post-Mortem
   → Dentro de [PRAZO]
   → Participantes: [LISTA]
```

**SLA**: Comunicação de encerramento em **< [TEMPO]** após validação

---

## 5. Tabela de Comunicação de Incidentes Críticos

### 5.1. Fluxo de Comunicação Detalhado

| Tempo | Mensagem | Interno | Stakeholders | Canal Interno | Canal Stakeholders |
|:------|:---------|:--------|:-------------|:--------------|:-------------------|
| **Início (T+0)** | Incidente aberto – [DESCRIÇÃO], equipes atuando. Próximo status: [TEMPO]. | [EQUIPES] | [STAKEHOLDERS] | [CANAIS] | [CANAIS] |
| **T+[TEMPO]** | Incidente em andamento – [AÇÕES]. Próximo status: [TEMPO]. | [EQUIPES] | [STAKEHOLDERS] | [CANAIS] | [CANAIS] |
| **T+[TEMPO]** | Incidente em andamento – previsão: [TEMPO]. [CAUSA]. | [EQUIPES] | [STAKEHOLDERS] | [CANAIS] | [CANAIS] |
| **T+[TEMPO]** | Incidente em andamento. [GERÊNCIA] acionada. [STATUS]. | [EQUIPES] | [STAKEHOLDERS] | [CANAIS] | [CANAIS] |
| **Fim (T+N)** | Incidente encerrado – [RESULTADO]. Downtime: [TEMPO]. Post-mortem agendado. | [EQUIPES] | [STAKEHOLDERS] | [CANAIS] | [CANAIS] |

### 5.2. Exemplo Real

**Incidente**: [DESCRIÇÃO]

```
T+0 ([HH:MM]):
🚨 INCIDENTE CRÍTICO
[DESCRIÇÃO]
Equipes atuando
Próximo status: [HH:MM]

T+[TEMPO] ([HH:MM]):
[STATUS]
[PROGRESSO]
ETA: [HH:MM]

T+[TEMPO] ([HH:MM]):
✅ RESOLVIDO
Downtime total: [TEMPO]
Causa: [DESCRIÇÃO]
Ação preventiva: [DESCRIÇÃO]
```

---

## 6. Pós-Crise (Post-Mortem / Análise de Problema)

### 6.1. Objetivo

Após o encerramento do incidente crítico, é **obrigatória** a elaboração de um **Post-Mortem** ou **Análise de Problema**.

**Responsável**: [CARGO/EQUIPE]

### 6.2. Template de Post-Mortem

```markdown
# POST-MORTEM - [TÍTULO DO INCIDENTE]

**Ticket**: #[número]
**Data**: [data]
**Ambiente**: [ambiente]

## 1. Descrição do Incidente

[O que aconteceu, quando, em qual sistema]

## 2. Impacto e Duração

- **Início**: [HH:MM]
- **Fim**: [HH:MM]
- **Duração Total**: [X minutos]
- **Serviços Afetados**: [Lista]
- **Usuários/Stakeholders Impactados**: [Estimativa]
- **Perda de Dados**: [Sim/Não - detalhes se sim]

## 3. Causa Raiz

[Causa técnica identificada]

**Fatores Contribuintes**:
- [Fator 1]
- [Fator 2]

## 4. Timeline Detalhado

| Horário | Evento |
|:--------|:-------|
| [HH:MM] | Detecção |
| [HH:MM] | Abertura ticket |
| [HH:MM] | Comunicação |
| ... | ... |
| [HH:MM] | Resolução |

## 5. Ações Corretivas (Imediatas)

- [x] [Ação 1 - implementada em [data]]
- [x] [Ação 2 - implementada em [data]]

## 6. Ações Preventivas (Longo Prazo)

- [ ] [Ação 1 - prazo: [data]]
- [ ] [Ação 2 - prazo: [data]]

## 7. Lições Aprendidas

- [Lição 1]
- [Lição 2]

## 8. Recomendações

- [Recomendação 1]
- [Recomendação 2]

---

**Elaborado por**: [Nome]
**Revisado por**: [Nome]
**Data**: [data]
```

### 6.3. Armazenamento

**Local**: [SISTEMA/REPOSITÓRIO]

**Prazo**: Dentro de **[PRAZO]** após resolução do incidente

---

## 7. Indicadores e Métricas de Crise

### 7.1. KPIs de Gestão de Crises

| Métrica | Meta | Como Medir |
|:--------|:-----|:-----------|
| **Time to Detect (TTD)** | < [TEMPO] | [SISTEMA] timestamp → Ticket |
| **Time to Response (TTR)** | < [TEMPO] | Ticket → Primeira comunicação |
| **Time to Resolve (MTTR)** | < [TEMPO] | Ticket → Resolução |
| **Comunicação SLA** | [TEMPO] | Intervalo entre status updates |
| **Post-Mortem SLA** | [PRAZO] | Resolução → Documento publicado |

### 7.2. Análise de Incidentes

**[PERÍODO]**:
- Total de incidentes críticos: [NÚMERO]
- Downtime total: [TEMPO]
- TTD: [TEMPO] [STATUS]
- TTR: [TEMPO] [STATUS]
- MTTR: [TEMPO] [STATUS]
- Post-Mortem: [STATUS]

---

## 8. Melhorias Planejadas

### 8.1. [INICIATIVA 1] ([PRAZO])

**Objetivo**: [DESCRIÇÃO]

**Implementação**:
- [ITEM 1]
- [ITEM 2]
- [ITEM 3]

### 8.2. [INICIATIVA 2] ([PRAZO])

**Objetivo**: [DESCRIÇÃO]

**Implementação**:
- [ITEM 1]
- [ITEM 2]
- [ITEM 3]

---

## 9. Treinamento e Preparação

### 9.1. Status Atual

| Treinamento | Status | Próxima Execução |
|:------------|:-------|:-----------------|
| **Crisis Simulation (Tabletop Exercise)** | [STATUS] | [DATA] |
| **War Room Drill** | [STATUS] | [DATA] |
| **Communication Workshop** | [STATUS] | [DATA] |

### 9.2. Roadmap de Treinamentos

**[PERÍODO]**:
- [TREINAMENTO 1]
- [TREINAMENTO 2]

**[PERÍODO]**:
- [TREINAMENTO 1]
- [TREINAMENTO 2]

Ver `resilience-testing.md` para detalhes

---

## 10. Revisão e Testes

### 10.1. Revisão do Plano

**Frequência**: [PERÍODO] ou quando houver atualização de [CRITÉRIOS]

**Próximas Revisões Agendadas**:
- [DATA 1]
- [DATA 2]

### 10.2. Testes de Procedures

**Simulações de Crise**:
- **Frequência**: A cada **[PERÍODO]**
- **Primeira Simulação**: [DATA]
- **Participantes**: [EQUIPES]

**Evidências**: [ONDE SÃO ARMAZENADAS]

---

## 11. Conclusão

Este plano garante que a organização possua um processo estruturado de resposta a crises, com:

✅ **Fluxos claros** de comunicação e escalonamento  
✅ **SLAs definidos**: First Response < [TEMPO]  
✅ **Ferramentas integradas**: [LISTA]  
✅ **Monitoramento [FREQUÊNCIA]**: [RESPONSÁVEL]  
✅ **Post-Mortem obrigatório**: Lições aprendidas documentadas

**Limitações Atuais**:
- ⚠️ [LIMITAÇÃO 1]
- ⚠️ [LIMITAÇÃO 2]

**Melhorias Planejadas**:
- 🎯 [MELHORIA 1] ([PRAZO])
- 🎯 [MELHORIA 2] ([PRAZO])

---

## 12. Referências

**Documentos Relacionados**:
- `disaster-recovery-plan.md` - DRP procedures
- `business-continuity-plan.md` - BCP
- `recovery-objectives.md` - RPO/RTO
- `resilience-testing.md` - Evidências de testes

**Ferramentas**:
- [FERRAMENTA 1]: [DESCRIÇÃO]
- [FERRAMENTA 2]: [DESCRIÇÃO]

---

## 13. Controle de Versões

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
