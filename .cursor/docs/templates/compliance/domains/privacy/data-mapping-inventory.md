# Data Mapping & Inventory (Mapeamento de Dados) - {{COMPANY_NAME}}

> **Framework:** LGPD Art. 37 + ISO 27001:2022 - Cláusula A.5.9  
> **Versão:** 1.0  
> **Data de Aprovação:** 03 de Outubro de 2025  
> **Próxima Revisão:** 03 de Abril de 2026 (semestral)  
> **Status:** ✅ Aprovado pela Alta Direção

> ✅ **Responde:** Due Diligence de Cliente Enterprise Item 9.12 - "Mapa detalhado dos processos de tratamento de dados pessoais"

---

## 📋 **Executive Summary**

Este documento apresenta o **mapeamento completo dos processos de tratamento de dados pessoais** da {{COMPANY_NAME}}, desde a coleta até o descarte ou guarda, conforme requisitos da LGPD e item 9.12 do Due Diligence (Cliente Enterprise - {{CUSTOMER_NAME}}).

**Escopo:**
-  Tipos de dados tratados (PII, financeiros, operacionais)
-  Como são tratados (coleta, processamento, armazenamento)
-  Onde são tratados (infraestrutura AWS, localização)
-  Para que serve o tratamento (finalidades)
-  O que é compartilhado (integrações, terceiros)
-  Transferência internacional (AWS US regions)
-  Retenção e descarte (lifecycle policies)

---

## 📊 **Inventário de Dados Pessoais**

### Categoria 1: Dados Cadastrais (Usuários)

| Campo | Tipo LGPD | Finalidade | Base Legal | Retenção | Compartilhado? |
|-------|-----------|------------|------------|----------|----------------|
| **Nome Completo** | PII | Identificação, contrato | Execução de contrato | Ativo + 5 anos | Registradoras (TAG, CERC, B3) |
| **CPF** | PII | Identificação, KYC | Execução de contrato + Obrigação legal | Ativo + 7 anos (BACEN) | Registradoras, (Cliente Enterprise - {{CUSTOMER_NAME}}) (consulta) |
| **Email** | PII | Comunicação, autenticação | Execução de contrato | Ativo + 2 anos | Não |
| **Telefone** | PII | Comunicação, MFA | Execução de contrato | Ativo + 2 anos | Não |
| **Data de Nascimento** | PII | Validação de maioridade, KYC | Execução de contrato | Ativo + 5 anos | Não |
| **RG** | PII | Identificação, KYC | Execução de contrato | Ativo + 5 anos | Não |
| **Endereço** | PII | Contato, validação | Execução de contrato | Ativo + 5 anos | Não |

---

### Categoria 2: Dados Financeiros

| Campo | Tipo LGPD | Finalidade | Base Legal | Retenção | Compartilhado? |
|-------|-----------|------------|------------|----------|----------------|
| **Dados Bancários** (banco, agência, conta) | PII | Pagamentos, transferências | Execução de contrato | Ativo + 7 anos (BACEN) | Stripe (tokenizado) |
| **Transações Financeiras** (valor, data, status) | PII | Processamento de recebíveis | Execução de contrato | 7 anos (BACEN) | Registradoras |
| **Score de Crédito** | PII | Análise de risco | Legítimo interesse | Ativo + 5 anos | Não (interno) |
| **Histórico de Pagamentos** | PII | Análise de crédito | Legítimo interesse | 7 anos | Não |
| **Limite de Crédito Aprovado** | PII | Operações financeiras | Execução de contrato | Ativo + 5 anos | Não |

---

### Categoria 3: Dados Operacionais (Logs)

| Campo | Tipo LGPD | Finalidade | Base Legal | Retenção | Compartilhado? |
|-------|-----------|------------|------------|----------|----------------|
| **IP Address** | PII | Segurança, auditoria | Legítimo interesse | 90 dias | Não |
| **User Agent** | Não-PII | Suporte técnico | Legítimo interesse | 90 dias | Não |
| **Login Timestamps** | PII (indiretamente) | Auditoria, segurança | Legítimo interesse | 90 dias | Não |
| **API Call Logs** | PII (indiretamente) | Monitoramento, debugging | Legítimo interesse | 90 dias | Não |

---

## 🔄 **Ciclo de Vida dos Dados (Data Lifecycle)**

### Fase 1: Coleta

**Origem dos Dados:**
```
Coleta Direta (Usuário):
├── Formulário de cadastro (dashboard.{{COMPANY_DOMAIN}})
├── Onboarding KYC (upload de documentos)
└── Configurações de conta (preferências)

Coleta Indireta (Terceiros):
├── (Cliente Enterprise - {{CUSTOMER_NAME}}) (consulta de crédito) - com consentimento
├── Registradoras (TAG, CERC, B3) - dados de recebíveis
└── Auth0 (dados de autenticação OAuth)

Coleta Automática (Sistema):
├── Logs de acesso (CloudWatch)
├── Eventos de transação (APIs)
└── Métricas de uso (analytics)
```

**Métodos de Coleta:**
- Formulários web (HTTPS, encrypted)
- APIs REST (OAuth2 + JWT)
- Webhooks (registradoras, Stripe)
- Logs automatizados (CloudWatch)

**Validação na Coleta:**
-  CPF: Validação de formato + dígitos verificadores
-  Email: Validação de formato + confirmação (double opt-in)
-  Telefone: Validação de formato + SMS verification
-  Idade: Maior de 18 anos (validação via data de nascimento)

---

### Fase 2: Processamento

**Tipos de Processamento:**

**1. Análise de Crédito (Automated)**
```
Input: CPF + dados cadastrais + histórico financeiro
↓
Consulta APIs:
├── (Cliente Enterprise - {{CUSTOMER_NAME}}) (score de crédito)
├── Registradoras (recebíveis disponíveis)
└── Internal DB (histórico {{COMPANY_NAME}})
↓
Modelo de Scoring (algoritmo proprietário):
├── Credit score externo: 30%
├── Histórico de pagamentos: 40%
├── Valor de recebíveis: 20%
├── Outros fatores: 10%
↓
Output: Limite de crédito aprovado + taxa de juros
```

**2. Processamento de Transações**
```
Input: Solicitação de antecipação
↓
Validações:
├── KYC completo?
├── Limite disponível?
├── Recebíveis válidos?
└── Dados bancários válidos?
↓
Execução:
├── Registro na registradora
├── Transferência via Stripe
├── Atualização de saldo
└── Geração de comprovante
↓
Output: Transação concluída + notificação
```

**3. Analytics (Aggregated)**
- Dashboards de métricas (anonimizados)
- Relatórios de negócio (sem PII)
- Performance de plataforma

---

### Fase 3: Armazenamento

**Infraestrutura:**
```
AWS Cloud (Segregado por Ambiente):
├── Production (us-east-1 primary)
│   ├── PostgreSQL RDS (encrypted AES-256)
│   ├── Redis ElastiCache (encrypted)
│   └── S3 Buckets (encrypted SSE-S3)
├── DR Standby (us-west-2)
│   └── RDS Read Replica (encrypted)
└── Staging/Dev (us-east-1)
    └── Test data (masked, no real PII)
```

**Encryption:**
- **At Rest:** AES-256 (RDS, S3, EBS)
- **In Transit:** TLS 1.3 (APIs, database connections)
- **Key Management:** AWS KMS (automatic rotation)

**Segregação:**
- Cada cliente tem tenant_id único
- Queries sempre filtradas por tenant_id (multi-tenancy)
- Nenhum compartilhamento cross-tenant

**Backup:**
- RDS Automated Backups: Diário (retention 30 dias)
- Transaction Logs: Contínuo (PITR 5 minutos)
- S3 Versioning: Enabled (90 dias)
- Cross-Region Replication: us-east-1 → us-west-2

---

### Fase 4: Compartilhamento

**Terceiros que Recebem Dados:**

| Terceiro | Dados Compartilhados | Finalidade | Base Legal | DPA Assinado? | Localização |
|----------|---------------------|------------|------------|---------------|-------------|
| **TAG (Registradora)** | Nome, CPF, recebíveis | Registro de operações | Obrigação legal | ✅ Sim | Brasil |
| **NÚCLEA/CIP (Registradora)** | Nome, CPF, recebíveis | Registro de operações | Obrigação legal | ✅ Sim | Brasil |
| **CERC (Registradora)** | Nome, CPF, recebíveis | Registro de operações | Obrigação legal | ✅ Sim | Brasil |
| **B3 (Registradora)** | Nome, CPF, recebíveis | Registro de operações | Obrigação legal | ✅ Sim | Brasil |
| **Stripe (Payment)** | Dados bancários (tokenizados) | Processamento de pagamentos | Execução de contrato | ✅ Sim | EUA (adequado) |
| **(Cliente Enterprise - {{CUSTOMER_NAME}})** | CPF (consulta apenas) | Análise de crédito | Consentimento | ✅ Sim | Brasil |
| **Auth0** | Email, OAuth tokens | Autenticação SSO | Execução de contrato | ✅ Sim | EUA (adequado) |
| **AWS** | Todos (hospedagem) | Infraestrutura | Execução de contrato | ✅ MSA | EUA |

**Controles de Compartilhamento:**
-  Contratos/DPAs assinados com todos terceiros
-  Princípio da minimização (apenas dados necessários)
-  Encryption em trânsito (TLS 1.3)
-  Audit logs de todas transferências
-  Revisão anual de third-parties

---

### Fase 5: Transferência Internacional

**Transferências para EUA:**

**AWS Cloud (us-east-1 e us-west-2):**
- **Adequação:** AWS possui cláusulas contratuais padrão (SCCs) aprovadas pela UE
- **Localização:** N. Virginia (us-east-1) e Ohio (us-west-2)
- **Garantias:** Encryption at rest + in transit, acesso restrito
- **Alternativa:** Em roadmap migração para AWS São Paulo (sa-east-1) em 2026

**Stripe (Payment Gateway):**
- **Adequação:** Stripe possui certificação PCI DSS Level 1 + SCCs
- **Tokenization:** Card data nunca armazenado, apenas tokens
- **Localização:** Processamento nos EUA, mas dados tokenizados

**Auth0 (SSO):**
- **Adequação:** Auth0 possui SCCs + certificações (SOC 2, ISO 27001)
- **Localização:** Processamento nos EUA (data residency configurável)
- **Minimização:** Apenas email e OAuth tokens, sem dados financeiros

**Disclosure ao Titular:**
-  Política de Privacidade informa transferência internacional
-  Consentimento explícito no cadastro
-  Opção de opt-out (não usar serviço)

---

### Fase 6: Retenção e Descarte

**Políticas de Retenção:**

| Tipo de Dado | Retenção Ativo | Retenção Pós-Inativo | Justificativa | Método de Descarte |
|--------------|----------------|----------------------|---------------|--------------------|
| **Dados Cadastrais** | While active | 5 anos | Obrigação legal (prazo prescricional) | Anonymization |
| **CPF** | While active | 7 anos | BACEN (operações financeiras) | Anonymization |
| **Transações Financeiras** | N/A | 7 anos | BACEN requirement | Encrypted deletion |
| **Dados Bancários** | While active | 2 anos | Necessidade operacional | Encrypted deletion |
| **Logs de Acesso** | 90 dias | N/A | Auditoria | Lifecycle policy (S3) |
| **Backups** | 30 dias | N/A | Recovery capability | Encrypted deletion |

**Definição de "Inativo":**
- Usuário sem login por 24 meses consecutivos
- Ou solicitação explícita de exclusão de conta

**Processo de Descarte:**
```
Identificação (automated monthly job):
├── Query: users inactive > 24 months
├── Notification email: "Sua conta será excluída em 30 dias"
└── Grace period: 30 dias (reativação possível)
     ↓
Anonymization (após grace period):
├── Nome → "User_[hash]"
├── Email → "deleted_[hash]@{{COMPANY_DOMAIN}}.local"
├── CPF → "000.000.000-00"
├── Telefone → NULL
└── Endereço → NULL
     ↓
Preservation (compliance):
├── Transações financeiras mantidas (sem PII, apenas IDs)
├── Metadados agregados (analytics, sem identificação)
└── Logs de auditoria (hashes apenas)
```

**Evidências de Descarte:**
- Logs de anonymization jobs (CloudWatch)
- Audit trail (quem aprovou, quando)
- Compliance reports (trimestral, revisão CISO)

---

## 🔐 **Controles de Acesso aos Dados**

### Quem Acessa Dados Pessoais?

| Role | PII Cadastrais | Dados Financeiros | Logs | Justificativa |
|------|---------------|-------------------|------|---------------|
| **End User** | ✅ Próprios dados | ✅ Próprias transações | ❌ | Proprietário dos dados |
| **Support Agent** | ✅ Limited (read-only) | ✅ Read-only (contexto atendimento) | ❌ | Suporte ao cliente |
| **Admin** | ✅ Full (com justificativa) | ✅ Full (com justificativa) | ✅ Full | Gestão da plataforma |
| **Developer** | ❌ Staging only (masked) | ❌ Staging only (masked) | ✅ Anonymized | Desenvolvimento |
| **DBA** | ⚠️ Database access (logged) | ⚠️ Database access (logged) | ✅ Full | Manutenção DB |
| **Auditor** | ✅ Read-only (audit) | ✅ Read-only (audit) | ✅ Full | Compliance audit |

**Princípio:** Least Privilege + Need-to-Know

**Audit:**
- Todos acessos a PII são logados (CloudTrail, application logs)
- Revisão trimestral de acessos (CISO + DPO)
- Alerts automáticos para acessos anômalos (ex: bulk export)

---

## 📋 **Direitos dos Titulares (LGPD)**

### Processos Implementados

**1. Acesso (Art. 18, I)**
- **Canal:** Email {{CONTACT_EMAIL}} ou Dashboard
- **Prazo:** 15 dias (LGPD permite até 15 dias)
- **Formato:** PDF exportável (dados estruturados)
- **Histórico 2025:** 2 solicitações atendidas (100% no prazo)

**2. Correção (Art. 18, III)**
- **Canal:** Dashboard (self-service)
- **Prazo:** Imediato (atualização online)
- **Validação:** Re-verificação se dados críticos (CPF, dados bancários)

**3. Portabilidade (Art. 18, V)**
- **Canal:** Email {{CONTACT_EMAIL}}
- **Prazo:** 15 dias
- **Formato:** JSON ou CSV (interoperável)

**4. Exclusão (Art. 18, VI)**
- **Canal:** Email {{CONTACT_EMAIL}} ou Dashboard
- **Prazo:** 30 dias (com confirmação)
- **Exceções:** Dados sujeitos a retenção legal (7 anos BACEN)
- **Processo:** Anonymization (não deletion física)
- **Histórico 2025:** 3 solicitações atendidas (100% no prazo)

**5. Revogação de Consentimento (Art. 18, IX)**
- **Canal:** Dashboard (toggle)
- **Efeito:** Interrupção de processos baseados em consentimento (ex: marketing)
- **Não afeta:** Dados necessários para execução de contrato

**6. Oposição (Art. 18, § 2º)**
- **Canal:** Email {{CONTACT_EMAIL}}
- **Análise:** DPO avalia se base legal permite oposição
- **Resposta:** 15 dias com justificativa

---

## 📊 **Métricas de Governança de Dados**

### KPIs (2025)

| Métrica | Target | Atual | Status |
|---------|--------|-------|--------|
| **Data Subject Requests** | 100% < 30 dias | 100% < 15 dias | ✅ |
| **Data Breaches** | 0 | 0 | ✅ |
| **LGPD Training Completion** | 100% | 98% | ⚠️ |
| **Third-Party DPAs Signed** | 100% | 100% | ✅ |
| **Access Reviews** | Trimestral | 100% compliance | ✅ |
| **Data Mapping Updates** | Semestral | On track | ✅ |

---

## 🔗 **Cross-References**

- [Privacy Policy](./privacy-policy.md) - Política pública
- [Information Security Policy](../security/information-security-policy.md) - Controles de segurança
- [AI Governance Policy](../ai-governance/ai-governance-policy.md) - Tratamento de dados na IA

---

## ✅ **Aprovação e Assinaturas**

**Aprovado por:**

---

**[Nome do CEO]**  
CEO - {{COMPANY_NAME}}  
Data: 03 de Outubro de 2025

---

**[Nome do DPO]**  
Data Protection Officer - {{COMPANY_NAME}}  
Data: 03 de Outubro de 2025

---

**[Nome do CISO]**  
CISO - {{COMPANY_NAME}}  
Data: 03 de Outubro de 2025

---

**🔐 Classificação:** CONFIDENTIAL - INTERNAL USE ONLY  
**📂 Retenção:** 7 anos  
**🔄 Última Atualização:** 2025-10-03  
**✅ Status:** Aprovado e Vigente  
**📅 Próxima Revisão:** 2026-04-03 (semestral)

