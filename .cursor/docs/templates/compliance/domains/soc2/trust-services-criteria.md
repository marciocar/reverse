# SOC 2 Trust Services Criteria (TSC) - {{COMPANY_NAME}}

> **Framework:** SOC 2 Type II - AICPA Trust Services Criteria  
> **Versão:** 1.0  
> **Data de Aprovação:** 01 de Março de 2025  
> **Próxima Revisão:** 01 de Março de 2026 (anual)  
> **Status:** ✅ Aprovado pela Alta Direção

> ✅ **Responde:** Due Diligence de Cliente Enterprise Requisito #7 - "Certificado ISO 27001 / SOC2"

---

## 📋 **Executive Summary**

Este documento fornece uma visão abrangente da implementação dos **SOC 2 Trust Services Criteria (TSC)** pela {{COMPANY_NAME}}, demonstrando conformidade com os cinco princípios fundamentais de controles de serviço:

-  **Security (Segurança)** - Proteger sistema contra acesso não autorizado
-  **Availability (Disponibilidade)** - Manter sistema disponível conforme acordado
-  **Processing Integrity (Integridade)** - Processar dados completos, válidos, precisos e autorizados
-  **Confidentiality (Confidencialidade)** - Proteger dados confidenciais
-  **Privacy (Privacidade)** - Coletar, usar, reter e divulgar dados pessoais conforme política

**Status de Certificação:**
- 🔄 **SOC 2 Type II:** Em preparação (previsão: Q2 2026)
-  **Documentação:** 100% completa
-  **Controles:** 95% implementados
-  **Evidências:** 6 meses coletadas (meta: 12 meses para audit)

---

## 🎯 **O que é SOC 2?**

### Definição

**SOC 2 (Service Organization Control 2)** é um framework de auditoria desenvolvido pelo **AICPA (American Institute of CPAs)** para avaliar controles de segurança, disponibilidade e processamento de dados em organizações de serviços.

### Tipos de Relatórios SOC 2

| Tipo | Nome | Foco | Duração | Uso |
|------|------|------|---------|-----|
| **Type I** | Point-in-Time | Design dos controles | Snapshot (1 dia) | Validação inicial, MVP |
| **Type II** | Operating Effectiveness | Controles em operação | 6-12 meses | Clientes enterprise, RFPs |

**{{COMPANY_NAME}} Target:** SOC 2 Type II (mais rigoroso, preferido por enterprise)

---

### Por que SOC 2?

**Business Drivers:**
-  **Clientes Enterprise:** (Cliente Enterprise - {{CUSTOMER_NAME}}) e outros exigem SOC 2 Type II em RFPs
-  **Confiança de Mercado:** Demonstra maturidade de controles
-  **Compliance Streamlined:** Alinha com ISO 27001 (overlap de ~70%)
-  **Sales Enablement:** Reduz due diligence time de meses para semanas
-  **Vantagem Competitiva:** Poucos fintechs brasileiros têm SOC 2 Type II

---

## 🛡️ **Trust Services Criteria (TSC)**

### Visão Geral dos 5 Princípios

```
Security (Base - Obrigatório)
├── Fundação para todos os outros princípios
├── Controles de acesso, autenticação, autorização
├── Monitoramento de segurança, incident response
└── Risk assessment, vulnerability management

Availability (Adicional - Opcional)
├── Uptime, SLAs, monitoramento
├── Disaster recovery, business continuity
└── Capacity planning, performance

Processing Integrity (Adicional - Opcional)
├── Data validation, accuracy, completeness
├── Error handling, transaction integrity
└── Quality controls, audit trails

Confidentiality (Adicional - Opcional)
├── Proteção de dados sensíveis (além de pessoais)
├── Encryption at rest, in transit
├── Data classification, access controls
└── Secure disposal, data lifecycle

Privacy (Adicional - Opcional)
├── Coleta, uso, retenção de dados pessoais
├── Consent management, direitos dos titulares
├── LGPD compliance, privacy by design
└── Data subject requests (DSR)
```

**{{COMPANY_NAME}} Scope:** Security + Availability + Confidentiality (3 princípios)

**Justificativa:**
- Security: Obrigatório (base de tudo)
- Availability: Cliente (Cliente Enterprise - {{CUSTOMER_NAME}}) exige SLAs rigorosos
- Confidentiality: Lidamos com dados financeiros sensíveis
- ❌ Processing Integrity: Não aplicável (não fazemos reconciliação financeira complexa)
- ❌ Privacy: Coberto por LGPD compliance separado (overlap de 90%)

---

## 🔐 **TSC Security (C1 - Common Criteria)**

### C1.1: Security Policies

**Controle:** A entidade define e documenta políticas de segurança.

**Implementação {{COMPANY_NAME}}:**

✅ **Políticas Formais Aprovadas:**
- [Information Security Policy](../security/information-security-policy.md)
- [Acceptable Use Policy](../security/acceptable-use-policy.md)
- [Incident Response Plan](../security/incident-response.md)
- [Risk Assessment Methodology](../security/risk-assessment.md)

**Aprovação:** CTO + CISO + CEO (01 de Março de 2025)  
**Revisão:** Anual (próxima: 01 de Março de 2026)  
**Distribuição:** Todos colaboradores (onboarding + refresh anual)

**Evidências:**
- Política documents (PDF assinados digitalmente)
- Email de distribuição (todos colaboradores)
- Acknowledgement tracking (HR system)

---

### C1.2: Risk Assessment

**Controle:** A entidade identifica, analisa e responde a riscos de segurança.

**Implementação {{COMPANY_NAME}}:**

✅ **Risk Assessment Anual:**
- Última execução: Janeiro 2025
- Metodologia: ISO 27005 (qualitativo + quantitativo)
- Scope: Infraestrutura, aplicações, processos, pessoas
- Output: Risk register (35 riscos identificados, 28 mitigados, 7 accepted)

**Risk Categories:**
- Cyberattacks (DDoS, ransomware, phishing)
- Insider threats (malicious, negligent)
- Third-party risks (AWS, Auth0, Stripe)
- Compliance risks (LGPD, BACEN regulations)
- Operational risks (downtime, data loss)

**Risk Treatment:**
- Mitigate: 80% (controles implementados)
- Accept: 17% (riscos baixos, custo > benefício)
- Transfer: 3% (cyber insurance)
- Avoid: 0%

**Evidências:**
- Risk assessment report (PDF, 42 páginas)
- Risk register (Excel/spreadsheet)
- Meeting minutes (risk committee)
- Mitigation action items tracker (Jira)

---

### C1.3: Security Awareness Training

**Controle:** A entidade treina pessoal em práticas de segurança.

**Implementação {{COMPANY_NAME}}:**

✅ **Training Program:**
- **Onboarding:** Security basics (2h, obrigatório)
- **Annual Refresh:** Todos colaboradores (1h, online)
- **Specialized Training:** Developers (secure coding, 4h, anual)
- **Phishing Simulations:** Trimestral (via KnowBe4)

**Completion Rates (2025):**
- Onboarding: 100% (8/8 novos colaboradores)
- Annual refresh: 98% (48/49, 1 pending)
- Developer training: 95% (19/20)
- Phishing simulations: Click rate < 5% (target: < 10%) ✅

**Evidências:**
- LMS (Learning Management System) completion reports
- Phishing simulation dashboards (KnowBe4)
- Attendance sheets (in-person trainings)
- Certificates issued

---

### C1.4: Access Controls

**Controle:** A entidade implementa controles de acesso lógico e físico.

**Implementação {{COMPANY_NAME}}:**

✅ **Logical Access:**
- **SSO (Single Sign-On):** Auth0 para todas aplicações
- **MFA (Multi-Factor Authentication):** Obrigatório para todos usuários (100%)
- **RBAC (Role-Based Access Control):** 6 roles definidos (Admin, Dev, QA, Support, Finance, Read-Only)
- **Least Privilege:** Acesso mínimo necessário (revisão trimestral)
- **Password Policy:** 12+ chars, complexity, 90-day expiration

✅ **Physical Access:**
- **Escritório:** Badge access, logs mantidos 90 dias
- **Data Center:** N/A (AWS cloud-only, sem data center próprio)

✅ **Remote Access:**
- **VPN:** Obrigatório para acesso a recursos internos
- **Device Management:** MDM (Mobile Device Management) para laptops
- **Disk Encryption:** Full disk encryption (FileVault, BitLocker) obrigatório

**Evidências:**
- Auth0 user logs (authentication, authorization events)
- Access reviews (trimestral, spreadsheet com aprovações)
- Badge access logs (físico)
- VPN connection logs

---

### C1.5: System Operations

**Controle:** A entidade monitora e gerencia operações de sistemas.

**Implementação {{COMPANY_NAME}}:**

✅ **Monitoring 24/7:**
- CloudWatch, Grafana, Prometheus (métricas)
- PagerDuty (alerting, on-call)
- Pingdom (synthetic monitoring externo)

✅ **Change Management:**
- GitFlow (feature branches, pull requests)
- Code review obrigatório (2 approvers)
- CI/CD pipelines (automated tests, linting)
- Staging environment (mirror de produção)
- Rollback procedures (automated, < 5min)

✅ **Patch Management:**
- OS patches: Automated (AWS SSM Patch Manager, weekly)
- Application dependencies: Renovate bot (automatic PRs)
- Security patches: Expedited (< 48h para críticos)

**Evidências:**
- CloudWatch dashboards (uptime, metrics)
- PagerDuty incident history
- Git commit history (change tracking)
- Patch compliance reports (AWS Systems Manager)

---

### C1.6: Incident Response

**Controle:** A entidade identifica, responde e recupera de incidentes de segurança.

**Implementação {{COMPANY_NAME}}:**

✅ **Incident Response Plan:**
- [Security Incident Response Plan](../security/incident-response.md)
- Aprovado: CTO + CISO (01 de Março de 2025)

✅ **Incident Types:**
- Cyberattacks (DDoS, ransomware, malware)
- Data breaches (unauthorized access, exfiltration)
- Insider threats (malicious, negligent)
- Availability incidents (downtime > 30min)

✅ **Response Process:**
```
Detection → Containment → Eradication → Recovery → Post-Mortem
├── MTTD: < 15min (target)
├── MTTR: < RTO (varies by service)
└── Post-Mortem: < 5 dias úteis
```

**Evidências:**
- Incident response runbooks
- Incident tickets (Jira, categoria "Security Incident")
- Post-mortem reports (3 incidentes in 2025, todos com post-mortem)
- Tabletop exercises (trimestral)

---

## ⏱️ **TSC Availability (A1)**

### A1.1: Availability Objectives

**Controle:** A entidade define objetivos de disponibilidade baseados em requisitos de negócio.

**Implementação {{COMPANY_NAME}}:**

✅ **SLA:** 99.5% uptime mensal (máximo 3.6h downtime/mês)  
✅ **Alcançado:** 99.95% (Q2 2025) - acima do SLA  
✅ **RTOs:** 30min-4h (dependendo de criticidade)  
✅ **RPOs:** 0-4h (dependendo de tipo de dado)

**Documentação:**
- [Availability Controls](./availability-controls.md)
- [Recovery Objectives (RTOs/RPOs)](../business-continuity/recovery-objectives.md)

---

### A1.2: Monitoring and Capacity

**Controle:** A entidade monitora componentes de sistema e capacidade.

**Implementação {{COMPANY_NAME}}:**

✅ **Monitoramento:**
- CloudWatch (métricas, logs, alertas)
- Grafana (dashboards customizados)
- PagerDuty (on-call, alerting)

✅ **Capacity Planning:**
- Forecast mensal (baseado em growth trends)
- Headroom atual: 55% (capacity para 2.2x spike)
- Auto-scaling (EKS, RDS)

**Evidências:**
- Capacity planning reports (mensal)
- Load test results (mensal)
- Auto-scaling logs (CloudWatch)

---

### A1.3: Incident Response (Availability)

**Controle:** A entidade responde a incidentes de disponibilidade.

**Implementação {{COMPANY_NAME}}:**

✅ **Processes:**
- On-call rotation 24/7
- Runbooks documentados (DR, failover, recovery)
- Crisis Management Team (P0/P1 incidents)

✅ **Performance (Q2 2025):**
- MTTD (Mean Time To Detect): 12min avg
- MTTR (Mean Time To Resolve): 95% dentro de RTO

**Documentação:**
- [Crisis Management Plan](../business-continuity/crisis-management.md)
- [Disaster Recovery Plan](../business-continuity/disaster-recovery-plan.md)

---

## 🔒 **TSC Confidentiality (C2)**

### C2.1: Data Classification

**Controle:** A entidade classifica dados sensíveis.

**Implementação {{COMPANY_NAME}}:**

✅ **Classification Levels:**

| Nível | Definição | Exemplos | Controles |
|-------|-----------|----------|-----------|
| **Public** | Dados públicos | Marketing materials | Nenhum especial |
| **Internal** | Uso interno | Company handbook | Access control |
| **Confidential** | Dados sensíveis | Contratos, financials | Encryption + RBAC |
| **Restricted** | Altamente sensível | PII, payment data | Encryption + RBAC + Audit + DLP |

**Documentação:**
- [Data Classification Policy](../security/data-classification.md)
- [Confidentiality Controls](./confidentiality-controls.md)

---

### C2.2: Encryption

**Controle:** A entidade protege dados confidenciais com encryption.

**Implementação {{COMPANY_NAME}}:**

✅ **Encryption At Rest:**
- RDS (PostgreSQL): AES-256
- S3: SSE-S3 (server-side encryption)
- EBS volumes: AWS KMS encryption
- Backups: Encrypted (AWS Backup)

✅ **Encryption In Transit:**
- TLS 1.3 (HTTPS for all APIs)
- VPN (IPSec) para acesso interno
- Database connections: SSL/TLS

**Evidências:**
- AWS encryption configs (Infrastructure as Code)
- SSL/TLS certificate management (AWS Certificate Manager)
- Encryption audit (AWS Config Rules)

---

### C2.3: Secure Disposal

**Controle:** A entidade descarta dados confidenciais de forma segura.

**Implementação {{COMPANY_NAME}}:**

✅ **Data Retention:**
- Transações: 7 anos (BACEN requirement)
- Logs: 90 dias online, 7 anos Glacier
- Backups: 30 dias (RDS), 90 dias (S3)

✅ **Secure Disposal:**
- S3: Lifecycle policies (automatic deletion after retention)
- RDS: Encrypted snapshots deleted (AWS secure disposal)
- Physical devices: N/A (cloud-only)

**Evidências:**
- Lifecycle policies (S3, documented in IaC)
- Deletion logs (CloudTrail)

---

## 📊 **SOC 2 Readiness Dashboard**

### Maturity Assessment (Por TSC Category)

| Category | Controles | Implemented | Documented | Evidências | Status |
|----------|-----------|-------------|------------|------------|--------|
| **Security (C1)** | 15 | 14 (93%) | 15 (100%) | 12 meses | 🟢 Ready |
| **Availability (A1)** | 8 | 8 (100%) | 8 (100%) | 6 meses | 🟡 Almost Ready |
| **Confidentiality (C2)** | 6 | 6 (100%) | 6 (100%) | 6 meses | 🟡 Almost Ready |

**Overall Readiness:** 93% (28/30 controles implementados)

**Gaps:**
1. ❌ **C1.7 - Third-Party Risk Assessment:** Em andamento (50% vendors assessed)
   - Action: Complete assessments até Dez 2025
   - Owner: CISO

2. ⚠️ **Evidências de Availability:** Apenas 6 meses coletadas (target: 12 meses para Type II)
   - Action: Continuar coletando até Mar 2026
   - Owner: DevOps Lead

---

### Roadmap para Certificação SOC 2 Type II

```
✅ Q1 2025: Documentação completa (policies, procedures)
✅ Q2 2025: Implementação de controles (95% done)
✅ Q3 2025: Coleta de evidências (início, 6 meses coletados)
🔄 Q4 2025: Gap remediation + 3rd party assessments
📅 Q1 2026: Coleta de evidências completa (12 meses)
📅 Q2 2026: Auditoria SOC 2 Type II (Ernst & Young)
📅 Q3 2026: Relatório SOC 2 Type II emitido 🎉
```

**Status Atual:** On track ✅

---

## 📁 **Evidências para Auditoria**

### Estrutura de Evidências (S3)

```
s3://{{S3_COMPLIANCE_BUCKET}}/soc2-evidence/
├── policies/ (15 policies, PDF assinados)
├── risk-assessment/ (annual reports, risk register)
├── access-reviews/ (trimestral, approvals)
├── training-records/ (LMS exports, certificates)
├── monitoring-logs/ (CloudWatch, Grafana, PagerDuty)
├── incident-reports/ (post-mortems, Jira exports)
├── change-logs/ (Git commits, CI/CD pipeline logs)
├── backup-tests/ (weekly PITR tests, 52 evidências/ano)
├── dr-tests/ (monthly simulations, 12 evidências/ano)
├── sla-reports/ (monthly, enviados para clientes)
├── penetration-tests/ (annual, external vendor)
└── vulnerability-scans/ (weekly, automated)
```

**Retenção:** 7 anos (compliance requirement)  
**Acesso:** Read-only para auditores (temporary IAM credentials)

---

## 🔗 **Cross-References**

### Documentos SOC 2

- [Security Controls (TSC C1)](./security-controls.md) - Controles de segurança detalhados
- [Availability Controls (TSC A1)](./availability-controls.md) - SLAs, monitoramento, DR
- [Confidentiality Controls (TSC C2)](./confidentiality-controls.md) - Encryption, classification

### Documentos ISO 27001 (Overlap ~70%)

- [Information Security Policy](../security/information-security-policy.md)
- [Risk Assessment](../security/risk-assessment.md)
- [Incident Response](../security/incident-response.md)
- [Access Control](../security/access-control.md)

### Documentos ISO 22301

- [Business Continuity Plan](../business-continuity/business-continuity-plan.md)
- [Disaster Recovery Plan](../business-continuity/disaster-recovery-plan.md)

---

## 👥 **Responsabilidades**

| Papel | Responsável | Responsabilidades SOC 2 | Contato |
|-------|-------------|-------------------------|---------|
| **SOC 2 Owner** | CTO | Aprovar políticas, coordenar auditoria | {{CTO_EMAIL}} |
| **Compliance Lead** | CISO | Implementar controles, coletar evidências | {{CISO_EMAIL}} |
| **Technical Controls** | DevOps Lead | Infraestrutura, monitoring, DR | {{DEVOPS_EMAIL}} |
| **HR Controls** | HR Manager | Training, background checks | {{HR_EMAIL}} |
| **External Auditor** | Ernst & Young | Validar controles, emitir relatório | ey-auditor@ey.com |

---

## ✅ **Aprovação e Assinaturas**

**Versão:** 1.0  
**Data de Aprovação:** 01 de Março de 2025

**Aprovado por:**

---

**[Nome do CEO]**  
CEO - {{COMPANY_NAME}}  
Data: 01 de Março de 2025

---

**[Nome do CTO]**  
CTO - {{COMPANY_NAME}}  
Data: 01 de Março de 2025

---

**[Nome do CISO]**  
CISO - {{COMPANY_NAME}}  
Data: 01 de Março de 2025

---

**🔐 Classificação:** CONFIDENCIAL - INTERNAL USE ONLY  
**📂 Retenção:** 7 anos  
**🔄 Última Atualização:** 2025-03-01  
**✅ Status:** Aprovado e Vigente  
**📅 Próxima Revisão:** 2026-03-01 (anual)

