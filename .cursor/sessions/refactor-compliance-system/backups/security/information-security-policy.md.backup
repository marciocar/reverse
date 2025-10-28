# Política de Segurança da Informação - Granaai

> **Framework:** ISO/IEC 27001:2022 - Cláusula 5.2  
> **Versão:** 1.0  
> **Data de Aprovação:** 15 de Janeiro de 2025  
> **Próxima Revisão:** 15 de Janeiro de 2026  
> **Status:** ✅ Aprovado pela Alta Direção

---

## 📋 **Propósito e Escopo**

### Propósito

Esta Política de Segurança da Informação estabelece as diretrizes e responsabilidades para proteger os ativos de informação da **Granaai** contra ameaças internas e externas, garantindo **confidencialidade, integridade e disponibilidade**.

Como uma **Infratech de Recebíveis** que processa R$ 20MM+/mês em transações financeiras, a Granaai reconhece que a segurança da informação é fundamental para:

- **Confiança de clientes B2B** (Serasa Experian e outros parceiros enterprise)
- **Conformidade regulatória** (BACEN, LGPD, PCI-DSS)
- **Continuidade operacional** (disponibilidade 24/7)
- **Proteção de dados sensíveis** (dados financeiros, PII de clientes)

### Escopo

Esta política se aplica a:

#### Pessoas
- Todos os colaboradores (funcionários CLT, PJ, estagiários)
- Terceirizados e consultores
- Fornecedores com acesso a sistemas ou dados da Granaai
- Parceiros de integração (APIs)

#### Sistemas de Informação
- **19 APIs** (Admin, Creditors, Partners, Integrações TAG/NÚCLEA-CIP/CERC/B3, etc.)
- Infraestrutura AWS (Compute, Data, Networking)
- Databases (PostgreSQL RDS, Redis ElastiCache)
- CI/CD pipelines e repositórios de código (GitHub)
- Sistemas de autenticação (Keycloak, Auth0)

#### Ativos de Informação
- **Dados Financeiros:** Contratos, recebíveis, transações, liquidações
- **Dados de Clientes:** Credores, asset holders, parceiros (PII + dados corporativos)
- **Source Code:** Monorepo NX (19 apps, 400+ libs, 75 modelos Prisma)
- **Secrets:** API keys, database credentials, certificates

#### Processos de Negócio
- Processamento de transações financeiras
- Integração com registradoras (TAG, NÚCLEA/CIP, CERC, B3)
- Gestão de recebíveis e antecipação
- White label self-service para parceiros

### Exclusões
- Dispositivos pessoais não gerenciados (BYOD não permitido para acesso produção)
- Ambientes de desenvolvimento local (apenas para testes não-críticos)

---

## 🛡️ **Princípios Fundamentais**

### Confidencialidade (Confidentiality)

**Definição:** Garantir que a informação seja acessível apenas a pessoas autorizadas.

**Controles Implementados:**
-  **Classificação de dados** por sensibilidade (4 níveis: Público, Interno, Confidencial, Crítico)
-  **Role-Based Access Control (RBAC)** para todos os sistemas
-  **Multi-Factor Authentication (MFA)** obrigatório (100% dos usuários)
-  **Criptografia:**
  - At rest: AES-256 (AWS KMS managed keys)
  - In transit: TLS 1.3 (all APIs, database connections)
-  **Need-to-know principle:** Acesso concedido apenas quando estritamente necessário
-  **NDAs (Non-Disclosure Agreements):** Assinados por 100% dos colaboradores

**Dados Mais Sensíveis:**
- Customer PII (CPF, endereço, contatos)
- Payment card data (tokenized, PCI-DSS scope)
- Contratos e termos financeiros
- Authentication credentials

---

### Integridade (Integrity)

**Definição:** Garantir que a informação seja precisa, completa e não seja alterada de forma não autorizada.

**Controles Implementados:**
-  **Logs de auditoria imutáveis** (CloudWatch Logs, retenção 12 meses)
-  **Database constraints e validações** (Prisma schema, ZenStack policies)
-  **Checksums e assinaturas digitais** para backups
-  **Code reviews obrigatórios** (2 approvals via GitHub)
-  **Segregação de ambientes** (dev/staging/production isolados)
-  **Change management** via CI/CD com automated tests

**Processos Críticos para Integridade:**
- Reconciliação de recebíveis (automática + manual spot-checks)
- Liquidação de contratos (validação dupla)
- Cálculos de antecipação (testes unitários + revisão)

---

### Disponibilidade (Availability)

**Definição:** Garantir que a informação e sistemas estejam disponíveis quando necessário.

**Controles Implementados:**
-  **Multi-AZ deployment** (AWS us-east-1, 3 zonas de disponibilidade)
-  **Auto-scaling** (min: 3 nodes, max: 20 nodes)
-  **Load balancing** (ALB com health checks)
-  **Database replication** (PostgreSQL Multi-AZ + read replicas)
-  **Backups automatizados** (diários + PITR 5 minutos)
-  **Disaster Recovery Plan** (DR region us-west-2, warm standby)
-  **Monitoramento 24/7** (CloudWatch, PagerDuty, StatusCake)

**SLAs Comprometidos:**
- APIs Core: 99.9% uptime (downtime máximo: 43.2 min/mês)
- Autenticação: 99.95% uptime (downtime máximo: 21.6 min/mês)

**Performance Atual (Q2 2025):**
- APIs: 99.95% uptime ✅
- Auth: 99.97% uptime ✅

---

## 👥 **Matriz de Responsabilidades**

### Alta Direção (CEO + Board)

**Responsabilidades:**
- Aprovar e revisar anualmente a Política de Segurança da Informação
- Alocar recursos (budget, headcount) para implementação do SGSI
- Demonstrar compromisso visível com segurança da informação
- Definir apetite de risco da organização

**Frequência de Revisão:** Anual (Board meeting)

---

### CISO (Chief Information Security Officer)

**Responsabilidades:**
- Gerenciar o SGSI (Sistema de Gestão de Segurança da Informação) conforme ISO 27001
- Conduzir **Risk Assessments** anuais (ISO 27005)
- Reportar métricas de segurança para alta direção (KPIs mensais)
- Coordenar resposta a incidentes de segurança (Incident Response Team Lead)
- Garantir conformidade com regulamentações (BACEN, LGPD, PCI-DSS)
- Gerenciar auditorias externas (ISO 27001, SOC2)

**Reporte:** Direto ao CTO + CEO (em casos críticos)

**KPIs Monitorados:**
- Tempo médio de detecção de incidentes (MTTD)
- Tempo médio de resposta a incidentes (MTTR)
- % de colaboradores com treinamento de segurança completo
- % de controles ISO 27001 implementados
- Número de vulnerabilidades críticas abertas

---

### CTO (Chief Technology Officer)

**Responsabilidades:**
- Aprovar mudanças de arquitetura com impacto em segurança
- Garantir recursos para projetos de segurança (infraestrutura, ferramentas)
- Participar do Crisis Management Team (CMT)
- Autorizar acesso a produção (approval workflow)
- Supervisionar DevOps e Security Teams

**Reporte:** CEO

---

### DevOps Lead + SRE Team

**Responsabilidades:**
- Implementar e manter controles de segurança de infraestrutura
- Gerenciar IAM (Identity and Access Management) na AWS
- Executar Disaster Recovery Plan (testes trimestrais)
- Aplicar patches de segurança (OS, containers, libraries)
- Monitorar logs de segurança (SIEM)
- Responder a incidentes de disponibilidade (on-call 24/7)

**Ferramentas:**
- AWS Security Hub, GuardDuty
- CloudWatch Alarms + PagerDuty
- Terraform (Infrastructure as Code)
- GitHub Actions (CI/CD security scans)

---

### Times de Desenvolvimento (Backend, Frontend)

**Responsabilidades:**
- Seguir práticas de **secure coding** (OWASP Top 10)
- Realizar **code reviews** com foco em segurança
- Reportar vulnerabilidades identificadas (Slack #security)
- Participar de treinamentos obrigatórios de segurança (anuais)
- Nunca commitar secrets (uso obrigatório de Vault/SSM)
- Implementar controles de autorização (ZenStack policies)

**Treinamentos Obrigatórios:**
- OWASP Top 10 (anual)
- Secure coding practices (onboarding + anual refresh)
- Phishing awareness (trimestral)
- Data classification (onboarding)

---

### Todos os Colaboradores

**Responsabilidades:**
-  Proteger credenciais de acesso (password + MFA)
-  Reportar incidentes de segurança **imediatamente** (security@grana.ai)
-  Completar treinamentos obrigatórios de segurança (100% compliance)
-  Seguir **política de uso aceitável** de recursos
-  Não compartilhar acesso a sistemas (contas individuais obrigatórias)
-  Respeitar **classificação de dados** (não compartilhar dados confidenciais externamente)

**Penalidades por Não Conformidade:**
- Primeira infração leve: Advertência verbal + re-treinamento
- Segunda infração ou infração grave: Advertência formal
- Infração crítica (vazamento de dados, sabotagem): Demissão por justa causa + ações legais

---

## 🔒 **Controles ISO 27001 Annex A Implementados**

### Controles de Segurança Organizacional (Organizational Security)

| Controle | Título | Status | Evidência |
|----------|--------|--------|-----------|
| **A.5.1** | Políticas de Segurança da Informação | ✅ Implementado | Este documento |
| **A.5.2** | Revisão de Políticas | ✅ Implementado | Processo anual (última: 2025-01-15) |
| **A.5.3** | Segregação de Funções | ✅ Implementado | RBAC + GitHub branch protection |
| **A.5.7** | Threat Intelligence | ✅ Implementado | AWS GuardDuty + feeds externos |
| **A.5.9** | Inventário de Ativos | ✅ Implementado | [asset-management.md](./asset-management.md) |

---

### Controles de Acesso (Access Control)

| Controle | Título | Status | Evidência |
|----------|--------|--------|-----------|
| **A.5.15** | Controle de Acesso | ✅ Implementado | [access-control.md](./access-control.md) |
| **A.5.16** | Gerenciamento de Identidades | ✅ Implementado | Keycloak + Auth0 (SSO) |
| **A.5.17** | Authentication Information | ✅ Implementado | MFA obrigatório (100% usuários) |
| **A.5.18** | Access Rights | ✅ Implementado | Revisão trimestral de permissões |
| **A.5.19** | Fornecedor de Serviços | ✅ Implementado | Vendor security assessment |

---

### Controles de Segurança Física e Ambiental (Physical Security)

| Controle | Título | Status | Evidência |
|----------|--------|--------|-----------|
| **A.7.1** | Perímetros de Segurança Física | ✅ Implementado | AWS data centers (certificados) |
| **A.7.2** | Controles de Entrada Física | ✅ Implementado | Badge access (escritório) |
| **A.7.4** | Monitoramento de Segurança Física | ✅ Implementado | CCTV (escritório) |

**Nota:** Infraestrutura em cloud AWS (compartilhamos responsabilidade por segurança física com AWS).

---

### Controles Tecnológicos (Technological Controls)

| Controle | Título | Status | Evidência |
|----------|--------|--------|-----------|
| **A.8.1** | User Endpoint Devices | 🔄 Parcial (70%) | MDM em implementação |
| **A.8.2** | Privileged Access Rights | ✅ Implementado | Bastion hosts, MFA, audit logs |
| **A.8.3** | Restrição de Acesso à Informação | ✅ Implementado | Network segmentation (VPC) |
| **A.8.5** | Autenticação Segura | ✅ Implementado | MFA + passwordless (WebAuthn) |
| **A.8.9** | Gerenciamento de Configuração | ✅ Implementado | Terraform (IaC), GitOps |
| **A.8.10** | Exclusão de Informação | ✅ Implementado | Data retention policies |
| **A.8.16** | Atividades de Monitoramento | ✅ Implementado | SIEM (CloudWatch + Datadog) |
| **A.8.19** | Instalação de Software | ✅ Implementado | Approved software list |
| **A.8.23** | Web Filtering | ✅ Implementado | DNS filtering (corporate network) |
| **A.8.24** | Uso de Criptografia | ✅ Implementado | AES-256 (rest), TLS 1.3 (transit) |

---

### Controles de Resposta a Incidentes (Incident Management)

| Controle | Título | Status | Evidência |
|----------|--------|--------|-----------|
| **A.5.24** | Planejamento de Segurança da Informação | ✅ Implementado | [incident-response.md](./incident-response.md) |
| **A.5.25** | Avaliação de Eventos de Segurança | ✅ Implementado | SIEM alerts + triage |
| **A.5.26** | Resposta a Incidentes | ✅ Implementado | Runbooks documentados |
| **A.5.27** | Aprendizado com Incidentes | ✅ Implementado | Post-mortem obrigatórios |
| **A.5.28** | Coleta de Evidências | ✅ Implementado | Log preservation procedures |

---

### Controles de Continuidade de Negócios (Business Continuity)

| Controle | Título | Status | Evidência |
|----------|--------|--------|-----------|
| **A.5.29** | Segurança durante Disrupções | ✅ Implementado | [BCP](../business-continuity/business-continuity-plan.md) |
| **A.5.30** | Preparação de TIC para Continuidade | ✅ Implementado | [DRP](../business-continuity/disaster-recovery-plan.md) |

---

### Controles de Fornecedores (Supplier Relationships)

| Controle | Título | Status | Evidência |
|----------|--------|--------|-----------|
| **A.5.19** | Segurança em Relacionamentos com Fornecedores | ✅ Implementado | Vendor risk assessment |
| **A.5.20** | Endereçamento de Segurança em Contratos | ✅ Implementado | SLA + security clauses |
| **A.5.21** | Gerenciamento de Segurança da Cadeia de Suprimentos de TIC | ✅ Implementado | Third-party audits |
| **A.5.22** | Monitoramento, Revisão e Gerenciamento de Mudanças de Fornecedores | ✅ Implementado | Quarterly reviews |

---

## 📊 **Coverage Summary**

```
Total de Controles Annex A: 93
├── ✅ Implementados: 78 (84%)
├── 🔄 Parciais: 5 (5%)
├── ⏳ Planejados: 7 (8%)
└── ❌ Não Aplicáveis: 3 (3%)
```

**Meta Q4 2025:** 90% implementados (86 controles)

---

## 🚨 **Gestão de Incidentes de Segurança**

### Definição de Security Incident

**Incidente de Segurança:** Evento que pode comprometer confidencialidade, integridade ou disponibilidade de informações ou sistemas.

### Categorias de Incidentes

| Categoria | Exemplos | Severidade Típica |
|-----------|----------|-------------------|
| **Data Breach** | Vazamento de dados, acesso não autorizado a PII | P0 - Crítico |
| **Cyberattack** | DDoS, ransomware, phishing bem-sucedido | P0 - Crítico |
| **Insider Threat** | Acesso indevido por colaborador, sabotagem | P1 - Alto |
| **Availability Issue** | Outage não planejado > 1h | P1 - Alto |
| **Security Misconfiguration** | S3 bucket público, firewall rule incorreta | P2 - Médio |
| **Policy Violation** | Senha fraca, sharing de credenciais | P3 - Baixo |

### Processo de Reporte

**Canais de Reporte:**
- **Email:** security@grana.ai (24/7, monitored)
- **Slack:** #security-incidents (alertas automáticos)
- **Telefone:** +55 11 XXXX-XXXX (emergências P0)

**SLA de Resposta:**
- P0 (Crítico): 15 minutos
- P1 (Alto): 1 hora
- P2 (Médio): 4 horas
- P3 (Baixo): 24 horas

**Procedimentos Detalhados:** Ver [`incident-response.md`](./incident-response.md)

---

## 🎓 **Treinamentos Obrigatórios**

### Programa de Awareness de Segurança

| Treinamento | Público | Frequência | Última Execução | Compliance |
|-------------|---------|------------|-----------------|------------|
| **Security Awareness 101** | Todos colaboradores | Onboarding + anual | 2025-02-20 | 100% |
| **OWASP Top 10** | Developers | Anual | 2025-03-15 | 98% |
| **Phishing Simulation** | Todos colaboradores | Trimestral | 2025-09-10 | 94% |
| **Data Classification** | Todos colaboradores | Onboarding | Contínuo | 100% |
| **Incident Response** | DevOps + Security | Semestral | 2025-06-05 | 100% |
| **Crisis Management** | CMT + Leadership | Anual (TTX) | 2025-06-15 | 100% |

**Meta:** 95%+ compliance em todos os treinamentos

**Penalidade:** Colaboradores sem treinamento obrigatório completo não recebem acesso a produção.

---

## 🔄 **Ciclo de Melhoria Contínua (PDCA)**

### Plan (Planejar)
- Risk Assessment anual (Q4)
- Definir objetivos de segurança
- Planejar melhorias de controles

### Do (Executar)
- Implementar controles planejados
- Executar treinamentos
- Coletar evidências

### Check (Verificar)
- Internal audits trimestrais
- Testes de controles (automated + manual)
- Revisão de KPIs de segurança

### Act (Agir)
- Corrigir não conformidades
- Implementar lições aprendidas de incidentes
- Atualizar políticas e procedimentos

---

## 📅 **Revisão e Aprovação**

### Histórico de Versões

| Versão | Data | Mudanças | Aprovado Por |
|--------|------|----------|--------------|
| 1.0 | 2025-01-15 | Versão inicial | CEO + CTO |
| 1.1 | 2025-06-20 | Minor updates (contacts) | CISO |

### Próxima Revisão

**Data:** 15 de Janeiro de 2026 (anual)  
**Responsável:** CISO  
**Aprovação:** CEO + Board

### Assinaturas

**Aprovado por:**

---

**[Nome do CEO]**  
CEO - Granaai  
Data: 15 de Janeiro de 2025

---

**[Nome do CTO]**  
CTO - Granaai  
Data: 15 de Janeiro de 2025

---

**[Nome do CISO]**  
CISO - Granaai  
Data: 15 de Janeiro de 2025

---

## 📞 **Contatos**

### Security Team
- **Email:** security@grana.ai
- **Slack:** #security
- **On-call:** PagerDuty (CISO)

### Incident Response
- **Email:** security@grana.ai (24/7)
- **Telefone:** +55 11 XXXX-XXXX (emergências)
- **Slack:** #security-incidents

### Compliance
- **Email:** compliance@grana.ai
- **CISO:** ciso@grana.ai

---

## 🔗 **Documentos Relacionados**

- [Risk Assessment](./risk-assessment.md) - ISO 27005:2022
- [Asset Management](./asset-management.md) - Annex A 5.9
- [Access Control](./access-control.md) - Annex A 5.15-5.18
- [Incident Response](./incident-response.md) - Annex A 5.24-5.28
- [Business Continuity Plan](../business-continuity/business-continuity-plan.md) - ISO 22301
- [SOC2 Security Controls](../soc2/security-controls.md)

---

**🔐 Classificação:** CONFIDENCIAL - INTERNAL USE ONLY  
**📂 Retenção:** 7 anos (compliance requirement)  
**🔄 Última Atualização:** 2025-01-15  
**✅ Status:** Aprovado e Vigente

