---
title: "Integração com Planos BC/DR do Cliente"
document_type: "Carta de Resposta Formal / Compromisso"
classification: "CONFIDENCIAL - USO CONTRATUAL"
version: "1.0"
date: "[DATA]"
owner: "[CTO/CISO]"
---

# Integração com Planos BC/DR do Cliente

**[PAPEL TIMBRADO DA [NOME DA EMPRESA]]**

---

**Data:** [DD/MM/AAAA]

**Para:** [Nome do Cliente]  
**Atenção:** [Nome do Gestor de Continuidade do Cliente]  
**Ref:** Integração de Planos de Continuidade de Negócios e Recuperação de Desastres

---

## 1. Declaração de Reconhecimento e Compromisso

A **[NOME DA EMPRESA]**, inscrita no CNPJ [NÚMERO], com sede em [ENDEREÇO COMPLETO], por meio de seu representante legal abaixo assinado, declara que:

1. **RECONHECE** a importância estratégica do **[NOME DO CLIENTE]** como parceiro de negócio e a criticidade dos serviços prestados para as operações do cliente;

2. **ESTÁ CIENTE** de que o **[NOME DO CLIENTE]** possui **Planos de Continuidade de Negócios (BCP)** e **Planos de Recuperação de Desastres (DRP)** próprios, e que os serviços da [NOME DA EMPRESA] podem estar incluídos no escopo destes planos;

3. **COMPROMETE-SE** a integrar seus próprios planos de BC/DR com os do **[NOME DO CLIENTE]**, garantindo alinhamento de procedimentos, comunicação e testes conjuntos;

4. **DISPONIBILIZA** toda documentação relevante de seus planos de BC/DR para análise e incorporação nos planos do cliente (ver seção 3 deste documento);

5. **ACEITA** participar de exercícios e testes conjuntos de continuidade e recuperação, conforme solicitado pelo cliente, observando-se os prazos de notificação estabelecidos;

6. **MANTÉM** canais de comunicação 24/7 para coordenação em situações de crise ou desastre que afetem ambas as organizações.

---

## 2. Análise de Dependências e Interdependências

### 2.1 Serviços Críticos Fornecidos

A **[NOME DA EMPRESA]** fornece ao **[NOME DO CLIENTE]** os seguintes serviços críticos:

| Serviço | Descrição | Criticidade para Cliente | RTO | RPO |
|---------|-----------|--------------------------|-----|-----|
| **API de Autenticação** | Autenticação OAuth 2.0 de usuários finais | Alta | 1 hora | 15 min |
| **API de Consulta** | Consulta de dados financeiros via REST API | Crítica | 2 horas | 15 min |
| **API de Atualização** | Atualização de registros via REST API | Alta | 2 horas | 15 min |
| **Webhooks de Notificações** | Notificações assíncronas de eventos | Média | 4 horas | 30 min |

**Impacto no Cliente em Caso de Falha:**
- **Criticidade Alta/Crítica:** Impacto direto nas operações do cliente, podendo causar interrupção de serviços aos usuários finais do cliente.
- **Criticidade Média:** Impacto em funcionalidades secundárias ou processos batch do cliente.

### 2.2 Dependências da [NOME DA EMPRESA]

Para garantir a continuidade dos serviços ao **[NOME DO CLIENTE]**, a **[NOME DA EMPRESA]** depende de:

| Dependência | Tipo | Criticidade | Provedor | Plano de Contingência |
|-------------|------|-------------|----------|-----------------------|
| **AWS Cloud** | Infraestrutura (IaaS) | Crítica | Amazon Web Services | Multi-region (us-east-1 + us-west-2) |
| **Internet (ISP Primário)** | Conectividade | Crítica | [NOME DO ISP] | ISP Backup (4G/5G) |
| **DNS (Route53)** | Resolução de domínio | Crítica | AWS | Redundância Multi-AZ + Health Checks |
| **GitHub** | Repositório de código | Alta | GitHub Inc. | Mirror em AWS CodeCommit |

**Nota:** Não há dependência direta do **[NOME DO CLIENTE]** para funcionamento dos serviços da [NOME DA EMPRESA]. A relação é **unidirecional** (fornecemos serviços ao cliente, mas não consumimos serviços do cliente para operar).

### 2.3 Dependências do Cliente (se aplicável)

**⚠️ ATENÇÃO:** Esta seção deve ser preenchida em conjunto com o **[NOME DO CLIENTE]**.

| Dependência do Cliente | Impacto se [NOME DA EMPRESA] Falhar | Processo Afetado | Alternativa Disponível |
|------------------------|--------------------------------------|------------------|------------------------|
| [PROCESSO DO CLIENTE 1] | [DESCRIÇÃO DO IMPACTO] | [NOME DO PROCESSO] | [SIM / NÃO] - [DESCRIÇÃO] |
| [PROCESSO DO CLIENTE 2] | [DESCRIÇÃO DO IMPACTO] | [NOME DO PROCESSO] | [SIM / NÃO] - [DESCRIÇÃO] |

**Exemplo:**
```
| Portal de Consulta Web do Cliente | Funcionalidade de consulta indisponível | Atendimento ao usuário final | NÃO - Cliente não possui backup provider |
```

---

## 3. Documentação Disponibilizada

A **[NOME DA EMPRESA]** disponibiliza os seguintes documentos para integração com os planos do **[NOME DO CLIENTE]**:

| # | Documento | Descrição | Localização |
|---|-----------|-----------|-------------|
| 1 | **Plano de Continuidade de Negócios (BCP)** | Estratégias e procedimentos para continuidade operacional | `01-plano-continuidade-negocios.md` |
| 2 | **Plano de Recuperação de Desastres (DRP)** | Procedimentos técnicos de failover multi-region | `02-plano-recuperacao-desastres.md` |
| 3 | **Plano de Gerenciamento de Crise** | Matriz de comunicação e templates de notificação | `03-plano-gerenciamento-crise.md` |
| 4 | **Evidências de Treinamentos** | Programa de conscientização e capacitação da equipe | `04-evidencias-treinamentos.md` |
| 5 | **Relatório de Testes Anuais** | Evidências de testes de DR/BC (RTO/RPO alcançados) | `05-relatorio-testes-anuais.md` |
| 6 | **Política de Backup e Restauração** | Regra 3-2-1, RTOs/RPOs por sistema, procedimentos de restauração | `06-politica-backup-restauracao.md` |
| 7 | **Certificação ISO 22301 / SOC 2** | Evidências de conformidade com frameworks internacionais | `07-certificacao-compliance.md` |
| 8 | **Confirmação de SLAs** | Declaração formal de SLAs de disponibilidade e performance | `08-confirmacao-slas.md` |
| 9 | **Documentação Contratual de SLAs** | Extrato de cláusulas contratuais e histórico de performance | `09-documentacao-contratual-slas.md` |

**Acesso aos Documentos:**
-  **Opção 1:** Data room virtual (link seguro com senha) - expira em 90 dias
-  **Opção 2:** Envio por email criptografado (GPG/PGP)
-  **Opção 3:** Entrega física em mídia criptografada (USB)

**NDA Requerido:** Sim, conforme template padrão já assinado entre as partes.

---

## 4. Alinhamento de Procedimentos

### 4.1 Notificação em Caso de Incidente

**Procedimento da [NOME DA EMPRESA] → [NOME DO CLIENTE]:**

| Severidade | Tempo de Notificação | Canais | Informações Fornecidas |
|------------|---------------------|--------|------------------------|
| **P1 (Crítico)** | **15 minutos** | • Email: [EMAIL CONTATO TÉCNICO]<br/>• Telefone/SMS: [TELEFONE 24/7]<br/>• Status Page | • Descrição do incidente<br/>• Serviços afetados<br/>• Impacto estimado<br/>• ETA de resolução<br/>• Ponto de contato |
| **P2 (Alto)** | **30 minutos** | • Email<br/>• Status Page | Idem P1 |
| **P3 (Médio)** | **2 horas** | • Email<br/>• Status Page | Idem P1 |
| **P4 (Baixo)** | **24 horas** | • Email | Descrição e ETA |

**Template de Notificação:** Conforme **[03-plano-gerenciamento-crise.md](03-plano-gerenciamento-crise.md)** - Seção 3.5

**Atualizações:**
- **P1:** Atualizações a cada **1 hora** até resolução
- **P2:** Atualizações a cada **4 horas** até resolução
- **P3/P4:** Atualização final quando resolvido

**Procedimento do [NOME DO CLIENTE] → [NOME DA EMPRESA] (se aplicável):**
- [A SER DEFINIDO EM CONJUNTO COM O CLIENTE]
- Exemplo: Cliente deve notificar se seus sistemas que consomem nossas APIs estiverem indisponíveis (para evitar falso alarme de downtime)

### 4.2 Ativação de Planos de DR

**Cenários de Ativação Coordenada:**

| Cenário | Responsável por Ativar DR | Notificação à Outra Parte | Timeline |
|---------|---------------------------|---------------------------|----------|
| **Falha completa AWS us-east-1** | [NOME DA EMPRESA] | Cliente notificado em 15 min | [NOME DA EMPRESA] ativa DR em 2h |
| **Desastre regional (ex: furacão na costa leste EUA)** | Ambas as partes (coordenado) | Comunicação via War Room conjunta | Timeline combinado |
| **Falha nos sistemas do Cliente** | [NOME DO CLIENTE] | [NOME DA EMPRESA] notificada (para awareness) | N/A (não afeta [NOME DA EMPRESA]) |
| **Ataque cibernético coordenado** | Ambas as partes (coordenado) | Comunicação imediata via telefone | Timeline combinado |

**War Room Conjunta (Incidentes P1 Coordenados):**
- **Google Meet Link:** [LINK PERMANENTE] (criado especificamente para coordenação cliente)
- **Slack Channel:** `#war-room-[cliente]` (integração entre Slack da [NOME DA EMPRESA] e [NOME DO CLIENTE])
- **Participantes Obrigatórios:**
  - [NOME DA EMPRESA]: CTO, DevOps Lead, CISO
  - [NOME DO CLIENTE]: [DEFINIR EM CONJUNTO]

### 4.3 Testes Conjuntos

**Compromisso:**
A **[NOME DA EMPRESA]** compromete-se a participar de **testes conjuntos** de BC/DR com o **[NOME DO CLIENTE]** conforme solicitado, observando-se:

**Frequência:**
- **Tabletop Exercise (discussão):** Até **2x por ano**
- **Simulação Técnica:** Até **1x por ano**
- **Teste Completo (produção):** Até **1x a cada 2 anos**

**Notificação:**
- **Tabletop:** Mínimo de **15 dias** de antecedência
- **Simulação Técnica:** Mínimo de **30 dias** de antecedência
- **Teste Completo:** Mínimo de **60 dias** de antecedência

**Formato:**
- **Virtual (Google Meet):** Preferencial para Tabletop Exercises
- **Presencial (on-site):** Se necessário (custos de deslocamento a negociar)
- **Híbrido:** Combinação de virtual + presencial

**Entregáveis Pós-Teste:**
- Relatório de teste conjunto (formato template **[05-relatorio-testes-anuais.md](05-relatorio-testes-anuais.md)**)
- Identificação de gaps de integração
- Plano de ação corretiva conjunta (se necessário)

**Custos:**
- Participação em **até 2 testes por ano sem custo adicional** (cobertos pelo contrato)
- Testes adicionais ou fora do horário comercial sujeitos a negociação

---

## 5. Contatos para Coordenação BC/DR

### 5.1 Contatos da [NOME DA EMPRESA]

| Papel | Nome | Email | Telefone 24/7 | Responsabilidade |
|-------|------|-------|---------------|------------------|
| **CTO (Autoridade Final)** | [NOME] | [EMAIL] | [TELEFONE] | Aprovação de ativação de DR, decisões estratégicas |
| **CISO (Segurança e Compliance)** | [NOME] | [EMAIL] | [TELEFONE] | Incidentes de segurança, comunicação com cliente |
| **DevOps Lead (Operações)** | [NOME] | [EMAIL] | [TELEFONE] | Execução técnica de DR, coordenação de equipe |
| **Customer Success Manager** | [NOME] | [EMAIL] | [TELEFONE COMERCIAL] | Ponto focal do cliente (horário comercial) |
| **On-Call Primário (24/7)** | [ROTATIVO] | oncall@[EMPRESA].com | [TELEFONE] | Primeiro respondente para incidentes P1/P2 |

**Email de Grupo para Notificações de Crise:**
- `crisis-[cliente]@[EMPRESA].com` (alcança todos os contatos acima simultaneamente)

### 5.2 Contatos do [NOME DO CLIENTE] (a ser preenchido em conjunto)

| Papel | Nome | Email | Telefone 24/7 | Responsabilidade |
|-------|------|-------|---------------|------------------|
| **Gestor de Continuidade** | [NOME] | [EMAIL] | [TELEFONE] | [DESCRIÇÃO] |
| **Contato Técnico Principal** | [NOME] | [EMAIL] | [TELEFONE] | [DESCRIÇÃO] |
| **On-Call 24/7** | [NOME/ROTATIVO] | [EMAIL] | [TELEFONE] | [DESCRIÇÃO] |

### 5.3 Escalação (Ladder de Comunicação)

**Nível 1 - Operacional (0-30 min):**
- On-Call da [NOME DA EMPRESA] → Contato Técnico do Cliente
- Objetivo: Notificação inicial e avaliação

**Nível 2 - Tático (30 min - 2 horas):**
- DevOps Lead + CISO → Gestor de Continuidade do Cliente
- Objetivo: Coordenação de resposta e decisões técnicas

**Nível 3 - Estratégico (> 2 horas ou impacto severo):**
- CTO/CEO da [NOME DA EMPRESA] → [C-LEVEL DO CLIENTE]
- Objetivo: Decisões executivas, comunicação com stakeholders

---

## 6. Cenários de Coordenação (Exemplos)

### 6.1 Cenário A: Falha Regional AWS us-east-1

**Situação:**
- AWS reporta "Service Disruption" em múltiplos serviços em us-east-1
- Serviços da [NOME DA EMPRESA] ficam indisponíveis

**Ações Coordenadas:**

| Tempo | [NOME DA EMPRESA] | [NOME DO CLIENTE] |
|-------|-------------------|-------------------|
| **T+0 min** | Detecta falha (health checks) | N/A |
| **T+5 min** | Equipe interna mobilizada (CloudWatch Alarm + Slack) | N/A |
| **T+10 min** | Avalia impacto: 100% das APIs indisponíveis | N/A |
| **T+15 min** | **Notifica Cliente (P1):** Email + Telefone | Recebe notificação, ativa procedimentos internos de contingência |
| **T+20 min** | Declara ativação de DR (failover para us-west-2) | Monitora Status Page da [NOME DA EMPRESA] |
| **T+30 min** | Envia atualização: "Failover em andamento, ETA 1h30" | Comunica internamente (equipes afetadas) |
| **T+90 min** | Atualização: "50% de progresso" | Prepara para retomada de operações |
| **T+108 min** | **Declara "Serviços Restaurados"** | Valida conectividade, retoma operações |
| **T+120 min** | Envia confirmação final + RTO/RPO alcançados | Confirma normalização |
| **T+24h** | Envia Post-Mortem detalhado | Analisa impacto em suas operações |

**Resultado Esperado:**
- Cliente fica ciente desde o início (15 min)
- Cliente pode ativar processos de contingência próprios
- Restauração coordenada e comunicada

### 6.2 Cenário B: Manutenção Programada (Não-Coordenada)

**Situação:**
- [NOME DA EMPRESA] precisa realizar manutenção programada (ex: upgrade de banco de dados)

**Ações:**

| Tempo | [NOME DA EMPRESA] | [NOME DO CLIENTE] |
|-------|-------------------|-------------------|
| **T-7 dias** | Agenda janela de manutenção (ex: domingo, 02:00-04:00 BRT) | N/A |
| **T-72h** | **Notifica Cliente:** Email + Status Page | Recebe notificação, avalia impacto |
| **T-48h** | Cliente pode solicitar adiamento (se houver conflito) | Cliente confirma que janela é aceitável |
| **T-24h** | Envia lembrete da manutenção | Comunica internamente |
| **T-0 (início)** | Inicia manutenção, atualiza Status Page | Monitora Status Page |
| **T+2h** | Conclui manutenção, valida serviços | Valida conectividade |
| **T+2h** | Declara "Manutenção concluída, serviços normalizados" | Confirma normalização |

**Nota:** Janelas de manutenção **não são contabilizadas** como downtime para SLA.

---

## 7. Compromisso de Inclusão nos Planos

A **[NOME DA EMPRESA]** compromete-se a:

1. **Revisar e atualizar** seus planos de BC/DR sempre que houver mudanças significativas em:
   - Arquitetura técnica
   - Fornecedores críticos
   - RTOs/RPOs
   - Equipe responsável

2. **Notificar o Cliente** com **30 dias de antecedência** sobre mudanças materiais que possam afetar a integração dos planos.

3. **Incluir o [NOME DO CLIENTE]** em:
   - Cronogramas de testes de DR/BC (notificação prévia)
   - Análises pós-incidente (lessons learned compartilhadas)
   - Melhorias de processos resultantes de testes ou incidentes

4. **Disponibilizar acesso** a:
   - Status Page em tempo real (`https://status.[EMPRESA].com`)
   - Relatórios mensais de SLA
   - Evidências de testes de DR (sumário executivo)

5. **Manter confidencialidade** de todas as informações dos planos do cliente que forem compartilhadas (conforme NDA vigente).

---

## 8. Revisão e Atualização

**Frequência de Revisão:**
- **Anual:** Reunião conjunta para revisar integração de planos (virtual ou presencial)
- **Ad-hoc:** Sempre que houver mudança material em qualquer das partes

**Responsáveis:**
- [NOME DA EMPRESA]: CTO ou CISO
- [NOME DO CLIENTE]: Gestor de Continuidade

**Formato da Reunião:**
- Agenda pré-definida (enviada com 2 semanas de antecedência)
- Duração: 2 horas
- Tópicos:
  - Mudanças nos planos de ambas as partes
  - Lições aprendidas de incidentes/testes
  - Oportunidades de melhoria na integração
  - Agendamento de testes conjuntos (próximo ano)

**Ata de Reunião:**
- Documentada e compartilhada entre as partes (dentro de 5 dias úteis)
- Ações identificadas com responsáveis e prazos

---

## 9. Checklist de Validação

- [ ] Declaração de reconhecimento e compromisso assinada
- [ ] Análise de dependências completa (ambas as direções)
- [ ] Documentação de BC/DR disponibilizada ao cliente
- [ ] Procedimentos de notificação alinhados (SLAs de comunicação)
- [ ] Procedimentos de ativação de DR alinhados (cenários coordenados)
- [ ] Compromisso de testes conjuntos formalizado (frequência, notificação)
- [ ] Contatos de coordenação atualizados (ambas as partes)
- [ ] Exemplos de cenários de coordenação documentados
- [ ] Compromisso de inclusão e manutenção formalizado
- [ ] Processo de revisão anual definido

---

## 10. Assinatura e Autorização

Esta declaração de integração foi autorizada e assinada pelo representante legal de **[NOME DA EMPRESA]**:

---

**Assinatura:**

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

**Nome:** [NOME COMPLETO - CTO ou CEO]  
**Cargo:** [CTO / CEO]  
**CPF:** [NÚMERO]  
**Data:** [DD/MM/AAAA]  
**Local:** [CIDADE - UF]

---

**Testemunhas:**

1. \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
   **Nome:** [NOME - CISO]  
   **CPF:** [NÚMERO]

2. \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
   **Nome:** [NOME - Jurídico]  
   **CPF:** [NÚMERO]

---

## 11. Anexos

### Anexo A: Diagrama de Integração de Planos

```mermaid
graph TD
    A[Incidente Detectado] --> B{Severidade?}
    B -->|P1 Crítico| C[[NOME DA EMPRESA] Notifica Cliente em 15 min]
    B -->|P2/P3| D[[NOME DA EMPRESA] Notifica Cliente em 30min-2h]
    
    C --> E{Impacto no Cliente?}
    E -->|Alto| F[Cliente Ativa Contingência]
    E -->|Baixo| G[Cliente Monitora]
    
    F --> H[[NOME DA EMPRESA] Ativa DR]
    H --> I[War Room Conjunta]
    I --> J[Coordenação de Resposta]
    J --> K[Serviços Restaurados]
    K --> L[Cliente Retoma Operações]
    L --> M[Post-Mortem Conjunto]
    
    G --> K
    D --> G
```

### Anexo B: Matriz de Responsabilidades (RACI)

| Atividade | [NOME DA EMPRESA] | [NOME DO CLIENTE] |
|-----------|-------------------|-------------------|
| **Detecção de Incidente (lado [EMPRESA])** | R / A | I |
| **Notificação de Incidente P1** | R / A | I |
| **Ativação de DR ([EMPRESA])** | R / A | C / I |
| **Ativação de Contingência (Cliente)** | I | R / A |
| **War Room Conjunta (P1)** | R / A | R / A |
| **Comunicação Externa (usuários finais do cliente)** | I | R / A |
| **Testes de DR/BC** | R / A | C |
| **Testes Conjuntos** | R | R |
| **Post-Mortem** | R / A | C |
| **Revisão Anual de Integração** | R | R |

**Legenda:**
- **R (Responsible):** Executa
- **A (Accountable):** Aprova e é responsável final
- **C (Consulted):** Consultado antes da decisão
- **I (Informed):** Informado após a decisão

---

**🔒 Classificação:** CONFIDENCIAL - USO CONTRATUAL  
**📁 Categoria:** BC/DR Integration  
**📅 Data de Criação:** [DATA]  
**🔄 Revisão:** Anual ou por mudança material  
**👤 Responsável:** [NOME - CTO/CISO]

---

**Versão do Template:** 1.0 - Genérico  
**Data de Criação:** 09/10/2025  
**Para uso com:** Clientes enterprise  
**Tipo:** Carta de Integração de Planos BC/DR

