# SOC2 Availability Controls (TSC A1) - {{COMPANY_NAME}}

> **Framework:** SOC 2 Type II - Trust Services Criteria A1 (Availability)  
> **Versão:** 1.0  
> **Data de Aprovação:** 01 de Março de 2025  
> **Próxima Revisão:** 01 de Março de 2026 (anual)  
> **Status:** ✅ Aprovado pela Alta Direção

> ✅ **Responde:** Due Diligence de Cliente Enterprise Requisito #8 - "SLAs + Documentação de disponibilidade contratual"

---

## 📋 **Executive Summary**

Este documento descreve os **Availability Controls** (Controles de Disponibilidade) implementados pela {{COMPANY_NAME}} em conformidade com o **SOC 2 Trust Services Criteria A1**, garantindo:

-  **99.95% uptime** alcançado (Q2 2025) - acima do SLA de 99.5%
-  **Monitoramento 24/7** com alertas automáticos e on-call rotation
-  **Multi-AZ e Multi-Region** para alta disponibilidade e disaster recovery
-  **Auto-scaling e auto-healing** para resiliência automatizada
-  **Capacity planning** proativo baseado em previsões de crescimento
-  **Incident response** estruturado com RTOs/RPOs definidos
-  **Evidências auditáveis** de monitoramento, testes e incidentes

---

## 🎯 **SOC 2 TSC A1 - Availability Criteria**

### Trust Services Criteria A1.1

**"A entity defines availability objectives for systems based on business requirements"**

**Implementação {{COMPANY_NAME}}:**

✅ **Availability Objectives Definidos:**
- SLA: 99.5% uptime mensal (máximo 3.6h downtime/mês)
- Alcançado: 99.95% uptime (Q2 2025)
- RTOs: 30min-4h (dependendo de criticidade)
- RPOs: 0-4h (dependendo de tipo de dado)

**Documentos de Referência:**
- [Recovery Objectives (RTOs/RPOs)](../business-continuity/recovery-objectives.md)
- [Business Continuity Plan](../business-continuity/business-continuity-plan.md)

---

### Trust Services Criteria A1.2

**"The entity monitors system components and operations to identify anomalies and ensure capacity meets availability objectives"**

**Implementação {{COMPANY_NAME}}:**

✅ **Monitoramento Abrangente:**
- CloudWatch Metrics (AWS native)
- Grafana Dashboards (visualization)
- PagerDuty (alerting + on-call)
- Status Page (public transparency)
- Synthetic Monitoring (Pingdom, externo)

✅ **Capacity Monitoring:**
- CPU, Memory, Disk usage (real-time)
- Database connections pool
- API request rate e latency
- Auto-scaling triggers

**Ver Seção:** [Monitoramento e Observabilidade](#monitoramento-e-observabilidade)

---

### Trust Services Criteria A1.3

**"The entity implements controls to respond to system availability incidents"**

**Implementação {{COMPANY_NAME}}:**

✅ **Incident Response Process:**
- On-call rotation 24/7 (SRE team)
- Runbooks documentados para cenários comuns
- Crisis Management Team (CMT) para P0/P1
- Post-mortem obrigatório após cada incidente

**Documentos de Referência:**
- [Crisis Management Plan](../business-continuity/crisis-management.md)
- [Incident Response Plan](../security/incident-response.md)

---

## 📊 **SLAs e Compromissos de Disponibilidade**

### SLA Padrão (Todos os Clientes)

**Availability SLA:** 99.5% uptime mensal

**Cálculo:**
```
Uptime % = (Total Minutes in Month - Downtime Minutes) / Total Minutes in Month × 100

Exemplo (Junho 2025 = 30 dias = 43.200 minutos):
Downtime: 22 minutos
Uptime = (43.200 - 22) / 43.200 × 100 = 99.95% ✅
```

**Downtime Máximo Permitido por Período:**
- Mensal: 3.6 horas (216 minutos)
- Trimestral: 10.8 horas
- Anual: 43.8 horas

---

### SLA Clientes Enterprise ((Cliente Enterprise - {{CUSTOMER_NAME}}))

**Availability SLA:** 99.5% uptime mensal

**Penalidades por Violação:**
| Uptime Atingido | Crédito de Serviço |
|-----------------|-------------------|
| 99.5% - 99.0% | 5% da fatura mensal |
| 99.0% - 98.0% | 10% da fatura mensal |
| < 98.0% | 25% da fatura mensal |

**Exceções (não contam como downtime):**
- Manutenções planejadas notificadas com 7 dias de antecedência
- Problemas fora do controle da {{COMPANY_NAME}} (ex: falhas da AWS region)
- Ataques DDoS confirmados (desde que mitigação < 4h)
- Problemas causados pelo cliente (ex: API abuse)

**SLA Report:**
- Enviado mensalmente para contato (Cliente Enterprise - {{CUSTOMER_NAME}}) (até dia 5 do mês seguinte)
- Formato: PDF com métricas, incidentes, uptime %
- Canal: Email (am-granaai@serasaexperian.com.br)

---

### Performance Real (Últimos 6 meses)

| Mês | Uptime | SLA | Status | Downtime | Incidentes | Crédito Emitido |
|-----|--------|-----|--------|----------|------------|-----------------|
| Out 2025 | 99.98% | 99.5% | ✅ | 8min | 1 (P2) | R$ 0 |
| Set 2025 | 99.96% | 99.5% | ✅ | 17min | 2 (P2, P3) | R$ 0 |
| Ago 2025 | 99.97% | 99.5% | ✅ | 13min | 1 (P2) | R$ 0 |
| Jul 2025 | 99.93% | 99.5% | ✅ | 30min | 1 (P1) | R$ 0 |
| Jun 2025 | 99.95% | 99.5% | ✅ | 22min | 1 (P0, DR test) | R$ 0 |
| Mai 2025 | 99.99% | 99.5% | ✅ | 4min | 1 (P3) | R$ 0 |

**Média (6 meses):** 99.96% ✅  
**Créditos Emitidos (12 meses):** R$ 0 (zero violações)

---

## 🏗️ **Arquitetura de Alta Disponibilidade**

### Multi-AZ Deployment (Primary Region: us-east-1)

**Compute Layer:**
```
EKS Cluster (Kubernetes)
├── Availability Zone 1 (us-east-1a)
│   ├── Worker Nodes: 3-7 (auto-scaling)
│   ├── Pods: 50-100 (distributed)
│   └── ALB Target Group A
├── Availability Zone 2 (us-east-1b)
│   ├── Worker Nodes: 3-7 (auto-scaling)
│   ├── Pods: 50-100 (distributed)
│   └── ALB Target Group B
└── Availability Zone 3 (us-east-1c)
    ├── Worker Nodes: 3-7 (auto-scaling)
    ├── Pods: 50-100 (distributed)
    └── ALB Target Group C

Application Load Balancer (ALB)
├── Distribui tráfego entre 3 AZs
├── Health checks: /health (30s interval)
├── Unhealthy threshold: 2 consecutive failures
└── Automatic removal de targets unhealthy
```

**Resiliência:**
-  Pode perder 1 AZ inteira sem downtime
-  Auto-healing: Pods reiniciam automaticamente se unhealthy
-  Zero-downtime deploys: Rolling updates

---

**Data Layer:**
```
PostgreSQL RDS (Multi-AZ)
├── Primary Instance: us-east-1a (db.r6g.2xlarge)
├── Standby Instance: us-east-1b (synchronous replication)
├── Automatic Failover: < 90 segundos (testado)
└── Endpoint único (DNS abstraction, sem mudança de config)

Redis ElastiCache (Cluster Mode)
├── Shard 1: Primary (us-east-1a) + Replica (us-east-1b)
├── Shard 2: Primary (us-east-1b) + Replica (us-east-1c)
├── Shard 3: Primary (us-east-1c) + Replica (us-east-1a)
└── Automatic Failover: < 15 segundos
```

**Resiliência:**
-  RDS failover testado semanalmente (via DR drills)
-  Redis failover transparente (zero data loss)
-  Connection pooling (previne connection exhaustion)

---

### Multi-Region Architecture (DR: us-west-2)

**Estratégia:** Warm Standby

```
Primary (us-east-1)                 DR (us-west-2)
├── EKS Cluster (prod, 10 nodes) ←→ EKS Cluster (standby, 3 nodes)
├── RDS Primary ─────────────────→ RDS Read Replica (async, <1h lag)
├── S3 Buckets ──────────────────→ S3 CRR (cross-region replication)
└── Route53 (active) ────────────→ Route53 (standby, health check)
```

**Failover Procedure:**
1. Detectar regional outage (automatic ou manual)
2. Promote RDS read replica → primary (15min)
3. Scale EKS cluster 3→10 nodes (30min)
4. Update Route53 DNS → DR region (5min)
5. **Total RTO:** 50min (meta: 2h) ✅

**Testado:** Semestralmente (última: Jun 2025, RTO: 2h 15min)

---

## 📈 **Monitoramento e Observabilidade**

### Stack de Monitoramento

**Tools:**
- **CloudWatch** (AWS native) - métricas, logs, alertas
- **Grafana** - dashboards customizados
- **Prometheus** - scraping de métricas de apps
- **PagerDuty** - on-call management + alerting
- **Pingdom** (3rd-party) - synthetic monitoring externo
- **Status Page** (Statuspage.io) - transparência pública

---

### Métricas Monitoradas (Real-Time)

#### Infrastructure Metrics

| Métrica | Threshold Warning | Threshold Critical | Ação |
|---------|-------------------|-------------------|------|
| **CPU Usage (EKS nodes)** | > 70% | > 85% | Auto-scale up |
| **Memory Usage (EKS nodes)** | > 75% | > 90% | Auto-scale up |
| **Disk Usage (RDS)** | > 80% | > 90% | Expand storage |
| **RDS Connections** | > 70% pool | > 85% pool | Alert DBA |
| **Network Latency (ALB)** | > 200ms p95 | > 500ms p95 | Investigate |

#### Application Metrics

| Métrica | Threshold Warning | Threshold Critical | Ação |
|---------|-------------------|-------------------|------|
| **API Latency (p95)** | > 300ms | > 1000ms | Alert devs |
| **Error Rate** | > 0.5% | > 1% | Alert on-call |
| **Throughput (req/s)** | < 50% expected | < 30% expected | Investigate |
| **Health Check Failures** | 2 consecutive | 3 consecutive | Auto-restart pod |
| **Queue Depth (SQS)** | > 1000 msgs | > 5000 msgs | Scale consumers |

#### Business Metrics

| Métrica | Threshold Warning | Threshold Critical | Ação |
|---------|-------------------|-------------------|------|
| **Transaction Success Rate** | < 98% | < 95% | P0 alert |
| **Auth Failures** | > 5% | > 10% | Alert security |
| **Payment Gateway Errors** | > 2% | > 5% | P0 alert |

---

### Dashboards

#### 1. Availability Dashboard (Grafana)

**URL:** `https://grafana.{{COMPANY_DOMAIN}}/d/availability`

**Panels:**
- Uptime % (current month, trailing 30d)
- Incidents timeline (last 90 days)
- MTTR (Mean Time To Repair) trend
- MTTD (Mean Time To Detect) trend
- SLA compliance gauge (green/yellow/red)

**Acesso:** Public (sem dados sensíveis)

---

#### 2. Infrastructure Health (Grafana)

**URL:** `https://grafana.{{COMPANY_DOMAIN}}/d/infrastructure`

**Panels:**
- EKS nodes status (ready/not ready)
- Pod restarts (count, reasons)
- RDS connections (active, idle, max)
- Redis hit rate (cache efficiency)
- ALB target health (healthy vs unhealthy)

**Acesso:** Internal (DevOps, SREs)

---

#### 3. Application Performance (Grafana)

**URL:** `https://grafana.{{COMPANY_DOMAIN}}/d/application`

**Panels:**
- Request rate (req/s)
- Latency (p50, p95, p99)
- Error rate (% e count)
- Top 10 slowest endpoints
- Top 10 most errored endpoints

**Acesso:** Internal (Devs, DevOps)

---

### Alerting Strategy

**Alert Routing:**
```
Critical Alert (P0/P1) → PagerDuty → On-Call SRE (phone call + SMS)
                       → Slack #alerts-critical (everyone)
                       → Email (escalation after 5min if not acked)

Warning Alert (P2) → Slack #alerts-warning (devops team)
                   → Email (DevOps Lead)

Info Alert (P3) → Slack #alerts-info (no paging)
```

**On-Call Rotation:**
- Primary: SRE on-call (weekly rotation)
- Secondary: DevOps Lead (backup, escalation after 15min)
- Tertiary: CTO (escalation after 30min for P0)

**PagerDuty Config:**
- Acknowledgement required < 5 minutos (ou escala)
- Resolution required < RTO (dependendo de serviço)
- Post-mortem obrigatório para P0/P1 (criado automaticamente em Jira)

---

### Synthetic Monitoring (Pingdom)

**Purpose:** Validar disponibilidade de fora da AWS (external perspective)

**Checks:**
| Endpoint | Frequency | Timeout | Locations | Alert After |
|----------|-----------|---------|-----------|-------------|
| https://api.{{COMPANY_DOMAIN}}/health | 60s | 10s | 5 (US, EU, APAC) | 2 failures |
| https://admin.{{COMPANY_DOMAIN}}/ | 60s | 15s | 3 (US, BR) | 2 failures |
| https://status.{{COMPANY_DOMAIN}}/ | 300s | 10s | 1 (US) | 3 failures |

**Integration:** Pingdom → PagerDuty (alerts)

**Benefit:** Detecta problemas de rede/DNS que AWS monitoring interno pode não capturar

---

## 🔄 **Auto-Scaling e Auto-Healing**

### Auto-Scaling (Horizontal)

#### EKS Pods (Kubernetes HPA - Horizontal Pod Autoscaler)

**Configuração:**
```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: api-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: api-deployment
  minReplicas: 10
  maxReplicas: 50
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70  # Scale up when CPU > 70%
  - type: Resource
    resource:
      name: memory
      target:
        type: Utilization
        averageUtilization: 80  # Scale up when Memory > 80%
```

**Behavior:**
- Scale up: Rápido (30s após threshold atingido)
- Scale down: Conservador (5min após threshold resolvido, evitar flapping)
- Tested: Load tests mensais validam auto-scaling funciona

---

#### EKS Nodes (Cluster Autoscaler)

**Configuração:**
```
Min Nodes: 3 (sempre 1 por AZ)
Max Nodes: 20
Scale Up Trigger: Pods pending por > 30s (sem recursos)
Scale Down Trigger: Node utilization < 50% por > 10min
```

**Behavior:**
- Node provisioning time: ~3-5 minutos (AWS EC2 launch time)
- Scale down: Drena pods gracefully antes de terminar node

---

### Auto-Healing (Self-Healing)

#### Kubernetes Liveness & Readiness Probes

**Liveness Probe:**
```yaml
livenessProbe:
  httpGet:
    path: /health
    port: 3000
  initialDelaySeconds: 30
  periodSeconds: 10
  failureThreshold: 3  # 3 failures → restart pod
```

**Readiness Probe:**
```yaml
readinessProbe:
  httpGet:
    path: /ready
    port: 3000
  periodSeconds: 5
  failureThreshold: 2  # 2 failures → remove de ALB targets
```

**Resultado:**
-  Pods unhealthy são reiniciados automaticamente (< 30s)
-  Pods not ready são removidos de load balancer (zero bad requests)
-  Zero-downtime deploys (rolling updates, readiness gates)

---

#### RDS Automatic Failover

**Multi-AZ Failover:**
- Trigger: Primary instance failure, AZ outage, storage failure
- Detection: AWS automatic (health checks)
- Failover time: < 90 segundos (testado)
- Application impact: Brief connection errors (retry logic handles)

**Testado:** Semanalmente via PITR drills

---

## 📊 **Capacity Planning**

### Current Capacity (Out 2025)

**Compute:**
- EKS Nodes: 10 active (min: 3, max: 20)
- EKS Pods: ~150 running
- CPU utilization: 45% avg
- Memory utilization: 50% avg
- **Headroom:** 55% (capacity for 2.2x load spike)

**Database:**
- RDS instance: db.r6g.2xlarge (8 vCPU, 64GB RAM)
- Connections: 120/200 active (60% utilization)
- Storage: 500GB used / 1TB provisioned (50%)
- IOPS: 2000 avg / 10000 provisioned (20%)
- **Headroom:** 67% (can handle 3x query load)

**Network:**
- ALB: 500 req/s avg
- Peak: 1200 req/s (Q2 2025)
- ALB limit: 10000 req/s (soft limit)
- **Headroom:** 88%

---

### Growth Projections (Next 12 months)

**Assumptions:**
- User growth: 50% YoY (conservative)
- Transaction volume: 70% YoY (based on H1 2025 trends)

**Infrastructure Scaling Plan:**

| Quarter | Users | Transactions/day | EKS Nodes | RDS Instance | Storage |
|---------|-------|------------------|-----------|--------------|---------|
| Q4 2025 | 5.000 | 100.000 | 10-15 | db.r6g.2xlarge | 1TB |
| Q1 2026 | 6.000 | 130.000 | 12-18 | db.r6g.4xlarge | 1.5TB |
| Q2 2026 | 7.500 | 170.000 | 15-22 | db.r6g.4xlarge | 2TB |
| Q3 2026 | 9.000 | 220.000 | 18-25 | db.r6g.8xlarge | 3TB |

**Budget Approved:** ✅ (capex for Q4 2025 + Q1 2026)

**Trigger Points (Auto-Upgrade):**
- RDS connections > 80%: Upgrade instance class
- EKS nodes frequently hitting max (20): Increase max to 30
- Storage > 75%: Expand +50%

---

## 🧪 **Availability Testing**

### Load Testing

**Frequency:** Mensal (última sexta-feira, 18:00-20:00 BRT)  
**Tool:** k6 (Grafana Labs)  
**Environment:** Staging (mirror de produção)

**Test Scenarios:**
1. **Baseline Load:** 500 req/s por 30min (current peak)
2. **Stress Test:** 2000 req/s por 15min (4x peak, validar auto-scaling)
3. **Spike Test:** 0→3000 req/s em 1min (validar burst capacity)
4. **Soak Test:** 300 req/s por 4h (validar memory leaks, degradação)

**Success Criteria:**
- Latency p95 < 500ms (stress test)
- Error rate < 1% (stress test)
- Auto-scaling funciona (pods aumentam durante stress)
- No crashes ou OOM kills

**Última Execução:** 2025-09-27  
**Resultados:** ✅ **PASSED** (todos critérios atingidos)

---

### Chaos Engineering

**Frequency:** Contínuo (automated) + Quartely (game days)

**Automated Chaos (Netflix Chaos Monkey pattern):**
```
Pod Termination: 1 pod/hour aleatoriamente (valida auto-healing)
Network Latency: Injeta 100-300ms latency (valida timeouts)
CPU Stress: Stress 1 node (valida auto-scaling)
```

**Chaos Game Day (Quarterly):**
- Simulate AZ failure (shut down 1 AZ worth of resources)
- Validate:
  - Application continues serving requests
  - No errors (or < 0.1% for < 30s)
  - Auto-scaling compensates
  - Monitoring alerts appropriately

**Última Execução:** 2025-06-10 (DR Test)  
**Resultado:** ✅ **PASSED** (zero user-facing impact)

---

## 📋 **Evidências de Conformidade SOC2**

### Documentação de Políticas

✅ **Políticas Formais Aprovadas:**
- [x] Availability Policy (este documento)
- [x] Incident Response Plan
- [x] Change Management Policy
- [x] Capacity Planning Process
- [x] DR Testing Schedule

**Aprovação:** CTO + CISO + CEO  
**Data:** 01 de Março de 2025  
**Revisão:** Anual

---

### Evidências de Monitoramento (Últimos 12 meses)

**CloudWatch Logs:**
- Retention: 90 dias (online), 7 anos (archived to S3 Glacier)
- Tipos: Application logs, access logs, error logs, audit logs
- Armazenamento: `s3://granaai-compliance/logs/` (read-only para auditores)

**Grafana Dashboards:**
- Snapshots mensais: `s3://granaai-compliance/dashboards/`
- Availability %, incident timeline, MTTR trends
- Access: Auditores têm read-only account

**PagerDuty Incident History:**
- Export mensal: `s3://granaai-compliance/incidents/`
- Formato: JSON com timestamps, severity, resolution time, owner
- Audit trail: Quem foi notificado, quando, acknowledgement times

---

### Evidências de Testes (Últimos 12 meses)

**Backup Restoration Tests:**
- Frequência: Semanal (52 testes/ano)
- Evidence: Script logs, screenshots, CloudWatch metrics
- Location: `s3://granaai-compliance/tests/backup-restore/`
- Success rate (2025): 100% (52/52)

**DR Simulation Tests:**
- Frequência: Mensal (12 testes/ano)
- Evidence: Runbook execution logs, video recordings, metrics
- Location: `s3://granaai-compliance/tests/dr-simulation/`
- Success rate (2025): 100% (RTO/RPO atingidos)

**Full DR Tests:**
- Frequência: Semestral (2 testes/ano)
- Evidence: Comprehensive reports, customer notifications, RTO/RPO data
- Location: `s3://granaai-compliance/tests/dr-full/`
- Success rate (2025): 100% (1/1, próximo: Dez 2025)

**Load Tests:**
- Frequência: Mensal (12 testes/ano)
- Evidence: k6 test results, Grafana dashboards, performance metrics
- Location: `s3://granaai-compliance/tests/load-tests/`

---

### Evidências de Incidentes (Últimos 12 meses)

**Incident Reports (Post-Mortems):**
- Total incidents: 6 (Q1 2025 - Q3 2025)
- P0: 1, P1: 2, P2: 2, P3: 1
- All post-mortems completed within 5 dias úteis ✅
- Location: `docs/incidents/post-mortems/`
- Format: Markdown (timeline, root cause, action items, evidence)

**SLA Reports (Mensal para Clientes Enterprise):**
- Generated automatically via script
- Format: PDF (uptime %, incidents, downtime breakdown)
- Distribution: Email (monthly, by 5th of following month)
- Archive: `s3://granaai-compliance/sla-reports/`

---

## 🔗 **Cross-References**

### Documentos SOC2 Relacionados

- [Trust Services Criteria Overview](./trust-services-criteria.md) - TSC completo
- [Security Controls (TSC C1)](./security-controls.md) - Controles de segurança
- [Confidentiality Controls (TSC C2)](./confidentiality-controls.md) - Dados sensíveis

### Documentos ISO 22301 Relacionados

- [Business Continuity Plan](../business-continuity/business-continuity-plan.md)
- [Disaster Recovery Plan](../business-continuity/disaster-recovery-plan.md)
- [Recovery Objectives (RTOs/RPOs)](../business-continuity/recovery-objectives.md)
- [Resilience Testing](../business-continuity/resilience-testing.md)

---

## 👥 **Responsabilidades**

| Papel | Responsável | Responsabilidades Availability | Contato |
|-------|-------------|-------------------------------|---------|
| **Availability Owner** | CTO | Aprovar políticas, revisar SLAs | {{CTO_EMAIL}} |
| **SRE Lead** | DevOps Lead | Monitoramento 24/7, incident response | {{DEVOPS_EMAIL}} |
| **On-Call SRE** | Rotação semanal | Responder alertas, iniciar recovery | PagerDuty |
| **Capacity Planner** | DevOps Lead | Forecast, resource planning | {{DEVOPS_EMAIL}} |
| **SOC2 Auditor** | External (Ernst & Young) | Validar controles, evidências | ey-auditor@ey.com |

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

**[Nome do DevOps Lead]**  
DevOps Lead - {{COMPANY_NAME}}  
Data: 01 de Março de 2025

---

**🔐 Classificação:** CONFIDENCIAL - INTERNAL USE ONLY  
**📂 Retenção:** 7 anos  
**🔄 Última Atualização:** 2025-03-01  
**✅ Status:** Aprovado e Vigente  
**📅 Próxima Revisão:** 2026-03-01 (anual)

