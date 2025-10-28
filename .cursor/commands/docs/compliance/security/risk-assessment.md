# Risk Assessment (Avaliação de Riscos) - Granaai

> **Framework:** ISO 27001:2022 - Cláusula 6.1.2  
> **Versão:** 1.0  
> **Data de Aprovação:** 01 de Março de 2025  
> **Próxima Revisão:** 01 de Janeiro de 2026 (anual)  
> **Status:** ✅ Aprovado pela Alta Direção

---

## 📋 **Executive Summary**

Este documento apresenta a **Risk Assessment** (Avaliação de Riscos de Segurança da Informação) da Granaai, realizada conforme ISO 27001:2022 e ISO 27005:2022, identificando:

-  **35 riscos identificados** (completo inventory)
-  **28 riscos mitigados** (80% com controles implementados)
-  **7 riscos aceitos** (baixa probabilidade/impacto, custo > benefício)
-  **0 riscos críticos não mitigados** (zero critical exposure)

**Risk Maturity Level:** ⭐⭐⭐⭐ (4/5 - Advanced)

---

## 🎯 **Risk Assessment Methodology**

### ISO 27005 Framework

**Process:**
```
1. Context Establishment → Define escopo, critérios de risco
2. Risk Identification → Identificar ameaças, vulnerabilidades, ativos
3. Risk Analysis → Avaliar probabilidade e impacto
4. Risk Evaluation → Comparar contra critérios de aceitação
5. Risk Treatment → Decidir: mitigar, aceitar, transferir, evitar
6. Risk Monitoring → Revisar periodicamente
```

---

### Risk Matrix (5x5)

**Likelihood (Probabilidade):**
| Level | Description | Frequency |
|-------|-------------|-----------|
| **5 - Very High** | Quase certo | > 1x/ano |
| **4 - High** | Provável | 1x/2 anos |
| **3 - Medium** | Possível | 1x/5 anos |
| **2 - Low** | Improvável | 1x/10 anos |
| **1 - Very Low** | Raro | < 1x/10 anos |

**Impact (Impacto):**
| Level | Description | Financial | Operational |
|-------|-------------|-----------|-------------|
| **5 - Critical** | Catastrófico | > R$ 5M | Falência possível |
| **4 - High** | Severo | R$ 1-5M | Operação comprometida |
| **3 - Medium** | Moderado | R$ 100k-1M | Downtime significativo |
| **2 - Low** | Menor | R$ 10-100k | Impacto limitado |
| **1 - Very Low** | Insignificante | < R$ 10k | Impacto mínimo |

**Risk Score = Likelihood × Impact**

**Risk Levels:**
- **Critical (20-25):** Ação imediata obrigatória
- **High (12-16):** Mitigação dentro de 30 dias
- **Medium (6-10):** Mitigação dentro de 90 dias
- **Low (3-5):** Monitorar, mitigar se recursos disponíveis
- **Very Low (1-2):** Aceitar

---

## 📊 **Risk Register**

### Risk Category: Cyberattacks

#### RISK-001: DDoS Attack

**Description:** Ataque de negação de serviço distribuído (DDoS) tornando APIs indisponíveis.

**Assets Affected:**
- APIs Core (authentication, transactions, integrations)
- Admin Dashboard
- White Label Portal

**Threat Actors:** Hacktivist groups, competitors, script kiddies

**Vulnerability:** Infraestrutura exposta publicamente (internet-facing)

**Existing Controls:**
- AWS Shield Standard (automatic Layer 3/4 protection)
- AWS WAF (rate limiting: 1000 req/5min per IP)
- CloudFront (CDN, distributed load)

**Assessment:**
- Likelihood: **3 (Medium)** - Histórico: 1 incidente em Nov 2024
- Impact: **4 (High)** - R$ 500k/hora downtime + reputação
- **Risk Score: 12 (HIGH)**

**Treatment Decision:** **Mitigate**

**Treatment Plan:**
-  Implementar AWS Shield Advanced (US$ 3k/mês) - **DONE** (Fev 2025)
-  DDoS Response Team (24/7) - **DONE**
-  Runbook de response - **DONE**

**Residual Risk:** 3 × 2 = **6 (MEDIUM)** ✅ Aceitável

**Owner:** DevOps Lead

---

#### RISK-002: Ransomware Attack

**Description:** Malware que encrypta dados e exige pagamento para recovery.

**Assets Affected:**
- Databases (production RDS)
- Backups (se não protegidos)
- Workstations (employee laptops)

**Threat Actors:** Organized crime groups (e.g., REvil, LockBit)

**Vulnerability:**
- Phishing (email malicioso)
- RDP exposed (Remote Desktop Protocol)
- Unpatched vulnerabilities

**Existing Controls:**
-  Endpoint protection (antivirus, EDR)
-  Email filtering (Google Workspace spam/malware filters)
-  No RDP exposed (SSH only, with key-based auth)
-  Backups (immutable, offline)
-  Security awareness training (phishing simulations)

**Assessment:**
- Likelihood: **2 (Low)** - Controles fortes, sem histórico
- Impact: **5 (Critical)** - R$ 5M+ (downtime + ransom + recovery)
- **Risk Score: 10 (MEDIUM)**

**Treatment Decision:** **Mitigate**

**Treatment Plan:**
-  Backup strategy review (immutability confirmed) - **DONE** (Jan 2025)
-  Offline backups (S3 Glacier, 7 anos) - **DONE**
-  Incident response drill (ransomware scenario) - **DONE** (Mar 2025)
- 📅 Cyber insurance (quote solicitado) - **IN PROGRESS** (Q4 2025)

**Residual Risk:** 2 × 3 = **6 (MEDIUM)** ✅ Aceitável (insurance reduzirá para 2×2=4)

**Owner:** CISO

---

#### RISK-003: SQL Injection

**Description:** Injeção de código SQL malicioso via input de usuário, permitindo acesso não autorizado ao database.

**Assets Affected:** PostgreSQL (production database)

**Threat Actors:** Hackers, automated bots

**Vulnerability:** Input validation inadequada em APIs

**Existing Controls:**
-  ORM (Prisma) - parametrized queries (previne SQL injection)
-  Input validation (schema validation via Zod)
-  WAF (AWS WAF, SQL injection rule set)
-  Least privilege (database user permissions limitadas)
-  Security testing (SAST, penetration test)

**Assessment:**
- Likelihood: **1 (Very Low)** - Múltiplas camadas de defesa
- Impact: **5 (Critical)** - Acesso completo ao database
- **Risk Score: 5 (LOW)**

**Treatment Decision:** **Accept** (controles suficientes)

**Monitoring:** Continuous (WAF blocks, SAST in CI/CD)

**Owner:** Backend Lead

---

### Risk Category: Insider Threats

#### RISK-004: Malicious Insider

**Description:** Employee com acesso privilegiado intencional mente exfiltra dados ou sabota sistemas.

**Assets Affected:** Todos os sistemas (depende do nível de acesso)

**Threat Actors:** Descontented employees, financially motivated insiders

**Vulnerability:** High trust model (admins têm acesso amplo)

**Existing Controls:**
-  Background checks (todos colaboradores)
-  NDA (confidentiality agreements)
-  Access reviews (trimestral)
-  Audit logs (all admin actions)
-  Separation of duties (no single person has full control)

**Assessment:**
- Likelihood: **2 (Low)** - Cultura forte, vetting process
- Impact: **5 (Critical)** - Potencial data breach completo
- **Risk Score: 10 (MEDIUM)**

**Treatment Decision:** **Mitigate**

**Treatment Plan:**
-  DLP (Data Loss Prevention) - **DONE** (Google Workspace, MDM)
- 📅 User behavior analytics (UEBA) - **PLANNED** (Q1 2026)
-  Mandatory vacations (detection opportunity) - **POLICY** (5 dias/ano)

**Residual Risk:** 1 × 5 = **5 (LOW)** ✅ Aceitável

**Owner:** CISO

---

#### RISK-005: Negligent Insider

**Description:** Employee acidentalmente expõe dados ou causa incidente (ex: phishing, misconfiguration).

**Assets Affected:** PII, confidential documents, credentials

**Threat Actors:** N/A (não malicioso)

**Vulnerability:** Lack of awareness, human error

**Existing Controls:**
-  Security awareness training (annual + onboarding)
-  Phishing simulations (trimestral, click rate 4%)
-  DLP (email, endpoint)
-  Configuration management (Infrastructure as Code, review process)

**Assessment:**
- Likelihood: **4 (High)** - Humano erra, inevitável
- Impact: **3 (Medium)** - Limitado por DLP e access controls
- **Risk Score: 12 (HIGH)**

**Treatment Decision:** **Mitigate**

**Treatment Plan:**
-  Training program reforçado - **DONE** (2025)
-  DLP implementado - **DONE**
- 📅 Security champions program (1 por equipe) - **PLANNED** (Q4 2025)

**Residual Risk:** 3 × 2 = **6 (MEDIUM)** ✅ Aceitável

**Owner:** HR + CISO

---

### Risk Category: Third-Party Risks

#### RISK-006: AWS Outage (Regional)

**Description:** AWS região us-east-1 completamente indisponível.

**Assets Affected:** Toda infraestrutura (se sem DR)

**Threat Actors:** N/A (failure scenario)

**Vulnerability:** Dependência de single region

**Existing Controls:**
-  Multi-AZ deployment (protege contra AZ failure, não region)
-  DR region (us-west-2, warm standby)
-  DR tests (mensal simulations, semestral full test)
-  Runbooks (DR failover procedures)

**Assessment:**
- Likelihood: **2 (Low)** - Histórico AWS: ~1x/5 anos per region
- Impact: **5 (Critical)** - R$ 5M+ (se sem DR), R$ 500k (com DR, downtime 2h)
- **Risk Score: 10 (MEDIUM)** (com DR implementado)

**Treatment Decision:** **Mitigate** (DR implementado)

**Residual Risk:** 2 × 2 = **4 (LOW)** ✅ Aceitável

**Owner:** DevOps Lead

---

#### RISK-007: Third-Party Data Breach (Stripe, Auth0)

**Description:** Vendor crítico sofre data breach, expondo dados de clientes.

**Assets Affected:** Payment data (Stripe), authentication data (Auth0)

**Threat Actors:** Hackers targeting vendor

**Vulnerability:** Dependência de third-party security

**Existing Controls:**
-  Vendor risk assessment (SOC 2 Type II required)
-  Tokenization (Stripe, não armazenamos card data)
-  SSO (Auth0, passwordless onde possível)
-  Monitoring (vendor status pages, alerts)

**Assessment:**
- Likelihood: **2 (Low)** - Vendors são SOC 2 certified, maturidade alta
- Impact: **4 (High)** - Reputação, possível LGPD violation
- **Risk Score: 8 (MEDIUM)**

**Treatment Decision:** **Accept** (controles do vendor + tokenization)

**Contingency:** Incident response plan inclui vendor breach scenario

**Owner:** CISO

---

### Risk Category: Compliance Risks

#### RISK-008: LGPD Violation (Data Subject Rights)

**Description:** Falha em atender direitos dos titulares (ex: right to erasure) dentro de 30 dias.

**Assets Affected:** PII de usuários

**Threat Actors:** N/A (compliance failure)

**Vulnerability:** Processo manual, falta de automação

**Existing Controls:**
-  DPO (Data Protection Officer) designado
-  Privacy Policy publicada
-  Data Subject Request (DSR) process documentado
-  Histórico: 5 requests atendidos em 2025, 100% < 30 dias ✅

**Assessment:**
- Likelihood: **2 (Low)** - Processo funcionando, histórico bom
- Impact: **4 (High)** - Multa ANPD (2% receita, até R$ 50M)
- **Risk Score: 8 (MEDIUM)**

**Treatment Decision:** **Mitigate**

**Treatment Plan:**
-  DSR automation (script para anonymization) - **DONE** (Jan 2025)
- 📅 LGPD compliance audit (external) - **PLANNED** (Q1 2026)

**Residual Risk:** 1 × 4 = **4 (LOW)** ✅ Aceitável

**Owner:** DPO (COO)

---

## 📊 **Risk Summary Dashboard**

### Risks by Category

| Category | Total | Critical | High | Medium | Low | Very Low |
|----------|-------|----------|------|--------|-----|----------|
| **Cyberattacks** | 12 | 0 | 2 | 6 | 4 | 0 |
| **Insider Threats** | 5 | 0 | 1 | 2 | 2 | 0 |
| **Third-Party** | 8 | 0 | 0 | 4 | 4 | 0 |
| **Compliance** | 6 | 0 | 0 | 2 | 4 | 0 |
| **Operational** | 4 | 0 | 0 | 2 | 2 | 0 |
| **TOTAL** | **35** | **0** | **3** | **16** | **16** | **0** |

---

### Risk Treatment Status

| Treatment | Count | % |
|-----------|-------|---|
| **Mitigate** | 28 | 80% |
| **Accept** | 7 | 20% |
| **Transfer** | 0 | 0% |
| **Avoid** | 0 | 0% |

---

### Residual Risk (After Treatment)

| Level | Count | Trend |
|-------|-------|-------|
| **Critical** | 0 | ✅ 0 (was 0) |
| **High** | 0 | ✅ 0 (was 3) |
| **Medium** | 8 | ↓ 8 (was 16) |
| **Low** | 27 | ↑ 27 (was 16) |

**Risk Reduction:** 100% de riscos críticos/altos mitigados ✅

---

## 🔗 **Cross-References**

- [Information Security Policy](./information-security-policy.md)
- [Incident Response Plan](./incident-response.md)
- [Business Continuity Plan](../business-continuity/business-continuity-plan.md)

---

## ✅ **Aprovação**

**Aprovado por:** CTO + CISO + CEO  
**Data:** 01 de Março de 2025  
**Próxima Revisão:** 01 de Janeiro de 2026 (annual)

---

**🔐 Classificação:** CONFIDENTIAL  
**📂 Retenção:** 7 anos

