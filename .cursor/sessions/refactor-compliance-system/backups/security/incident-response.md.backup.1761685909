# Security Incident Response Plan - Granaai

> **Framework:** ISO 27001:2022 - Cláusula A.5.24 + ISO 27035:2023  
> **Versão:** 1.0  
> **Data de Aprovação:** 01 de Março de 2025  
> **Próxima Revisão:** 01 de Março de 2026 (anual)  
> **Status:** ✅ Aprovado pela Alta Direção

---

## 📋 **Executive Summary**

Este documento estabelece os procedimentos de **Security Incident Response** (Resposta a Incidentes de Segurança) da Granaai, garantindo:

-  **Detection rápida:** MTTD < 15min (mean time to detect)
-  **Response estruturado:** Runbooks para cenários comuns
-  **Containment efetivo:** Minimizar impacto e data loss
-  **Recovery sistemático:** Restaurar operação normal com segurança
-  **Lessons learned:** Post-mortem obrigatório para todos incidentes P0/P1

**Performance (2025):**
- Incidentes de segurança: 3 (0 data breaches) ✅
- MTTD: 12min avg (meta: <15min) ✅
- MTTR: 95% dentro de SLA (meta: 100%)

---

## 🎯 **Incident Classification**

### Severity Levels

| Severity | Examples | Response Time | Escalation | MTTR Target |
|----------|----------|---------------|------------|-------------|
| **P0 - Critical** | Data breach, ransomware, complete system outage | < 15min | CISO + CTO + CEO | < 2h |
| **P1 - High** | Malware, unauthorized access, partial outage | < 30min | CISO + CTO | < 4h |
| **P2 - Medium** | Suspicious activity, phishing (clicked), policy violation | < 2h | CISO | < 1 day |
| **P3 - Low** | False positive, minor policy violation | < 1 day | Security Analyst | < 1 week |

---

### Incident Types

#### 1. Cyberattacks
- **DDoS (Distributed Denial of Service):** Sobrecarga de tráfego malicioso
- **Ransomware:** Malware que encrypta dados e exige resgate
- **Malware:** Vírus, trojans, spyware
- **Phishing:** Email malicioso para roubar credenciais
- **SQL Injection / XSS:** Web application attacks

#### 2. Data Breaches
- **Unauthorized Access:** Acesso não autorizado a dados sensíveis (PII, financeiros)
- **Data Exfiltration:** Dados extraídos da organização (leak, theft)
- **Accidental Exposure:** Dados expostos publicamente por erro (S3 bucket público)

#### 3. Insider Threats
- **Malicious Insider:** Employee intencionalmente causa dano ou rouba dados
- **Negligent Insider:** Employee acidentalmente expõe dados ou viola policy

#### 4. Availability Incidents
- **System Outage:** Downtime não planejado > 30min
- **Performance Degradation:** Latência aumentada significativamente

---

## 🚨 **Incident Response Process (ISO 27035)**

### Phase 1: Detection & Reporting (< 15min)

**Detection Sources:**
- **Automated:** CloudWatch alarms, GuardDuty findings, WAF blocks, PagerDuty
- **Manual:** Employee report, customer complaint, security researcher disclosure
- **External:** Vendor notification (AWS, Auth0, Stripe)

**Reporting Channels:**
- **Urgent (P0/P1):** PagerDuty (triggers on-call SRE) + Slack #security-incidents
- **Non-Urgent (P2/P3):** Email security@grana.ai ou Slack #security-incidents

**Initial Assessment (by On-Call SRE):**
1. Validar se é incident real (não false positive)
2. Classificar severidade (P0/P1/P2/P3)
3. Criar ticket Jira (tipo: Security Incident)
4. Escalar conforme matriz de escalation

---

### Phase 2: Containment (15-60min)

**Goal:** Parar o ataque/impacto de se espalhar

**Short-Term Containment (imediato):**
- **Isolar sistemas afetados:** Desconectar da rede, block IPs (WAF, Security Groups)
- **Revocar credenciais comprometidas:** Disable users no Auth0, rotate API keys
- **Block malicious traffic:** Update WAF rules, rate limiting agressivo
- **Preserve evidências:** Snapshot de VMs, copy logs, disk images (forensics)

**Long-Term Containment (< 4h):**
- **Patch vulnerabilities exploradas:** Apply security patches
- **Deploy temporary workarounds:** Disable features afetadas temporariamente
- **Increase monitoring:** Add custom CloudWatch alarms, GuardDuty sensitivity

**Runbooks:**
- `docs/security/runbooks/containment-ddos.md`
- `docs/security/runbooks/containment-ransomware.md`
- `docs/security/runbooks/containment-data-breach.md`

---

### Phase 3: Eradication (1-8h)

**Goal:** Remover completamente a ameaça

**Actions:**
- **Remover malware:** Endpoint antivirus/EDR, reimaging infected machines
- **Close vulnerabilities:** Code fixes, configuration changes, patches
- **Remove backdoors:** Audit all access (SSH keys, IAM users, API keys)
- **Validate systems clean:** Scan with multiple tools (não confiar em single scan)

**Validation:**
- Security scans (Snyk, Trivy, AWS Inspector)
- Manual code review (se vulnerability foi exploitada)
- External pentest (se data breach confirmado)

---

### Phase 4: Recovery (2-24h)

**Goal:** Restaurar operação normal com segurança

**Actions:**
- **Restore de backups (se necessário):** PITR (point-in-time recovery) antes do incident
- **Reintroduzir sistemas isolados:** Gradualmente, com monitoring intensificado
- **Smoke tests:** Validar funcionalidades críticas
- **Monitor for recurrence:** 48h de monitoring intensivo pós-recovery

**Validation Criteria:**
- Todos sistemas operando normalmente
- Performance dentro do esperado (latency, throughput)
- Nenhum alerta de security
- Cliente não reporta issues

---

### Phase 5: Post-Incident (< 5 dias úteis)

**Post-Mortem Meeting (obrigatório para P0/P1):**
- **Quando:** Dentro de 48h após resolução
- **Participantes:** Incident response team + stakeholders afetados
- **Facilitador:** CISO
- **Duração:** 1-2 horas
- **Agenda:**
  1. Timeline reconstruction
  2. Root cause analysis
  3. What went well
  4. What went wrong
  5. Action items (preventive measures)

**Post-Mortem Report (escrito):**
- **Prazo:** < 5 dias úteis após resolução
- **Formato:** Markdown (template: `docs/security/templates/post-mortem.md`)
- **Distribuição:**
  - Interna: All employees (transparency)
  - Externa: Clientes enterprise impactados (sob NDA)
- **Arquivamento:** `docs/incidents/post-mortems/YYYY-MM-DD-incident-name.md`

**Action Items Tracking:**
- Criar Jira tickets (projeto: SECURITY)
- Assign owners e deadlines
- Track até completion (reviewed monthly por CISO)

---

## 📊 **Incident Response Team (IRT)**

### Core Team

| Papel | Responsável | Responsabilidades | Contato 24/7 |
|-------|-------------|-------------------|--------------|
| **Incident Commander** | CISO | Coordenar response, decision-making, comunicação externa | +55 11 AAAA-AAAA |
| **Technical Lead** | DevOps Lead | Containment técnico, eradication, recovery | +55 11 YYYY-YYYY |
| **Security Analyst** | Security Analyst | Investigation, forensics, evidence collection | On-call (PagerDuty) |
| **Communications** | Customer Success Lead | Comunicação com clientes, status updates | +55 11 ZZZZ-ZZZZ |
| **Legal/Compliance** | Legal Counsel (external) | LGPD notifications, regulatory compliance | Email |

### On-Call Rotation

**Primary:** Security Analyst (weekly rotation)  
**Secondary:** CISO (backup, escalation after 15min)  
**Tertiary:** CTO (escalation after 30min para P0)

**PagerDuty Config:**
- Acknowledgement required < 5min (ou escala)
- Auto-escalation para secondary se não acknowledged

---

## 🔗 **Escalation Matrix**

### Internal Escalation

```
Security Incident Detected
  ↓
On-Call Security Analyst (PagerDuty)
  ├─ P3: Handle sozinho, update CISO (email)
  ├─ P2: Notify CISO (Slack), handle com guidance
  └─ P0/P1:
      ↓
      Convoke IRT (Incident Response Team)
      ├─ CISO (Incident Commander)
      ├─ DevOps Lead (Technical Lead)
      └─ CS Lead (Communications)
      ↓
      If P0 + Data Breach:
      ↓
      Notify CEO + Legal Counsel
      ↓
      LGPD notification (ANPD, data subjects)
```

---

### External Escalation

**Regulators (LGPD):**
- **ANPD (Autoridade Nacional de Proteção de Dados):** Notificar se data breach com risco aos titulares
- **Prazo:** 72 horas após descoberta (LGPD requirement)
- **Quem notifica:** DPO (Data Protection Officer) + Legal Counsel

**Law Enforcement:**
- **Polícia Federal (Cybercrime):** Se ataque criminal (ransomware, hacking)
- **Quando:** Decision do CEO + Legal Counsel
- **Contact:** Delegacia de Crimes Cibernéticos

**Vendors:**
- **AWS:** Se vulnerabilidade na AWS (support ticket)
- **Auth0, Stripe:** Se breach no vendor (support ticket + account manager)

**Clientes Enterprise:**
- **Serasa Experian:** Notificar se impacto em serviços contratuais (< 30min para P0)
- **Outros:** Conforme SLAs contratuais

---

## 📋 **Runbooks por Tipo de Incident**

### Runbook: DDoS Attack

**Detection:** CloudWatch alarm (High request rate), PagerDuty alert

**Containment (< 30min):**
1. Verificar AWS Shield dashboard (confirmar DDoS)
2. Ativar AWS Shield Advanced Response Team (se subscribed)
3. Update WAF rules (block malicious IPs/patterns)
4. Enable CloudFront caching agressivo (reduce origin load)
5. Notify customers (status page)

**Eradication:** N/A (attack externo, não há "remover")

**Recovery:**
- Monitor attack cessation
- Gradually remove emergency WAF rules (após 24h sem attack)
- Restore normal caching policies

**Post-Mortem:**
- Analyze attack vectors
- Improve WAF rules permanently
- Consider AWS Shield Advanced (se recurring)

**Last Tested:** Tabletop exercise (Sep 2025)

---

### Runbook: Ransomware Attack

**Detection:** Endpoint antivirus alert, user report (files encrypted), GuardDuty finding

**Containment (IMMEDIATE):**
1. **Isolar endpoint afetado:** Disconnect from network (WiFi + Ethernet)
2. **Revogar credenciais do usuário:** Auth0 disable user
3. **Snapshot VM (se cloud):** Preservar evidências
4. **Block malicious IPs/domains:** WAF, Security Groups
5. **Alert todos colaboradores:** Email + Slack (não abrir attachments suspeitos)

**Eradication (< 8h):**
1. Identify ransomware variant (file extensions, ransom note)
2. Check for decryption tools (nomoreransom.org)
3. Reimage infected machine (clean OS install)
4. Restore user data de backup (validated clean)
5. Audit all access keys, SSH keys (remove backdoors)

**Recovery:**
- Restore sistemas afetados de backup
- PITR database (se afetado)
- Smoke tests

**Post-Mortem:**
- Root cause (phishing email? vulnerable software?)
- Improve email filtering
- Security awareness training reforçado

**DO NOT PAY RANSOM** (policy: never pay, não garante recovery + financia crime)

---

### Runbook: Data Breach (Unauthorized Access)

**Detection:** GuardDuty finding, unusual access patterns (CloudWatch), user report

**Containment (< 30min):**
1. **Identify compromised account/system**
2. **Revoke access immediately:** Auth0 disable, IAM user delete, API key rotation
3. **Block source IPs:** Security Groups, WAF
4. **Preserve logs:** CloudTrail, application logs (for forensics)
5. **Assess data accessed:** Query audit logs (what data was viewed/exported?)

**Eradication (< 4h):**
1. Close vulnerability exploited (code fix, config change, patch)
2. Remove backdoors (audit all access)
3. Password resets (if credential compromise)

**Recovery:**
1. Validate systems secure
2. Monitor for recurrence (48h intensivo)

**LGPD Compliance (< 72h):**
1. **Assess risk to data subjects:** If PII accessed, likely high risk
2. **Notify ANPD:** Within 72h (DPO + Legal)
3. **Notify data subjects:** If high risk (email notifications)
4. **Offer remediation:** Credit monitoring, identity theft protection (if applicable)

**Post-Mortem:**
- How did attacker gain access?
- Improve access controls
- External pentest

---

## 📊 **Incident Metrics**

### KPIs

| Metric | Target | Q2 2025 | Status |
|--------|--------|---------|--------|
| **MTTD (Mean Time To Detect)** | < 15min | 12min | ✅ |
| **MTTR (Mean Time To Resolve)** | < SLA (varies) | 95% within SLA | ⚠️ (target: 100%) |
| **Post-Mortem Completion Rate** | 100% (P0/P1) | 100% (3/3) | ✅ |
| **Action Items Closure Rate** | 100% (30 days) | 88% | ⚠️ |
| **False Positive Rate** | < 10% | 8% | ✅ |

---

### Incident History (2025)

| Date | Type | Severity | MTTD | MTTR | Root Cause | Post-Mortem |
|------|------|----------|------|------|------------|-------------|
| 2025-08-15 | Phishing (clicked) | P2 | 10min | 1h 30min | Employee clicked malicious link | [Link](../incidents/2025-08-15-phishing.md) |
| 2025-05-22 | Brute-force (Auth0) | P2 | 5min | 45min | Automated attack, blocked by rate limiting | [Link](../incidents/2025-05-22-brute-force.md) |
| 2025-02-10 | Malware (laptop) | P1 | 20min | 2h 15min | Downloaded malicious software | [Link](../incidents/2025-02-10-malware.md) |

**Total:** 3 incidents  
**Data Breaches:** 0 ✅  
**Average MTTD:** 12min ✅  
**Average MTTR:** 1h 30min ✅

---

## 🔗 **Cross-References**

- [Information Security Policy](./information-security-policy.md)
- [Risk Assessment](./risk-assessment.md)
- [Crisis Management Plan](../business-continuity/crisis-management.md)
- [Security Controls (SOC2)](../soc2/security-controls.md)

---

## ✅ **Aprovação**

**Aprovado por:** CTO + CISO + CEO  
**Data:** 01 de Março de 2025  
**Próxima Revisão:** 01 de Março de 2026

---

**🔐 Classificação:** CONFIDENTIAL  
**📂 Retenção:** 7 anos

