# SOC 2 Confidentiality Controls (TSC C2) - Granaai

> **Framework:** SOC 2 Type II - Trust Services Criteria C2 (Confidentiality)  
> **Versão:** 1.0  
> **Data de Aprovação:** 01 de Março de 2025  
> **Próxima Revisão:** 01 de Março de 2026 (anual)  
> **Status:** ✅ Aprovado pela Alta Direção

---

## 📋 **Executive Summary**

Este documento descreve os **Confidentiality Controls** implementados pela Granaai para proteger dados confidenciais contra acesso, uso ou divulgação não autorizados, cobrindo:

-  **Data Classification:** 4 níveis (Public, Internal, Confidential, Restricted)
-  **Encryption:** At rest (AES-256) e in transit (TLS 1.3)
-  **Access Controls:** RBAC, least privilege, audit logs
-  **Data Lifecycle:** Retention policies, secure disposal
-  **DLP (Data Loss Prevention):** Automated detection de data leaks

**Compliance:** Zero data breaches em 2025 ✅

---

## 🔐 **C2.1: Data Classification**

### Classification Levels

| Level | Definition | Examples | Storage | Access | Encryption |
|-------|------------|----------|---------|--------|------------|
| **Public** | Pode ser divulgado publicamente | Marketing, blog posts | S3 public | Anyone | Optional |
| **Internal** | Uso interno apenas | Policies, handbooks | S3 private | Employees | At rest |
| **Confidential** | Sensível, prejuízo se vazado | Contracts, financials | RDS, S3 encrypted | Need-to-know | At rest + transit |
| **Restricted** | Altamente sensível, dano severo se vazado | PII, CPF, payment data | RDS encrypted, S3 | Strict RBAC | At rest + transit + audit |

---

### Data Inventory (Restricted Data)

**PII (Personally Identifiable Information):**
- Nome completo
- CPF
- Email
- Telefone
- Endereço
- Data de nascimento
- RG

**Financial Data:**
- Dados bancários (banco, agência, conta)
- Cartões de crédito (tokenized via Stripe)
- Transações financeiras
- Recebíveis (valores, datas, sacados)

**Storage:**
- PostgreSQL RDS (encrypted AES-256)
- Retention: 7 anos (BACEN requirement)
- Backup: Encrypted (AWS Backup)

---

## 🔒 **C2.2: Encryption**

### Encryption At Rest

**RDS (PostgreSQL):**
- Algorithm: AES-256
- Key Management: AWS KMS
- Key Rotation: Automatic (annual)
- Backup Encryption: Enabled (automatic)

**S3:**
- Algorithm: AES-256 (SSE-S3)
- All buckets: Encryption enforced (bucket policy)
- Versioning: Enabled (prevents accidental deletion)

**EBS Volumes (EKS nodes):**
- Algorithm: AES-256
- Key Management: AWS KMS
- All volumes: Encrypted by default

**Secrets:**
- AWS Secrets Manager (encrypted)
- Rotation: Automatic (90 days)

---

### Encryption In Transit

**HTTPS (TLS 1.3):**
- All public APIs: HTTPS only (HTTP → HTTPS redirect)
- Certificate: AWS Certificate Manager (automatic renewal)
- Cipher suites: Strong ciphers only (PFS - Perfect Forward Secrecy)

**Database Connections:**
- PostgreSQL: SSL/TLS required
- Redis: TLS enabled (in-transit encryption)

**VPN:**
- Protocol: IPSec (IKEv2)
- Encryption: AES-256
- Used for: Employee access to internal resources

---

## 🛡️ **C2.3: Access Controls**

### RBAC (Role-Based Access Control)

**Principle:** Least Privilege

**Access to Restricted Data:**
| Role | PII Access | Financial Data | Justification |
|------|-----------|----------------|---------------|
| **Admin** | Full (read/write) | Full (read/write) | System administration |
| **Developer** | Masked (staging only) | Masked (staging only) | Development |
| **Support** | Limited (customer context) | Read-only (transactions) | Customer support |
| **Finance** | No | Full (read/write) | Financial operations |
| **QA** | No (test data only) | No (test data only) | Testing |

**Data Masking (Staging/Dev):**
- CPF: XXX.XXX.XXX-XX
- Email: user****@domain.com
- Phone: (XX) XXXXX-XXXX

---

### Audit Logs

**All Access to Restricted Data is Logged:**

**Logs Include:**
- User ID
- Timestamp (UTC)
- Action (read, update, delete)
- Resource accessed (table, record ID)
- IP address
- Success/failure

**Retention:** 90 dias online, 7 anos archived (S3 Glacier)

**Review:** Quarterly (CISO + Security Analyst)

**Anomaly Detection:**
- Unusual access patterns (e.g., bulk export)
- Access from unusual IPs
- Access outside business hours
- Automated alerts (CloudWatch Alarms)

---

## 📊 **C2.4: Data Lifecycle Management**

### Data Retention

**Retention Policies:**
| Data Type | Retention | Justification | Disposal |
|-----------|-----------|---------------|----------|
| **Transações Financeiras** | 7 anos | BACEN requirement | Encrypted deletion |
| **PII (Usuários Ativos)** | While active + 5 anos | LGPD + business need | Anonymization |
| **PII (Usuários Inativos)** | 2 anos após inatividade | LGPD data minimization | Deletion |
| **Logs de Aplicação** | 90 dias online, 7 anos Glacier | Audit, compliance | Lifecycle policy (S3) |
| **Backups (RDS)** | 30 dias | Recovery capability | Encrypted deletion |

---

### Secure Disposal

**Automated Deletion:**
- S3 Lifecycle policies (automatic transition to Glacier, then deletion)
- RDS snapshots: Deleted after retention period (encrypted)
- Old backups: Secure deletion (AWS handles)

**Data Subject Requests (LGPD):**
- Right to erasure (direito ao esquecimento)
- Process: Request → Validation → Anonymization/Deletion → Confirmation
- SLA: < 30 dias (LGPD requirement)
- Handled: 5 requests em 2025 (100% < 30 dias) ✅

---

## 🚨 **C2.5: Data Loss Prevention (DLP)**

### DLP Strategy

**Goal:** Detect e prevent unauthorized data exfiltration

**Controls:**

**1. Email DLP (Google Workspace):**
- Detect: CPF patterns, credit card numbers, keywords
- Action: Block email, alert security team
- Coverage: All corporate emails (50 users)

**2. Endpoint DLP (MDM):**
- Prevent: USB device usage, screenshot tools, unencrypted cloud uploads
- Coverage: All corporate laptops (50 devices)
- Exceptions: Approved by CISO (with audit trail)

**3. Network DLP (Egress Monitoring):**
- Monitor: Large data transfers, unusual destinations
- Alert: Security team for investigation
- Tool: VPC Flow Logs + CloudWatch Insights

**Incidents (2025):** 
- Alerts triggered: 8
- False positives: 6 (legitimate business use)
- True positives: 2 (resolved, no data leak confirmed)

---

## 📋 **C2.6: Non-Disclosure Agreements (NDAs)**

### Employees

**Requirement:** All employees sign NDA on onboarding

**Terms:**
- Confidential information cannot be disclosed
- Valid during employment + 2 years after termination
- Penalties: Legal action, termination

**Compliance:** 100% (50/50 employees signed)

---

### Third-Parties

**Requirement:** Vendors with access to confidential data sign NDA

**Vendors with NDAs:**
- AWS (Master Services Agreement includes confidentiality)
- Auth0 (DPA - Data Processing Agreement)
- Stripe (PCI DSS compliant, NDA signed)
- External auditors (NDA + confidentiality clause)

**Compliance:** 100% critical vendors covered

---

## 🔗 **Cross-References**

- [Security Controls (SOC2)](./security-controls.md)
- [Availability Controls (SOC2)](./availability-controls.md)
- [Information Security Policy](../security/information-security-policy.md)

---

## ✅ **Aprovação**

**Aprovado por:** CTO + CISO + CEO  
**Data:** 01 de Março de 2025  
**Próxima Revisão:** 01 de Março de 2026

---

**🔐 Classificação:** CONFIDENTIAL  
**📂 Retenção:** 7 anos

