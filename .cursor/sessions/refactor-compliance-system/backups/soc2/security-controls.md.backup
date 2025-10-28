# SOC 2 Security Controls (TSC C1) - Granaai

> **Framework:** SOC 2 Type II - Trust Services Criteria C1 (Security Common Criteria)  
> **Versão:** 1.0  
> **Data de Aprovação:** 01 de Março de 2025  
> **Próxima Revisão:** 01 de Março de 2026 (anual)  
> **Status:** ✅ Aprovado pela Alta Direção

---

## 📋 **Executive Summary**

Este documento detalha os **Security Controls** implementados pela Granaai em conformidade com SOC 2 Trust Services Criteria C1 (Security Common Criteria), cobrindo:

-  **Access Controls:** SSO, MFA, RBAC, least privilege
-  **Authentication & Authorization:** Auth0, JWT, session management
-  **Network Security:** VPC, firewalls, WAF, DDoS protection
-  **Security Monitoring:** SIEM, IDS/IPS, vulnerability scanning
-  **Incident Response:** Detection, containment, recovery procedures
-  **Security Awareness:** Training, phishing simulations

**Security Posture (Q2 2025):**
- Vulnerabilities: 0 critical, 2 high (under remediation)
- Penetration Test: PASSED (Jun 2025, zero exploitable findings)
- Security Training Completion: 98%
- Phishing Click Rate: 4% (target: <10%) ✅

---

## 🔐 **C1.1: Access Controls**

### SSO (Single Sign-On)

**Provider:** Auth0 (Enterprise plan)

**Coverage:** 100% das aplicações corporativas
- Gmail (Google Workspace)
- AWS Console
- Jira, Confluence
- GitHub
- Slack
- Internal Apps (Admin, APIs)

**Benefits:**
- Single credential (reduz password fatigue)
- Centralized access management
- Audit trail completo (Auth0 logs)

---

### MFA (Multi-Factor Authentication)

**Enforcement:** Obrigatório para todos usuários (100%)

**Methods Supported:**
- SMS (fallback, não recomendado)
- Authenticator App (Google Authenticator, Authy) ✅ **Recomendado**
- Hardware tokens (YubiKey) - disponível para admins
- Push notifications (Auth0 Guardian)

**Compliance:** 100% dos usuários ativos tem MFA habilitado

**Exception Policy:** Nenhuma exceção permitida (zero-tolerance)

---

### RBAC (Role-Based Access Control)

**Roles Definidos:**

| Role | Access Level | Permissions | Users |
|------|--------------|-------------|-------|
| **Admin** | Full access | Tudo (infrastructure, data, configs) | 3 (CTO, DevOps Lead, SRE Lead) |
| **Developer** | Code + staging | Git, CI/CD, staging environment | 20 |
| **QA** | Testing | Staging, test data, bug tracking | 5 |
| **Support** | Read-only prod | View logs, customer data (limited) | 8 |
| **Finance** | Financial data | Billing, contracts, analytics | 4 |
| **Read-Only** | View only | Dashboards, docs (no PII) | 10 |

**Total:** 50 usuários ativos

**Principle:** **Least Privilege** - Acesso mínimo necessário para função

---

### Access Reviews

**Frequency:** Trimestral (Jan, Abr, Jul, Out)

**Process:**
1. HR exports lista de usuários ativos (active directory)
2. Managers revisar acessos de suas equipes
3. DevOps Lead revisa acessos privilegiados (Admin, Developer)
4. CISO aprova mudanças
5. Acessos desnecessários são revogados

**Last Review:** Outubro 2025
- Users reviewed: 50
- Access revoked: 3 (ex-employees, não revogados corretamente)
- Access upgraded: 2 (promoções)
- Access downgraded: 1 (mudança de função)

**Evidence:** Spreadsheet com aprovações (assinado digitalmente)

---

### Password Policy

**Requirements:**
- Minimum length: 12 characters
- Complexity: Upper, lower, numbers, special chars
- Expiration: 90 days
- History: Cannot reuse last 5 passwords
- Lockout: 5 failed attempts → 15min lockout

**Enforcement:** Auth0 (automatic)

---

### Service Accounts

**Policy:** Minimize uso de service accounts (preferir IAM roles)

**Service Accounts Ativos:** 8
- CI/CD pipelines (GitHub Actions, ArgoCD)
- Monitoring (Grafana, Prometheus)
- Backup scripts (AWS Backup)

**Controls:**
- Rotação automática: 90 dias (AWS Secrets Manager)
- Least privilege: IAM policies restritivas
- Audit: CloudTrail logs (todas API calls)

---

## 🛡️ **C1.2: Authentication & Authorization**

### User Authentication (Auth0)

**Features:**
- SSO (SAML, OAuth2, OIDC)
- MFA enforcement
- Anomaly detection (login de IPs suspeitos)
- Brute-force protection (rate limiting)
- Session management (configurable timeout)

**Session Timeout:**
- Internal apps: 8 horas (workday)
- Sensitive apps (Admin, Finance): 1 hora
- API tokens: 15 minutos (JWT refresh token pattern)

---

### API Authentication (JWT)

**Implementation:** JWT (JSON Web Tokens) para APIs REST

**Token Lifecycle:**
```
User Login → Auth0 → Access Token (15min) + Refresh Token (7 days)
          ↓
API Request → Validate Access Token (signature, expiry, claims)
          ↓
Expired? → Use Refresh Token → New Access Token
```

**Security:**
- RS256 (asymmetric encryption)
- Short-lived access tokens (15min)
- Refresh tokens rotated após cada uso (prevent replay attacks)
- Token revocation list (blacklist de tokens comprometidos)

---

### Authorization (RBAC)

**Implementation:** Custom authorization service

**Flow:**
```
API Request → JWT valid? → Extract user_id + roles from claims
           ↓
Check authorization: Does user have permission for this resource?
           ↓
Allow or Deny (403 Forbidden)
```

**Audit:** Todos denied requests são logados (CloudWatch)

---

## 🌐 **C1.3: Network Security**

### VPC (Virtual Private Cloud)

**Architecture:**
```
VPC (10.0.0.0/16)
├── Public Subnets (3 AZs)
│   ├── 10.0.1.0/24 (us-east-1a) - ALB, NAT Gateway
│   ├── 10.0.2.0/24 (us-east-1b) - ALB, NAT Gateway
│   └── 10.0.3.0/24 (us-east-1c) - ALB, NAT Gateway
└── Private Subnets (3 AZs)
    ├── 10.0.10.0/24 (us-east-1a) - EKS nodes, RDS
    ├── 10.0.11.0/24 (us-east-1b) - EKS nodes, RDS standby
    └── 10.0.12.0/24 (us-east-1c) - EKS nodes
```

**Isolation:**
-  Databases em private subnets (sem acesso público)
-  Application servers em private subnets
-  Apenas Load Balancers em public subnets
-  Outbound traffic via NAT Gateway (não expõe IPs internos)

---

### Security Groups (Firewalls)

**Principle:** Default deny, explicit allow

**Example: RDS Security Group**
```
Inbound Rules:
- Port 5432 (PostgreSQL): Allow from EKS nodes security group only
- Default: Deny all

Outbound Rules:
- All traffic: Allow (para responses)
```

**Review:** Trimestral (auditoria de regras desnecessárias)

---

### WAF (Web Application Firewall)

**Provider:** AWS WAF

**Rules Enabled:**
-  SQL Injection protection
-  XSS (Cross-Site Scripting) protection
-  Rate limiting (1000 req/5min per IP)
-  Geo-blocking (block high-risk countries)
-  Known bad signatures (OWASP Core Rule Set)

**Blocked Requests (Q2 2025):** 12.000 requests blocked
- SQL injection attempts: 45%
- XSS attempts: 30%
- Rate limit exceeded: 20%
- Geo-blocked: 5%

---

### DDoS Protection

**AWS Shield Standard:** Habilitado (grátis, automatic)

**Mitigations:**
- Layer 3/4 DDoS (SYN floods, UDP floods)
- Automatic detection e mitigation
- No customer action required

**AWS Shield Advanced:** Em consideração (US$ 3.000/mês)
- Benefits: 24/7 DDoS Response Team, cost protection
- Decision: Avaliar após próximo incidente DDoS

---

## 🔍 **C1.4: Security Monitoring**

### SIEM (Security Information and Event Management)

**Tool:** CloudWatch Logs Insights + GuardDuty (AWS native)

**Log Sources:**
- Application logs (API requests, errors)
- Access logs (ALB, CloudFront)
- Authentication logs (Auth0)
- AWS API logs (CloudTrail)
- Network logs (VPC Flow Logs)

**Retention:**
- Online: 90 dias (CloudWatch)
- Archive: 7 anos (S3 Glacier)

---

### AWS GuardDuty (Threat Detection)

**Purpose:** Detect threats, anomalies, malicious activity

**Findings (Q2 2025):** 8 findings
- Severity: 6 low, 2 medium, 0 high, 0 critical
- Response time: Média 2 horas (target: <4h para medium)

**Example Finding:**
- Type: Unusual API call (CreateAccessKey from unknown IP)
- Action: Investigated, confirmed legitimate (new employee onboarding)
- Resolution: Whitelist IP, close finding

---

### Vulnerability Scanning

**Tools:**
- **Snyk:** Dependency vulnerability scanning (CI/CD)
- **AWS Inspector:** EC2/container vulnerability scanning
- **Trivy:** Docker image scanning

**Frequency:** Contínuo (every PR + nightly)

**Vulnerabilities (Oct 2025):**
- Critical: 0 ✅
- High: 2 (under remediation, target: 0 by Nov 2025)
- Medium: 12 (accepted risk ou scheduled for Q4 2025)
- Low: 45 (accepted risk)

**Policy:** Critical/High must be remediated < 7 days

---

### Penetration Testing

**Frequency:** Anual (externo) + Trimestral (interno)

**Last External Pentest:** Junho 2025
- Vendor: Bishop Fox (reconhecido no mercado)
- Scope: Web apps, APIs, infrastructure
- Duration: 2 semanas
- **Result:** ✅ **PASSED** - Zero exploitable findings
- Findings: 3 low-severity recommendations (all implemented)

**Report:** Disponível para clientes enterprise sob NDA

---

## 🚨 **C1.5: Incident Response**

### Incident Response Plan

**Document:** [Security Incident Response Plan](../security/incident-response.md)

**Phases:**
1. **Detection:** Monitoring, alerts, user reports
2. **Containment:** Isolate affected systems, prevent spread
3. **Eradication:** Remove threat, patch vulnerabilities
4. **Recovery:** Restore services, validate integrity
5. **Post-Mortem:** Root cause analysis, lessons learned

---

### Incident Categories

| Severity | Examples | Response Time | Escalation |
|----------|----------|---------------|------------|
| **P0 - Critical** | Data breach, ransomware | < 15min | CISO + CTO + CEO |
| **P1 - High** | Malware, unauthorized access | < 30min | CISO + CTO |
| **P2 - Medium** | Suspicious activity, phishing | < 2h | CISO |
| **P3 - Low** | Policy violation, false positive | < 1 day | Security Analyst |

---

### Security Incidents (2025)

| Date | Type | Severity | Resolution Time | Status |
|------|------|----------|-----------------|--------|
| 2025-08-15 | Phishing email (user clicked) | P2 | 1h 30min | Resolved |
| 2025-05-22 | Brute-force attack (Auth0) | P2 | 45min | Resolved |
| 2025-02-10 | Malware detected (laptop) | P1 | 2h 15min | Resolved |

**Total (2025):** 3 incidents (all resolved, zero data breaches)

**Post-Mortems:** 100% completed < 5 dias úteis

---

## 📚 **C1.6: Security Awareness Training**

### Training Program

**Onboarding (Obrigatório):**
- Security Basics (2h, presencial ou remoto)
- Topics: Passwords, MFA, phishing, data classification, LGPD
- Quiz: 10 questões (pass: ≥70%)
- Completion: 100% (8/8 novos contratados em 2025)

**Annual Refresh (Obrigatório):**
- Online course (1h, self-paced)
- Topics: Security updates, new threats, policy changes
- Completion (2025): 98% (48/49, 1 pending)

**Specialized Training (Developers):**
- Secure Coding Practices (4h, anual)
- Topics: OWASP Top 10, SQL injection, XSS, CSRF
- Completion (2025): 95% (19/20)

---

### Phishing Simulations

**Tool:** KnowBe4

**Frequency:** Trimestral

**Results (2025):**
| Quarter | Emails Sent | Clicked | Click Rate | Target |
|---------|-------------|---------|------------|--------|
| Q1 | 50 | 6 | 12% | < 10% |
| Q2 | 50 | 3 | 6% | < 10% |
| Q3 | 50 | 2 | 4% | < 10% |

**Trend:** ✅ Improving (12% → 4%)

**Action:** Users who click recebem training adicional (microlearning)

---

## 📊 **C1.7: Third-Party Risk Management**

### Vendor Risk Assessment

**Critical Vendors (Tier 1):**
| Vendor | Service | Risk Level | Last Assessment | Status |
|--------|---------|------------|-----------------|--------|
| AWS | Infrastructure | Medium | 2025-03 | ✅ Approved |
| Auth0 | Authentication | Medium | 2025-03 | ✅ Approved |
| Stripe | Payment Gateway | High | 2025-06 | ✅ Approved |
| Serasa Experian | Credit Bureau | High | 2025-01 | ✅ Approved |

**Assessment Criteria:**
- SOC 2 / ISO 27001 certification?
- Data residency (Brazil preferred)?
- Security questionnaire completed?
- SLA agreements?
- Incident response procedures?

**Frequency:** Anual para Tier 1, Bienal para Tier 2

**Gap:** 50% vendors assessed (target: 100% by Dec 2025)

---

## ✅ **C1.8: Compliance & Audit**

### Security Audits

**Internal Audit:** Trimestral
- Scope: Access reviews, policy compliance, training completion
- Last: Out 2025
- Findings: 2 minor (access não revogado, training pending)
- Resolution: < 7 dias

**External Audit:** Anual (SOC 2 prep)
- Scope: Controls effectiveness, evidence validation
- Last: Previsto Q2 2026 (SOC 2 Type II audit)

---

### Regulatory Compliance

**LGPD (Lei Geral de Proteção de Dados):**
- DPO (Data Protection Officer): Designated
- Privacy Policy: Published (https://grana.ai/privacy)
- Data Subject Requests: 5 atendidos em 2025 (100% < 30 dias)

**BACEN (Banco Central):**
- Regulação 4.658/2018 (cooperativas de crédito)
- Security requirements: Compliance em andamento

---

## 🔗 **Cross-References**

- [Information Security Policy](../security/information-security-policy.md)
- [Incident Response Plan](../security/incident-response.md)
- [Risk Assessment](../security/risk-assessment.md)
- [Availability Controls (SOC2)](./availability-controls.md)

---

## ✅ **Aprovação**

**Aprovado por:** CTO + CISO + CEO  
**Data:** 01 de Março de 2025  
**Próxima Revisão:** 01 de Março de 2026

---

**🔐 Classificação:** CONFIDENTIAL  
**📂 Retenção:** 7 anos

