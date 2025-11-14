# Template SOC2 Type II - Trust Services Criteria

*Template especializado para geração de documentação SOC2 Type II (AICPA Trust Services) focada em controles de segurança, disponibilidade e confidencialidade*

---

## Introdução ao SOC2 Type II

**SOC2 (Service Organization Control 2)** é um framework de auditoria desenvolvido pela AICPA (American Institute of CPAs) baseado nos Trust Services Criteria (TSC). Type II reports avaliam não apenas o design dos controles (como Type I), mas também sua efetividade operacional ao longo do tempo (mínimo 6 meses).

**Objetivo deste Template:**
Guiar a geração de documentação completa de controles SOC2 que atenda aos Trust Services Criteria e prepare a organização para auditoria SOC2 Type II.

**Aplicável para:**
- SaaS companies, fintechs, cloud providers
- Empresas B2B que lidam com dados de clientes
- Organizações que precisam demonstrar confiabilidade para clientes enterprise
- Resposta a requisitos de Due Diligence de clientes enterprise
- Preparação para auditoria SOC2 Type II

---

## 🎯 **Mapeamento Due Diligence Cliente Enterprise**

**CRÍTICO:** Este template mapeia **3 de 8 requisitos** típicos de solicitações de Due Diligence de clientes enterprise:

| # | Requisito Due Diligence | Documento SOC2 | Status |
|---|------------------|----------------|--------|
| 6 | Certificado/Relatório SOC2 | → Auditoria completa | 🔄 |
| 7 | Confirmação SLAs de Disponibilidade | `availability-controls.md` | ✅ |
| 8 | Documentação Contratual SLAs | `availability-controls.md` | ✅ |

**Cobertura Due Diligence (SOC2):** 3/3 requisitos SOC2 ✅

---

## Trust Services Criteria (TSC)

SOC2 é baseado em **5 Trust Services Principles:**

| Principle | Descrição | Aplicabilidade | Docs Gerados |
|-----------|-----------|----------------|--------------|
| **Security** | Proteção contra acesso não autorizado | Obrigatório (sempre) | ✅ 2 docs |
| **Availability** | Sistema disponível conforme acordado | Comum (SaaS/APIs) | ✅ 1 doc |
| **Confidentiality** | Informação confidencial protegida | Se lida com dados sensíveis | ✅ 1 doc |
| **Processing Integrity** | Processamento completo, preciso, autorizado | Se processamento crítico | ⏳ Opcional |
| **Privacy** | Informação pessoal coletada/usada conforme compromissos | Se lida com PII | ⏳ Opcional |

**Nota:** Este template foca em Security, Availability, Confidentiality (mais comuns). Processing Integrity e Privacy podem ser adicionados conforme necessidade.

---

## Documentos Obrigatórios (SOC2)

O specialist agent `@soc2-specialist` deve gerar **5 documentos principais**:

| # | Documento | Arquivo | TSC Principle | Requisito Due Diligence |
|---|-----------|---------|---------------|------------------|
| 1 | Trust Services Criteria Overview | `trust-services-criteria.md` | Todos | - |
| 2 | Security Controls | `security-controls.md` | Security | - |
| 3 | Availability Controls | `availability-controls.md` | Availability | ✅ Req #7, #8 |
| 4 | Confidentiality Controls | `confidentiality-controls.md` | Confidentiality | - |
| 5 | Evidence Collection Strategy | `evidence-collection.md` | Todos | - |

**Output Directory:** `docs/compliance/soc2/`

---

## 1. trust-services-criteria.md

### Objetivo
Documentar como a organização atende aos Trust Services Criteria da AICPA, fornecendo overview dos 5 princípios e quais são aplicáveis.

### Seções Obrigatórias

#### 1.1 Overview dos TSC (PT-BR + EN-US)
```markdown
# Trust Services Criteria (TSC) - [Nome da Empresa]

## Trust Services Principles

### TSC 1: Security (Segurança)
**Status:** ✅ Implementado  
**Escopo:** Toda infraestrutura e dados da empresa

**Descrição:**
Informação e sistemas são protegidos contra acesso não autorizado, uso não autorizado, divulgação, alteração ou destruição para atender aos compromissos da entidade.

**Principais Controles:**
- Multi-Factor Authentication (MFA) obrigatório
- Role-Based Access Control (RBAC)
- Encryption at rest (AES-256) e in transit (TLS 1.3)
- Security monitoring 24/7
- Incident response procedures

**Documentação:** `security-controls.md`

---

### TSC 2: Availability (Disponibilidade)
**Status:** ✅ Implementado  
**Escopo:** Serviços críticos de API e autenticação

**Descrição:**
Informação e sistemas estão disponíveis para operação e uso conforme comprometido ou acordado (SLAs).

**Principais Controles:**
- Multi-AZ deployment (AWS)
- Auto-scaling baseado em demanda
- Load balancing com health checks
- Disaster Recovery Plan (RTO: 2h, RPO: 1h)
- Uptime monitoring e alertas

**SLA Comprometido:** 99.9% uptime  
**Uptime Atual (Q2 2025):** 99.95%

**Documentação:** `availability-controls.md` + Mapeia Due Diligence Req #7, #8

---

### TSC 3: Confidentiality (Confidencialidade)
**Status:** ✅ Implementado  
**Escopo:** Dados de clientes classificados como confidenciais

**Descrição:**
Informação designada como confidencial é protegida conforme comprometido ou acordado.

**Principais Controles:**
- Data classification framework (4 níveis)
- Encryption de dados confidenciais (AES-256)
- Access controls (least privilege)
- DLP (Data Loss Prevention) policies
- Confidentiality agreements (NDAs)

**Dados Cobertos:**
- Customer PII (Personally Identifiable Information)
- Financial transaction data
- Authentication credentials
- Business secrets

**Documentação:** `confidentiality-controls.md`

---

### TSC 4: Processing Integrity
**Status:** ⏳ Planejado para Q3 2025  
**Escopo:** A definir

**Descrição:**
Processamento de sistemas é completo, válido, preciso, oportuno e autorizado para atender aos compromissos da entidade.

*Será implementado em fase futura se requerido por clientes/auditores.*

---

### TSC 5: Privacy
**Status:** ⏳ Planejado para Q4 2025 (LGPD compliance)  
**Escopo:** A definir

**Descrição:**
Informação pessoal é coletada, usada, retida, divulgada e destruída conforme compromissos da entidade e critérios estabelecidos no Princípio de Privacy da AICPA.

*Será implementado em fase futura alinhada com adequação LGPD.*
```

#### 1.2 SOC2 Control Environment (PT-BR)
```markdown
## Control Environment (Ambiente de Controle)

### Organização e Governança

#### Compliance Officer
**Nome:** [CISO - Nome Completo]  
**Responsabilidades:**
- Gerenciar programa SOC2
- Coordenar auditoria anual
- Monitorar efetividade de controles
- Reportar non-conformities para alta direção

#### Control Owners
| Controle | Owner | Revisor |
|----------|-------|---------|
| Security Controls | CISO | CTO |
| Availability Controls | DevOps Lead | CTO |
| Confidentiality Controls | CISO + Legal | CFO |

---

### Políticas e Procedimentos SOC2

| Política | Última Atualização | Próxima Revisão |
|----------|-------------------|-----------------|
| Information Security Policy | 2025-01-15 | 2026-01-15 |
| Access Control Policy | 2025-02-01 | 2026-02-01 |
| Incident Response Policy | 2024-12-10 | 2025-12-10 |
| Business Continuity Policy | 2025-03-01 | 2025-09-01 |
| Data Classification Policy | 2025-01-20 | 2026-01-20 |

---

### Risk Assessment Process

**Frequência:** Anual (Q4)  
**Última Execução:** 2024-12-15  
**Próxima Execução:** 2025-12-15

**Processo:**
1. Identificar riscos relacionados aos TSC
2. Avaliar impacto e probabilidade
3. Determinar controles mitigadores
4. Documentar riscos residuais
5. Aprovar com alta direção

**Documento:** `docs/compliance/security/risk-assessment.md` (ISO 27001)
```

---

## 2. security-controls.md

### Objetivo
Documentar controles de Security (TSC 1) implementados pela organização.

**Cross-Reference:** ~70% overlap com ISO 27001. Referenciar documentos ISO 27001 quando aplicável.

### Seções Obrigatórias

#### 2.1 Logical Access Controls (PT-BR + EN-US)
```markdown
# Security Controls (TSC 1 - Security)

## Logical Access Controls (Controles de Acesso Lógico)

### User Authentication
**Controle ID:** SEC-001  
**TSC Criteria:** CC6.1

**Implementação:**
- ✅ Multi-Factor Authentication (MFA) obrigatório para todos usuários
- ✅ Single Sign-On (SSO) via Auth0 / Okta
- ✅ Password policy: 12+ caracteres, complexidade alta
- ✅ Account lockout após 5 tentativas falhas

**Evidências:**
- Auth0 configuration screenshots
- MFA enrollment report (100% dos usuários)
- Password policy enforcement logs
- Audit logs de autenticações

**Teste de Controle:** Mensal (automated testing)  
**Última Execução:** 2025-05-28 ✅

---

### Role-Based Access Control (RBAC)
**Controle ID:** SEC-002  
**TSC Criteria:** CC6.2, CC6.3

**Implementação:**
- ✅ Roles definidos (Developer, DevOps, Admin, Support)
- ✅ Least privilege principle aplicado
- ✅ Access request/approval workflow (Jira)
- ✅ Quarterly access reviews (recertification)

**Evidências:**
- RBAC matrix documentation
- Access request tickets (samples)
- Quarterly access review reports
- Audit logs de mudanças de permissões

**Teste de Controle:** Trimestral (user access reviews)  
**Última Execução:** 2025-06-01 ✅

---

### Segregation of Duties
**Controle ID:** SEC-003  
**TSC Criteria:** CC6.3

**Implementação:**
- ✅ Desenvolvedores não têm acesso direto à produção
- ✅ Deploy requer aprovação de pessoa diferente de quem escreveu código
- ✅ Database changes requerem approval de DBA
- ✅ Admin access separado de dev access

**Evidências:**
- RBAC configuration mostrando segregação
- Git branch protection rules (require reviews)
- Production access logs (auditoria)

**Teste de Controle:** Anual (audit of segregation)
```

#### 2.2 System Operations (PT-BR)
```markdown
## System Operations

### Change Management
**Controle ID:** SEC-004  
**TSC Criteria:** CC8.1

**Implementação:**
- ✅ CI/CD pipeline com automated tests
- ✅ Peer review obrigatório (2 approvals)
- ✅ Staging environment para testes
- ✅ Rollback procedures documentados

**Evidências:**
- GitHub PR approval history
- CI/CD pipeline configurations
- Deployment logs (successful + failed)

---

### Security Monitoring
**Controle ID:** SEC-005  
**TSC Criteria:** CC7.2, CC7.3

**Implementação:**
- ✅ SIEM (CloudWatch + datadog)
- ✅ Alertas de segurança 24/7
- ✅ IDS/IPS (AWS GuardDuty)
- ✅ Log retention: 12 meses

**Evidências:**
- SIEM configuration e dashboards
- Alert history e response times
- GuardDuty findings e resoluções
- Log retention policy documentation
```

### Guidelines de Conteúdo
- **Idioma:** Security Controls (termo técnico), descrições em PT-BR
- **Cross-Reference:** Referenciar ISO 27001 quando aplicável (~70% overlap)
- **Evidências:** CRÍTICO para auditoria - coletar continuamente

---

## 3. availability-controls.md

### Objetivo
Documentar controles de Availability (TSC 2) e SLAs oferecidos aos clientes.

**Responde:** ✅ **Due Diligence Req #7** - "Confirmação dos SLAs de Disponibilidade"  
**Responde:** ✅ **Due Diligence Req #8** - "Documentação Contratual dos SLAs"

### Seções Obrigatórias

#### 3.1 SLA Commitments (PT-BR + EN-US)
```markdown
# Availability Controls (TSC 2 - Availability)

## Service Level Agreements (SLAs)

### SLA de Disponibilidade Comprometido

#### Produção APIs (Tier 1)
**Uptime SLA:** 99.9% (mensal)  
**Downtime Permitido:** 43.2 minutos/mês  
**Cobertura:** APIs core de integração

**Cálculo:**
```
Uptime % = (Total Minutos no Mês - Downtime) / Total Minutos no Mês × 100
```

**Exclusões (Downtime Justificável):**
- Manutenção agendada (notificada com 7 dias de antecedência)
- Force majeure (desastres naturais, ataques DDoS massivos)
- Issues causados por cliente (ex: limite de API excedido)

---

#### Serviços de Autenticação (Tier 1)
**Uptime SLA:** 99.95% (mensal)  
**Downtime Permitido:** 21.6 minutos/mês  
**Cobertura:** Login, SSO, token refresh

---

#### Dashboards e Analytics (Tier 2)
**Uptime SLA:** 99.5% (mensal)  
**Downtime Permitido:** 3.6 horas/mês  
**Cobertura:** BI tools, relatórios

---

### 📋 Confirmação de SLAs (Cliente Enterprise)

**CRÍTICO:** Resposta ao requisito Due Diligence #7

**Confirmação Formal:**
```
Data: 2025-06-03

Para: {{CLIENT_ENTERPRISE_CONTACT_EMAIL}}
De: [Nome da Empresa - CTO]

Assunto: Confirmação de Service Level Agreements (SLAs)

Prezados,

Confirmamos que os SLAs de disponibilidade oferecidos pela {{COMPANY_NAME}} atendem aos requisitos do cliente enterprise, conforme segue:

APIs de Integração Core:
- SLA: 99.9% uptime mensal
- Performance Atual (últimos 12 meses): 99.95% uptime
- Downtime Máximo: 43.2 minutos/mês
- Monitoramento: 24/7 com alertas automáticos

Serviços de Autenticação:
- SLA: 99.95% uptime mensal
- Performance Atual: 99.97% uptime
- Downtime Máximo: 21.6 minutos/mês

Evidências anexadas:
- Relatórios de uptime (últimos 12 meses)
- Status page histórico
- Incident reports

Atenciosamente,
[Nome CTO]
CTO - [Empresa]
```

**Documento:** `docs/compliance/due-diligence/{{CLIENT_ENTERPRISE_NAME}}-sla-confirmation.pdf`
```

#### 3.2 Availability Controls (PT-BR)
```markdown
## Controles de Disponibilidade Implementados

### High Availability Architecture
**Controle ID:** AVL-001  
**TSC Criteria:** A1.1

**Implementação:**
- ✅ Multi-AZ deployment (3 zonas de disponibilidade)
- ✅ Auto-scaling (min: 3 nodes, max: 20 nodes)
- ✅ Load balancing (ALB com health checks)
- ✅ Database replication (Multi-AZ RDS)

**Evidências:**
- AWS architecture diagrams
- Auto-scaling configurations
- Load balancer health check logs
- Database replication status

---

### Monitoring and Alerting
**Controle ID:** AVL-002  
**TSC Criteria:** A1.2

**Implementação:**
- ✅ Uptime monitoring (StatusCake, Pingdom)
- ✅ Performance monitoring (CloudWatch, Datadog)
- ✅ PagerDuty integration (on-call 24/7)
- ✅ Status page público (status.empresa.com)

**Alertas Configurados:**
- Uptime < 99.9% (alerta P1)
- Latency > 500ms (alerta P2)
- Error rate > 1% (alerta P1)
- CPU/Memory > 85% (alerta P2)

**Evidências:**
- Monitoring dashboards screenshots
- Alert history (triggered + resolved)
- PagerDuty on-call schedules
- Status page incident history

---

### Capacity Planning
**Controle ID:** AVL-003  
**TSC Criteria:** A1.3

**Implementação:**
- ✅ Quarterly capacity reviews
- ✅ Load testing antes de releases grandes
- ✅ Scaling thresholds documentados
- ✅ Budget aprovado para scaling

**Evidências:**
- Capacity planning reports (quarterly)
- Load test results
- Scaling event logs
- Budget approvals
```

#### 3.3 Documentação Contratual de SLAs (Due Diligence Req #8)
```markdown
## Documentação Contratual de SLAs

**CRÍTICO:** Resposta ao requisito Due Diligence #8

### Trecho do Contrato de Serviço

```
CLÁUSULA X - SERVICE LEVEL AGREEMENTS (SLAs)

X.1 Disponibilidade dos Serviços
O FORNECEDOR compromete-se a manter os Serviços disponíveis conforme os seguintes níveis:

a) APIs Core de Integração: 99.9% de uptime mensal
b) Serviços de Autenticação: 99.95% de uptime mensal
c) Dashboards e Relatórios: 99.5% de uptime mensal

X.2 Medição de Uptime
O uptime será calculado mensalmente considerando:
- Total de minutos no mês
- Subtraindo downtime não planejado
- Excluindo janelas de manutenção agendadas (máx 4h/mês, notificadas com 7 dias)

X.3 Penalidades por Não Cumprimento
Em caso de descumprimento dos SLAs:
- 99.0% - 99.9%: Crédito de 10% da mensalidade
- 98.0% - 99.0%: Crédito de 25% da mensalidade
- < 98.0%: Crédito de 50% da mensalidade

X.4 Reporte de Disponibilidade
O FORNECEDOR enviará mensalmente:
- Relatório de uptime (performance vs SLA)
- Detalhamento de incidentes (se houver)
- Medidas corretivas implementadas

X.5 Contato de Emergência
Para incidentes críticos:
- Email: crisis@empresa.com (24/7)
- Telefone: +55 11 XXXX-XXXX (on-call)
- Status page: https://status.empresa.com
```

**Documento Completo:** `docs/legal/contracts/service-agreement-sla-section.pdf`

**Assinatura:**
- Data: [Data do Contrato]
- FORNECEDOR: [Nome da Empresa - CTO]
- CLIENTE: {{CLIENT_ENTERPRISE_NAME}} - Representante Legal
```

### Guidelines de Conteúdo
- **Idioma:** Availability, SLA (termos técnicos), conteúdo em PT-BR
- **CRÍTICO:** Documentação contratual de SLAs é evidência chave
- **Atualização:** Mensal (relatórios de uptime)

---

## 4. confidentiality-controls.md

### Objetivo
Documentar controles de Confidentiality (TSC 3) para proteção de informações confidenciais.

### Seções Obrigatórias

#### 4.1 Data Classification (PT-BR + EN-US)
```markdown
# Confidentiality Controls (TSC 3 - Confidentiality)

## Data Classification Framework

**Controle ID:** CONF-001  
**TSC Criteria:** C1.1

### Níveis de Classificação

#### Nível 4: Confidencial (Confidential)
**Definição:** Informação sensível que causaria dano severo se exposta.

**Exemplos:**
- Customer PII (CPF, endereço, email)
- Payment card data (PCI-DSS scope)
- Authentication credentials (passwords, API keys)
- Financial transactions

**Controles Aplicados:**
- Encryption at rest (AES-256) e in transit (TLS 1.3)
- Access control (need-to-know, approved by CISO)
- MFA obrigatório para acesso
- Audit logging de todos acessos
- Data Loss Prevention (DLP) policies

---

### Data Encryption
**Controle ID:** CONF-002  
**TSC Criteria:** C1.2

**Implementação:**
- ✅ **At Rest:** AES-256 (AWS KMS managed keys)
- ✅ **In Transit:** TLS 1.3 (all APIs, database connections)
- ✅ **Backups:** Encrypted (same keys, separate bucket)
- ✅ **Key Rotation:** Annual (automated via KMS)

**Evidências:**
- AWS RDS encryption settings
- S3 bucket encryption configuration
- TLS certificate validations (SSL Labs)
- KMS key rotation logs

---

### Confidentiality Agreements
**Controle ID:** CONF-003  
**TSC Criteria:** C1.1

**Implementação:**
- ✅ NDAs assinados por todos colaboradores
- ✅ Data Processing Agreements (DPAs) com clientes
- ✅ Vendor confidentiality agreements (terceirizados)

**Evidências:**
- NDA signed copies (100% dos colaboradores)
- Customer DPAs (samples)
- Vendor agreements (samples)
```

### Guidelines de Conteúdo
- **Idioma:** Confidentiality (termo técnico), conteúdo em PT-BR
- **Cross-Reference:** Referenciar ISO 27001 Asset Management

---

## 5. evidence-collection.md

### Objetivo
Documentar estratégia de coleta de evidências para auditoria SOC2 Type II.

### Seções Obrigatórias

#### 5.1 Evidence Collection Strategy (PT-BR)
```markdown
# Evidence Collection Strategy (Estratégia de Coleta de Evidências)

## Evidências Requeridas por Controle

### Security Controls

| Controle | Evidência | Frequência | Responsável |
|----------|-----------|------------|-------------|
| MFA Enforcement | MFA enrollment report | Mensal | Security Team |
| Access Reviews | User access review reports | Trimestral | IT + Managers |
| Password Policy | Policy enforcement logs | Contínuo | IT |
| Change Management | GitHub PR history | Contínuo | DevOps |
| Security Monitoring | SIEM alert logs | Contínuo | Security |

### Availability Controls

| Controle | Evidência | Frequência | Responsável |
|----------|-----------|------------|-------------|
| Uptime Monitoring | Uptime reports (StatusCake) | Mensal | DevOps |
| Incident Management | Incident tickets + resolutions | Por incidente | DevOps |
| Capacity Planning | Capacity review reports | Trimestral | DevOps Lead |
| DR Testing | DR test reports | Anual | DevOps |

### Confidentiality Controls

| Controle | Evidência | Frequência | Responsável |
|----------|-----------|------------|-------------|
| Data Encryption | Encryption config screenshots | Anual | DevOps |
| Data Classification | Classification policy doc | Anual | CISO |
| NDAs | Signed NDA copies | Por colaborador | HR |

---

## Evidence Repository

**Localização:** `s3://soc2-evidence-[empresa]/`

**Estrutura:**
```
soc2-evidence/
├── 2025/
│   ├── Q1/
│   │   ├── security/
│   │   │   ├── mfa-enrollment-2025-03.pdf
│   │   │   ├── access-review-2025-03.pdf
│   │   ├── availability/
│   │   │   ├── uptime-report-2025-01.pdf
│   │   │   ├── uptime-report-2025-02.pdf
│   │   └── confidentiality/
│   │       ├── encryption-config-2025-01.png
│   ├── Q2/
│   └── ...
```

**Retenção:** 7 anos (compliance requirement)

---

## Auditoria SOC2 Timeline

### Preparação (6 meses antes)
- [ ] Revisar todos controles SOC2
- [ ] Coletar evidências retroativas (6-12 meses)
- [ ] Corrigir gaps identificados
- [ ] Treinar stakeholders

### Auditoria (2-3 meses)
- [ ] Auditores revisam evidências
- [ ] Entrevistas com control owners
- [ ] Testes de controles
- [ ] Identificação de issues

### Finalização (1 mês)
- [ ] Corrigir issues identificados
- [ ] Revisar draft report
- [ ] Obter SOC2 Type II report final
- [ ] Compartilhar com clientes/prospects
```

### Guidelines de Conteúdo
- **Idioma:** Evidence Collection (termo técnico), procedimentos em PT-BR
- **CRÍTICO:** Coleta contínua de evidências (não esperar auditoria)

---

## Cross-References com Outros Frameworks

### SOC2 ↔ ISO 27001 (~70% Overlap)
- SOC2 Security ≈ ISO 27001 SGSI
- SOC2 Logical Access ≈ ISO 27001 Access Control
- **Estratégia:** Documentos ISO 27001 servem como evidência base para SOC2

### SOC2 ↔ ISO 22301
- SOC2 Availability ≈ ISO 22301 Business Continuity
- **Estratégia:** RTOs/RPOs de ISO 22301 suportam SOC2 Availability

---

## Certification Readiness Checklist (SOC2 Type II)

Para preparação para auditoria SOC2 Type II:

- [ ] Todos 5 documentos SOC2 criados
- [ ] Controles Security implementados e testados
- [ ] Controles Availability implementados (SLAs monitorados)
- [ ] Controles Confidentiality implementados (encryption, NDAs)
- [ ] Evidências coletadas por 6+ meses
- [ ] Risk assessment SOC2-specific realizado
- [ ] Control testing executado (samples)
- [ ] Non-conformities corrigidas
- [ ] Management review conduzida
- [ ] Auditor SOC2 selecionado (Big 4 recommended)

---

**Última Atualização do Template:** 2025-06-03  
**Versão:** 1.0 (SOC2 Type II - AICPA TSC 2017)  
**Mantido por:** @soc2-specialist  
**CRÍTICO:** ✅ Mapeia 3/3 requisitos SOC2 típicos de Due Diligence enterprise

