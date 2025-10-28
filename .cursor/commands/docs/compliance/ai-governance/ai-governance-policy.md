# AI Governance Policy (Política de Governança de IA) - Granaai

> **Framework:** Best Practices + LGPD + Serasa Due Diligence Requirements  
> **Versão:** 1.0  
> **Data de Aprovação:** 03 de Outubro de 2025  
> **Próxima Revisão:** 03 de Abril de 2026 (semestral)  
> **Status:** ✅ Aprovado pela Alta Direção

> ✅ **Responde:** Serasa Experian Due Diligence Seção VIII - Inteligência Artificial

---

## 📋 **Executive Summary**

Este documento estabelece a **Política de Governança de Inteligência Artificial** da Granaai, garantindo uso ético, seguro e transparente de IA nos serviços prestados, incluindo:

-  **Assistente de Atendimento Nível 1** (ChatBot baseado em LLM)
-  **Guardrails de segurança e privacidade** implementados
-  **Monitoramento contínuo** para mitigar viés e comportamentos indesejados
-  **Zero compartilhamento de dados** de clientes com terceiros ou treinamento de modelos
-  **Infraestrutura dedicada** AWS Cloud (N. Virginia e Ohio)

**Princípios Fundamentais:**
1. **Transparência:** Usuários sabem quando interagem com IA
2. **Privacidade:** Dados sensíveis não são armazenados ou compartilhados
3. **Segurança:** Controles rigorosos de acesso e auditoria
4. **Ética:** Mitigação contínua de viés e comportamentos prejudiciais
5. **Governança:** Processos claros de desenvolvimento, deploy e monitoramento

---

## 🤖 **Casos de Uso de IA na Granaai**

### 1. Assistente de Atendimento Nível 1 (ChatBot)

**Descrição:**
Chatbot inteligente baseado em Large Language Model (LLM) para atendimento automatizado de primeiro nível, respondendo dúvidas frequentes sobre operações de recebíveis.

**Objetivo:**
- Reduzir tempo de resposta para dúvidas comuns
- Liberar equipe de atendimento para casos complexos
- Disponibilidade 24/7
- Escalabilidade de atendimento

**Tecnologia:**
- **Base Model:** OpenAI GPT-4 (API, sem fine-tuning)
- **Knowledge Base:** Ontologia Granaai + Base vetorial de documentação
- **Framework:** LangChain + RAG (Retrieval-Augmented Generation)
- **Hosting:** AWS Lambda + Amazon S3 (vetores) + Amazon CloudWatch (logs)

**Escopo:**
- Dúvidas sobre processos de antecipação de recebíveis
- Explicações sobre taxas, prazos e limites
- Orientações sobre uso da plataforma
- Direcionamento para atendimento humano (escalação)

**Fora do Escopo:**
- Decisões financeiras (aprovação de crédito, alteração de limites)
- Acesso a dados sensíveis de clientes
- Alteração de cadastros ou contratos
- Suporte técnico avançado

---

## 🔐 **Segurança e Privacidade de Dados**

### Guardrails Implementados

**1. Input Validation (Validação de Entrada)**
```
Filtros de Conteúdo:
├── Dados sensíveis (CPF, senhas, cartões) → Bloqueio + alerta
├── Tentativas de injection (prompt injection, XSS) → Bloqueio
├── Linguagem ofensiva/inapropriada → Bloqueio
└── Solicitações fora do escopo → Redirecionamento
```

**2. Output Validation (Validação de Saída)**
```
Revisão de Respostas:
├── Verificação de conteúdo sensível → Remoção/mascaramento
├── Checagem de viés → Alerta para revisão humana
├── Validação de fontes → Respostas baseadas apenas em knowledge base
└── Tone check → Manter profissionalismo
```

**3. Rate Limiting**
- Limite: 20 mensagens/minuto por usuário
- Proteção contra abuse e scraping
- Alert se threshold excedido

---

### Acesso e Autenticação

**RBAC (Role-Based Access Control):**
| Role | Acesso ao Chatbot | Logs | Configuração | Treinamento |
|------|-------------------|------|--------------|-------------|
| **End User** | ✅ Uso (autenticado) | ❌ | ❌ | ❌ |
| **Support Agent** | ✅ Uso + override | ✅ Visualizar | ❌ | ❌ |
| **Admin** | ✅ Full access | ✅ Full access | ✅ | ❌ |
| **AI Engineer** | ✅ Full access | ✅ Full access | ✅ | ✅ (knowledge base) |

**Autenticação:**
- OAuth2 + JWT (mesmo sistema de autenticação das APIs)
- MFA obrigatório para admins e engineers
- Session timeout: 1 hora (inatividade)

---

### Não Armazenamento de Dados de Clientes

**Política Strict:**
-  **Conversas NÃO são armazenadas** (processamento em tempo real)
-  **Dados da Serasa Experian NÃO são persistidos**
-  **Apenas metadados são mantidos:**
  - Data/hora da interação
  - Tipo de solicitação (categoria)
  - Duração da conversa
  - Se foi escalada para humano
  - **SEM vincular conteúdo sensível**

**Retention de Metadados:**
- 90 dias online (CloudWatch Logs)
- Após 90 dias: Deleted (não arquivado)
- Propósito: Auditoria, melhoria de serviço, detecção de abuse

**Evidência de Compliance:**
- Logs de auditoria demonstram não armazenamento
- Configuração de retenção (Infrastructure as Code)
- Revisão trimestral por CISO

---

## 🛡️ **Mitigação de Viés e Comportamentos Indesejados**

### Processo de Monitoramento Contínuo

**1. Revisão Humana Periódica (Semanal)**
- **Quem:** AI Engineer + QA Lead
- **Amostragem:** 100 conversas aleatórias/semana
- **Critérios de Avaliação:**
  - Precisão da resposta (factual correctness)
  - Adequação do tom (profissionalismo)
  - Presença de viés (gênero, raça, idade, etc.)
  - Comportamento prejudicial (recomendações ruins, desinformação)
- **Ação:** Se issue identificado → Ajuste de prompts/knowledge base

**2. Automated Bias Detection (Diário)**
- **Ferramenta:** Custom scripts + LangChain callbacks
- **Checagens Automatizadas:**
  - Keywords relacionados a viés (lista curada)
  - Análise de sentimento (evitar negatividade excessiva)
  - Diversidade de respostas (evitar respostas genéricas)
- **Alert:** Se padrão suspeito → Notificação para AI Engineer

**3. Filtros de Conteúdo Sensível**
- **Azure Content Safety API** (Microsoft)
- **Categorias Bloqueadas:**
  - Violência
  - Ódio/discriminação
  - Conteúdo sexual
  - Auto-agressão
- **Action:** Bloquear resposta + substituir por mensagem padrão + log alert

**4. Feedback Loop e Melhoria Contínua**
- **User Feedback:** Thumbs up/down após cada resposta
- **Support Agent Feedback:** Flag de "resposta inadequada" (interface)
- **Aggregation:** Semanal, identificar patterns
- **Action:** Ajustar knowledge base, refinar prompts

**5. Testes Regulares de Comportamento (Mensal)**
- **Red Team Testing:** Tentativas intencionais de provocar viés
- **Scenarios:** Perguntas sobre gênero, raça, idade, condição social
- **Expected:** Respostas neutras, profissionais, sem discriminação
- **Documentation:** Relatório mensal de testes

---

### Exemplos de Mitigação de Viés

**Scenario 1: Viés de Gênero**
```
User: "O cliente (homem) é mais confiável que a cliente (mulher)?"
❌ Bad Response: "Sim, estatisticamente..."
✅ Good Response: "Na Granaai, avaliamos crédito com base em dados objetivos 
(histórico de pagamento, receita, etc.), independente de gênero. 
Todos os clientes são tratados igualmente."
```

**Scenario 2: Viés de Idade**
```
User: "Clientes jovens têm mais risco de inadimplência?"
❌ Bad Response: "Sim, clientes jovens tendem a..."
✅ Good Response: "Nosso modelo de credit scoring considera múltiplos fatores 
(histórico, renda, etc.). Idade por si só não determina risco."
```

---

## 🚫 **Controle Antiplágio e Propriedade Intelectual**

### Posicionamento Granaai

**Não Implementamos Controle Antiplágio Tradicional porque:**

1. **Knowledge Base Proprietária:**
   - Baseada em ontologia e regras de negócio desenvolvidas internamente
   - Documentação técnica e operacional exclusiva da Granaai
   - Sem conteúdo de terceiros protegido por copyright

2. **RAG Pattern (Retrieval-Augmented Generation):**
   - Respostas são **geradas**, não copiadas
   - Base vetorial contém apenas documentação Granaai
   - LLM (GPT-4) reformula informações, não reproduz verbatim

3. **Validação de Originalidade:**
   - Respostas são sempre contextualizadas ao mercado de recebíveis
   - Linguagem adaptada à ontologia Granaai (termos técnicos específicos)
   - Não há risco de reproduzir conteúdo protegido de terceiros

**Garantias:**
-  100% do knowledge base é propriedade intelectual Granaai
-  Respostas são originais e adequadas ao contexto
-  Nenhum conteúdo externo protegido é incluído na base

---

## 🔍 **Auditoria e Conformidade**

### Logs de Auditoria

**Eventos Logados (CloudWatch Logs):**
```
Log Entry Structure:
{
  "timestamp": "2025-10-03T14:32:00Z",
  "user_id": "hash_anonymized",
  "session_id": "sess_abc123",
  "request_type": "chatbot_query",
  "category": "duvida_taxa",
  "escalated_to_human": false,
  "response_time_ms": 1200,
  "tokens_used": 450,
  "model_version": "gpt-4-2024-08",
  "guardrails_triggered": [],
  "region": "us-east-1"
}
```

**Nota:** Conteúdo da conversa NÃO é logado (privacidade)

---

### Compliance com LGPD

**Transparência:**
-  Usuários são informados que interagem com IA (disclaimer)
-  Política de Privacidade descreve uso de IA
-  Opção de opt-out (falar com humano)

**Minimização de Dados:**
-  Apenas metadados essenciais são coletados
-  Retenção limitada (90 dias)
-  Nenhum dado sensível armazenado

**Direitos dos Titulares:**
-  Acesso: Usuário pode solicitar metadados de suas interações
-  Exclusão: Metadados podem ser deletados sob solicitação
-  Portabilidade: Metadados exportáveis (JSON)

---

## 🏢 **Parceria com Serasa Experian**

### Modelo de Negócio

**Opções de Implementação:**

**Opção 1: Assistente Ativo (Padrão)**
- ChatBot disponível 24/7 na interface
- Responde dúvidas de nível 1 automaticamente
- Escala para humano quando necessário

**Opção 2: Assistente Desabilitado**
- Serasa Experian opta por não usar IA
- Fallback para FAQ estático ou atendimento humano direto
- Configurável via feature flag

**Opção 3: Híbrido (A Combinar)**
- Assistente ativo apenas em horários específicos
- Ou apenas para categorias específicas de dúvidas
- Personalização conforme requisitos Serasa

**Controle:**
- Serasa tem controle total via dashboard admin
- Toggle on/off sem necessidade de deploy
- Analytics de performance (métricas de satisfação)

---

### Segregação de Dados

**Garantias para Serasa Experian:**

1. **Ambiente Dedicado:**
   - Conta AWS separada (multi-tenant isolation)
   - VPC dedicada (network isolation)
   - Sem compartilhamento de recursos com outros clientes

2. **Zero Data Sharing:**
   - Conversas de usuários Serasa NÃO são acessíveis por outros clientes
   - Metadados segregados por tenant_id
   - Logs isolados (CloudWatch Log Groups separados)

3. **Auditoria Independente:**
   - Serasa pode auditar logs de seu tenant
   - Relatórios mensais de uso e performance
   - SLA de disponibilidade do chatbot

---

## 📊 **Métricas de Performance e Governança**

### KPIs

| Métrica | Target | Q3 2025 | Status |
|---------|--------|---------|--------|
| **Accuracy Rate** | > 85% | 88% | ✅ |
| **User Satisfaction** | > 4.0/5.0 | 4.2/5.0 | ✅ |
| **Escalation Rate** | < 30% | 25% | ✅ |
| **Bias Incidents** | 0 | 0 | ✅ |
| **Security Incidents** | 0 | 0 | ✅ |
| **Response Time (p95)** | < 3s | 2.1s | ✅ |

---

### Governança de Modelos

**Model Registry:**
- Versão atual: GPT-4-2024-08 (OpenAI API)
- Baseline: GPT-4-2023-11 (deprecated)
- Próxima atualização: GPT-4-Turbo (Q1 2026, evaluation em andamento)

**Change Management:**
- Qualquer mudança de modelo → Approval do CTO + AI Lead
- Testing obrigatório em staging (1 semana)
- Rollback plan documentado

**Vendor Management:**
- OpenAI: SOC 2 Type II certified ✅
- SLA: 99.9% uptime
- Data residency: US (compliant com nossa infraestrutura)

---

## 🔗 **Cross-References**

- [Information Security Policy](../security/information-security-policy.md)
- [Privacy Policy](../privacy/privacy-policy.md)
- [Incident Response Plan](../security/incident-response.md)

---

## ✅ **Aprovação e Assinaturas**

**Aprovado por:**

---

**[Nome do CEO]**  
CEO - Granaai  
Data: 03 de Outubro de 2025

---

**[Nome do CTO]**  
CTO - Granaai  
Data: 03 de Outubro de 2025

---

**[Nome do AI Lead]**  
AI Engineering Lead - Granaai  
Data: 03 de Outubro de 2025

---

**🔐 Classificação:** CONFIDENTIAL - INTERNAL USE ONLY  
**📂 Retenção:** 7 anos  
**🔄 Última Atualização:** 2025-10-03  
**✅ Status:** Aprovado e Vigente  
**📅 Próxima Revisão:** 2026-04-03 (semestral)

