---
title: "Política de Backup e Restauração"
document_type: "Política Corporativa"
classification: "CONFIDENCIAL - USO INTERNO"
version: "1.0"
date: "[DATA]"
owner: "[CTO/CISO]"
review_frequency: "Anual"
iso_compliance: "ISO 27001:2022, ISO 22301:2019"
soc2_compliance: "CC6.1, A1.2"
---

# Política de Backup e Restauração

## 📋 Controle de Versão

| Versão | Data | Autor | Descrição | Aprovador |
|--------|------|-------|-----------|-----------|
| 1.0 | [DATA] | [NOME - CTO/CISO] | Versão inicial da política | [NOME - CEO] |

---

## 📄 1. Objetivo e Escopo

### 1.1 Objetivo

Esta política estabelece as diretrizes, responsabilidades e procedimentos para **backup e restauração** de dados e sistemas da **[NOME DA EMPRESA]**, garantindo:

1. **Disponibilidade:** Capacidade de restaurar dados e sistemas após incidentes
2. **Integridade:** Garantia de que backups são confiáveis e não corrompidos
3. **Conformidade:** Atendimento a requisitos regulatórios (ISO 27001, ISO 22301, SOC 2, LGPD)
4. **Recuperação:** Cumprimento de RTOs e RPOs contratuais com clientes enterprise

### 1.2 Escopo

**Aplicável a:**
-  Todos os sistemas de produção da [NOME DA EMPRESA]
-  Bancos de dados transacionais (PostgreSQL, MySQL)
-  Aplicações backend (APIs, microserviços)
-  Configurações de infraestrutura (AWS configs, ECS task definitions)
-  Secrets e credenciais (cofres criptografados)
-  Dados de clientes (incluindo dados de Serasa Experian)
-  Código-fonte (repositórios Git)
-  Documentação crítica

**Não aplicável a:**
- ❌ Dados temporários/cache (Redis, Memcached)
- ❌ Logs de debug (retidos apenas 30 dias)
- ❌ Ambientes de desenvolvimento local (responsabilidade do desenvolvedor)

### 1.3 Público-Alvo

- **CTO/CISO:** Aprovação e revisão anual da política
- **DevOps/SRE:** Implementação e execução de backups
- **DBAs:** Backups de bancos de dados
- **Desenvolvedores:** Conhecimento dos procedimentos (para restauração)
- **Compliance:** Auditoria e evidências

---

## 👥 2. Responsabilidades (Matriz RACI)

| Atividade | CTO/CISO | DevOps Lead | DBA | Desenvolvedores | Compliance |
|-----------|----------|-------------|-----|-----------------|------------|
| **Aprovar política** | A | C | C | I | I |
| **Implementar backups automatizados** | R | A | R (DBs) | I | I |
| **Monitorar sucesso de backups** | I | R | R (DBs) | I | C |
| **Executar testes de restauração** | A | R | R (DBs) | C | I |
| **Responder a falhas de backup** | I | R | R (DBs) | I | I |
| **Restaurar dados (em produção)** | A | R | R (DBs) | C | I |
| **Auditar conformidade** | C | I | I | I | R/A |
| **Revisar política (anual)** | A/R | C | C | I | C |

**Legenda:**
- **R (Responsible):** Executa a atividade
- **A (Accountable):** Aprova e é responsável final
- **C (Consulted):** Consultado antes da decisão
- **I (Informed):** Informado após a decisão

---

## 🗂️ 3. Classificação de Dados e Criticidade

### 3.1 Tiers de Criticidade

Os dados e sistemas são classificados em **3 tiers** baseados em impacto ao negócio:

| Tier | Descrição | RTO | RPO | Frequência Backup | Retenção | Exemplos |
|------|-----------|-----|-----|-------------------|----------|----------|
| **Tier 1 - Crítico** | Dados vitais para operação; perda causa impacto severo | ≤ 1 hora | ≤ 15 min | Contínuo (streaming) + Snapshots a cada 15 min | 30 dias (diário) + 12 meses (semanal) | • BD Transacional<br/>• APIs de produção<br/>• Dados Serasa<br/>• Autenticação |
| **Tier 2 - Importante** | Dados importantes mas não críticos; perda causa impacto moderado | ≤ 4 horas | ≤ 1 hora | Snapshots a cada 1 hora | 14 dias (diário) + 6 meses (semanal) | • Logs de aplicação<br/>• Métricas/Dashboards<br/>• Admin Panel<br/>• Docs técnicas |
| **Tier 3 - Normal** | Dados de baixa criticidade; perda causa impacto mínimo | ≤ 24 horas | ≤ 4 horas | Snapshot diário | 7 dias | • Staging/QA<br/>• Sandbox<br/>• Dados de teste |

### 3.2 Mapeamento de Sistemas por Tier

#### Tier 1 - Crítico

| Sistema/Serviço | Tipo | RPO | RTO | Justificativa |
|-----------------|------|-----|-----|---------------|
| **PostgreSQL RDS - Produção** | Banco de Dados | 15 min | 1 hora | Dados transacionais de clientes (incluindo Serasa) |
| **API Gateway (Kong)** | Aplicação | 15 min | 1 hora | Ponto de entrada para todas as APIs |
| **Keycloak (Autenticação)** | Aplicação | 30 min | 1 hora | Autenticação de usuários e serviços |
| **Backend APIs (EKS)** | Aplicação | 15 min | 1 hora | Lógica de negócio principal |
| **Secrets (AWS Secrets Manager)** | Configuração | 1 hora | 1 hora | Credenciais sensíveis |
| **AWS Config** | IaC configs | 1 hora | 4 horas | Configurações da infraestrutura |

#### Tier 2 - Importante

| Sistema/Serviço | Tipo | RPO | RTO | Justificativa |
|-----------------|------|-----|-----|---------------|
| **Elasticsearch (Logs)** | Logs | 1 hora | 4 horas | Logs de auditoria e troubleshooting |
| **Grafana/Prometheus** | Monitoramento | 1 hora | 4 horas | Métricas históricas |
| **Admin Dashboard** | Aplicação | 4 horas | 8 horas | Interface administrativa interna |
| **Confluence/Wiki** | Documentação | 4 horas | 8 horas | Documentação técnica |

#### Tier 3 - Normal

| Sistema/Serviço | Tipo | RPO | RTO | Justificativa |
|-----------------|------|-----|-----|---------------|
| **Staging Environment** | Ambiente | 4 horas | 24 horas | Ambiente de testes (recrível) |
| **Sandbox** | Ambiente | 24 horas | 48 horas | Experimentação (sem dados reais) |

---

## 💾 4. Estratégias de Backup

### 4.1 Tipos de Backup

**[NOME DA EMPRESA]** utiliza 3 tipos de backup:

| Tipo | Descrição | Quando Usar | Vantagens | Desvantagens |
|------|-----------|-------------|-----------|--------------|
| **Full (Completo)** | Cópia completa de todos os dados | • Domingo (semanal)<br/>• Final do mês | • Restauração rápida<br/>• Não depende de outros backups | • Consome mais espaço<br/>• Mais lento |
| **Incremental** | Apenas dados alterados desde o último backup (de qualquer tipo) | • Segunda a sábado (diário) | • Rápido<br/>• Consome pouco espaço | • Restauração mais lenta (precisa do full + todos os incrementais) |
| **Diferencial** | Apenas dados alterados desde o último backup full | • Não usado atualmente | • Restauração mais rápida que incremental | • Consome mais espaço que incremental |

**Estratégia Adotada:** **Full (semanal) + Incremental (diário)**

### 4.2 Regra 3-2-1 de Backup

**[NOME DA EMPRESA]** segue a **regra 3-2-1** internacionalmente reconhecida:

```
┌─────────────────────────────────────────────────────────────┐
│                    REGRA 3-2-1 DE BACKUP                    │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  3️⃣  Manter pelo menos 3 CÓPIAS dos dados                   │
│      • 1 cópia primária (produção)                          │
│      • 2 cópias de backup                                   │
│                                                              │
│  2️⃣  Armazenar em 2 MÍDIAS/TECNOLOGIAS diferentes           │
│      • EBS Snapshots (AWS)                                  │
│      • S3 Standard (AWS)                                    │
│      • S3 Glacier (AWS - long-term)                         │
│                                                              │
│  1️⃣  Manter 1 cópia OFFSITE (geograficamente separada)      │
│      • AWS us-east-1 (produção primária)                    │
│      • AWS us-west-2 (backup offsite)                       │
│                                                              │
└─────────────────────────────────────────────────────────────┘
```

**Implementação na [NOME DA EMPRESA]:**

| Cópia | Localização | Tecnologia | Propósito | Retenção |
|-------|-------------|------------|-----------|----------|
| **Cópia 1 (Primária)** | AWS us-east-1 | RDS Instance (EBS) | Produção ativa | N/A (não é backup) |
| **Cópia 2 (Backup 1)** | AWS us-east-1 | RDS Automated Backups (S3) | Restauração rápida local | 30 dias |
| **Cópia 3 (Backup 2)** | AWS us-west-2 | S3 Cross-Region Replication | Disaster Recovery (offsite) | 90 dias (Standard)<br/>12 meses (Glacier) |

### 4.3 Backup de Banco de Dados (RDS PostgreSQL)

#### 4.3.1 Backups Automatizados (AWS RDS)

**Configuração:**
-  **Automated Backups:** Habilitado
-  **Backup Window:** 03:00 - 04:00 UTC (00:00 - 01:00 BRT) - horário de menor tráfego
-  **Retenção:** 30 dias
-  **Ponto de Restauração:** Point-in-Time Recovery (PITR) - qualquer segundo dos últimos 30 dias
-  **Storage:** S3 (transparente)

**RPO Alcançado:** ~5 minutos (através de transaction logs)

#### 4.3.2 Snapshots Manuais

**Frequência:**
- **Semanal:** Domingo, 02:00 UTC
- **Antes de Mudanças Críticas:** Sempre (ex: schema changes, migrações)

**Retenção:**
- **Snapshots Semanais:** 12 meses
- **Snapshots Pré-Mudança:** 90 dias (ou até validação da mudança)

**Rotulagem:**
```
[NOME DA EMPRESA]-rds-prod-snapshot-weekly-YYYY-MM-DD
[NOME DA EMPRESA]-rds-prod-snapshot-pre-migration-YYYY-MM-DD-HH-MM
```

#### 4.3.3 Replicação Cross-Region (DR)

**Configuração:**
-  **Read Replica:** us-west-2
-  **Replication Lag:** < 10 segundos (monitorado)
-  **Automated Backups na Replica:** Habilitado (30 dias)
-  **Propósito:** Disaster Recovery + Read traffic offload (opcional)

### 4.4 Backup de Aplicações (Kubernetes/EKS)

#### 4.4.1 Velero (Backup de Kubernetes)

**Ferramenta:** [Velero](https://velero.io/) (backup de recursos K8s + volumes)

**O que é feito backup:**
-  Todos os recursos K8s (Deployments, Services, ConfigMaps, Secrets, etc.)
-  Persistent Volumes (PVs) - quando aplicável
-  Namespaces completos

**Frequência:**
- **Completo (Full):** Diário, 04:00 UTC
- **Incremental:** Não suportado (Velero faz sempre full)

**Retenção:** 14 dias

**Storage:** S3 bucket (`[nome-empresa]-velero-backups`)

**Comando para Backup Manual:**
```bash
velero backup create manual-backup-$(date +%Y%m%d-%H%M%S) \
  --include-namespaces production \
  --ttl 720h
```

#### 4.4.2 Container Images

**Estratégia:**
-  Imagens armazenadas em **AWS ECR** (Elastic Container Registry)
-  **Replication:** Cross-region replication habilitada (us-east-1 → us-west-2)
-  **Retenção:** Últimas 30 imagens por repositório
-  **Immuable Tags:** Habilitado (tags não podem ser sobrescritas)

### 4.5 Backup de Código-Fonte (Git)

**Estratégia:**
-  **Repositório Primário:** GitHub (cloud)
-  **Backup Automático:** GitHub já mantém backups (não sob nosso controle)
-  **Mirror Offsite:** [AWS CodeCommit / GitLab] (mirror diário)
-  **Retenção:** Infinita (histórico Git completo)

**Script de Mirror:**
```bash
#!/bin/bash
# Executado diariamente via cron/CI
git clone --mirror https://github.com/[NOME-EMPRESA]/[REPO].git
cd [REPO].git
git push --mirror https://git-codecommit.us-west-2.amazonaws.com/v1/repos/[REPO]
```

### 4.6 Backup de Infraestrutura como Código (IaC)

**Status Atual:** ⏸️ IaC em desenvolvimento (Terraform planejado)

**Estratégia Atual:**
-  **Runbooks documentados:** Confluence (procedimentos manuais)
-  **AWS Config:** Export de configurações AWS
-  **ECS Task Definitions:** Versionados em Git
- ⏸️ **Terraform:** Planejado para Q1/2026

**Roadmap IaC:**
- Q1/2026: Implementação Terraform
- Q2/2026: Migração completa da infraestrutura

### 4.7 Backup de Secrets e Credenciais

**AWS Secrets Manager / SSM Parameter Store:**
-  **Backup Automático:** AWS mantém backups (não deletável por 7 dias)
-  **Versioning:** Habilitado (todas as versões retidas)
-  **Export Seguro:** Export criptografado semanal para S3 (apenas para DR)
-  **Encryption:** AWS KMS (chaves gerenciadas)

**Procedimento de Export (Automatizado):**
```bash
#!/bin/bash
# Executado semanalmente
aws secretsmanager list-secrets --region us-east-1 | \
  jq -r '.SecretList[].Name' | \
  while read secret; do
    aws secretsmanager get-secret-value \
      --secret-id "$secret" \
      --region us-east-1 | \
      jq -r '.SecretString' | \
      gpg --encrypt --recipient backup@[NOME-EMPRESA].com \
      > "backup-secrets-$(date +%Y%m%d)/$secret.gpg"
  done
```

---

## 🔐 5. Segurança de Backups

### 5.1 Criptografia

**Todos os backups DEVEM ser criptografados:**

| Tipo de Backup | Criptografia em Trânsito | Criptografia em Repouso | Chave |
|----------------|--------------------------|-------------------------|-------|
| **RDS Backups** | ✅ TLS 1.2+ | ✅ AES-256 | AWS KMS (CMK) |
| **S3 Backups** | ✅ TLS 1.2+ | ✅ AES-256 (SSE-S3) | AWS gerenciada |
| **EBS Snapshots** | ✅ Automático (AWS) | ✅ AES-256 | AWS KMS (CMK) |
| **Velero Backups** | ✅ TLS 1.2+ | ✅ AES-256 (S3) | AWS gerenciada |
| **Secrets Exports** | ✅ TLS 1.2+ | ✅ GPG (RSA 4096) | GPG keypair |

**Gestão de Chaves:**
- 🔑 **AWS KMS:** Customer Managed Keys (CMK) com rotação automática anual
- 🔑 **GPG Keys:** Armazenadas em cofre físico + AWS Secrets Manager
- 🔑 **Acesso:** Restrito a DevOps Lead + CTO (princípio do menor privilégio)

### 5.2 Controle de Acesso

**Princípio:** Menor privilégio + Segregação de funções

| Papel | Permissões | Justificativa |
|-------|-----------|---------------|
| **DevOps Lead** | • Criar backups<br/>• Restaurar backups<br/>• Acessar todos os backups | Responsável pela execução |
| **DBA** | • Criar backups (apenas DBs)<br/>• Restaurar backups (apenas DBs)<br/>• Acessar backups de DBs | Responsável por bancos de dados |
| **CTO/CISO** | • Aprovar restaurações (produção)<br/>• Acessar todos os backups | Autoridade final |
| **Desenvolvedores** | • Restaurar backups (apenas staging/dev) | Testes locais |
| **Compliance** | • Listar backups (apenas metadados)<br/>• Não pode restaurar | Auditoria |

**Implementação:**
-  AWS IAM Policies (granulares)
-  MFA obrigatório para restauração em produção
-  Audit logs (CloudTrail) de todos os acessos

### 5.3 Imutabilidade (Opcional - Recomendado)

**S3 Object Lock (WORM - Write Once Read Many):**
- 🔒 Habilitar para backups críticos (Tier 1)
- 🔒 Período de retenção: 90 dias (não pode ser deletado, nem pelo root account)
- 🔒 Proteção contra ransomware e deleção acidental/maliciosa

**Status:** ⏸️ Planejado para Q[X]/[ANO]

---

## 🧪 6. Testes de Restauração

### 6.1 Frequência de Testes

**Obrigatório:**

| Tier | Frequência | Tipo de Teste | Responsável | Ambiente |
|------|-----------|---------------|-------------|----------|
| **Tier 1** | Mensal | Restauração completa | DBA + DevOps | Staging (ambiente isolado) |
| **Tier 2** | Trimestral | Restauração amostral | DevOps | Staging |
| **Tier 3** | Semestral | Validação de integridade | DevOps | Sandbox |

### 6.2 Procedimento de Teste

**Passo a Passo:**

1. **Planejamento:**
   - Escolher backup aleatório dos últimos 30 dias
   - Agendar janela de teste (fora do horário de produção)
   - Notificar equipe

2. **Execução:**
   - Restaurar backup em ambiente isolado (staging)
   - Cronometrar tempo de restauração (validar RTO)
   - Validar integridade de dados:
     - Contagem de registros
     - Checksums de tabelas
     - Testes funcionais básicos

3. **Validação:**
   - Comparar com produção (estrutura, não dados)
   - Executar smoke tests
   - Documentar tempo de restauração

4. **Documentação:**
   - Preencher relatório de teste (Template 05)
   - Identificar gaps/problemas
   - Criar plano de ação

5. **Limpeza:**
   - Deletar ambiente de teste
   - Arquivar evidências (logs, screenshots)

### 6.3 Critérios de Sucesso

**Teste aprovado se:**
-  Restauração completada dentro do RTO planejado
-  Integridade de dados validada (100% OK)
-  Aplicação funcional após restauração (smoke tests passaram)
-  Procedimento documentado está correto (sem gaps)

**Teste reprovado se:**
- ❌ RTO excedido em > 20%
- ❌ Perda ou corrupção de dados detectada
- ❌ Aplicação não funciona após restauração
- ❌ Backup corrompido/inacessível

**Ação em caso de reprovação:**
- 🚨 Investigar causa raiz imediatamente
- 🚨 Testar backup mais recente (pode ser problema pontual)
- 🚨 Notificar CTO/CISO
- 🚨 Corrigir problema em < 48 horas
- 🚨 Revalidar após correção

---

## 📊 7. Monitoramento e Alertas

### 7.1 Métricas Monitoradas

**Dashboards (CloudWatch):**

| Métrica | Fonte | Alerta Se |
|---------|-------|-----------|
| **Sucesso de Backups** | CloudWatch / Backup Jobs | Taxa de sucesso < 95% nas últimas 24h |
| **Duração de Backups** | CloudWatch Logs | Duração > 2x da média histórica |
| **Tamanho de Backups** | S3 Metrics | Crescimento > 50% em 7 dias (possível anomalia) |
| **Replication Lag (RDS)** | RDS Metrics | Lag > 60 segundos |
| **Espaço Disponível** | S3 / EBS | Utilização > 85% |
| **Idade do Último Backup** | Custom Script | Último backup > 25 horas (esperado: 24h) |

### 7.2 Alertas (CloudWatch)

**Severidades:**

| Severidade | Condição | Notificação | SLA de Resposta |
|-----------|----------|-------------|-----------------|
| **P1 (Crítico)** | • Backup Tier 1 falhou<br/>• Último backup > 25 horas<br/>• Replication lag > 5 min | CloudWatch Alarm + Email<br/>+ Slack #incidents | 15 minutos |
| **P2 (Alto)** | • Backup Tier 2 falhou<br/>• 2 falhas consecutivas (qualquer tier)<br/>• Espaço < 15% | CloudWatch Alarm<br/>+ Slack #incidents | 1 hora |
| **P3 (Médio)** | • Backup Tier 3 falhou<br/>• Duração anormal | Slack #ops-alerts | 4 horas |
| **P4 (Baixo)** | • Warnings diversos | Slack #ops-alerts | 24 horas |

### 7.3 Relatório Semanal Automatizado

**Enviado todo:** Segunda-feira, 09:00 BRT

**Para:** CTO, DevOps Lead, DBA Lead

**Conteúdo:**
-  Taxa de sucesso de backups (última semana)
-  Tamanho total de backups (crescimento)
-  Tempo médio de backup por sistema
-  Falhas ocorridas (se houver) + ações tomadas
-  Próximo teste de restauração agendado
-  Espaço de armazenamento disponível

---

## 🔄 8. Retenção e Ciclo de Vida

### 8.1 Política de Retenção

**Princípio:** Balancear custo vs. recuperabilidade vs. conformidade

| Tier | Tipo | Retenção Online (Hot) | Retenção Archive (Cold) | Justificativa |
|------|------|-----------------------|-------------------------|---------------|
| **Tier 1** | Diário | 30 dias (S3 Standard) | 12 meses (S3 Glacier) | Conformidade LGPD + requisitos contratuais |
| **Tier 1** | Semanal | 90 dias (S3 Standard) | 24 meses (S3 Glacier Deep Archive) | Auditoria histórica |
| **Tier 2** | Diário | 14 dias (S3 Standard) | 6 meses (S3 Glacier) | Rastreabilidade |
| **Tier 3** | Diário | 7 dias (S3 Standard) | Nenhum | Custo-benefício |

### 8.2 Lifecycle Policies (S3)

**Transições Automáticas:**

```yaml
# Exemplo de S3 Lifecycle Policy
- Id: tier1-daily-lifecycle
  Status: Enabled
  Transitions:
    - Days: 30
      StorageClass: GLACIER
    - Days: 365
      StorageClass: DEEP_ARCHIVE
  Expiration:
    Days: 730  # 2 anos
```

**Benefícios:**
- 💰 **Custo:** S3 Glacier = ~80% mais barato que S3 Standard
- 💰 **Custo:** Glacier Deep Archive = ~95% mais barato
- ⚠️ **Trade-off:** Retrieval time (3-5 horas para Glacier, 12+ horas para Deep Archive)

### 8.3 Deleção de Backups

**Procedimento:**
-  **Automático:** Baseado em lifecycle policies (preferencial)
- ❌ **Manual:** Proibido sem aprovação do CTO/CISO
- 📝 **Logs:** Todos os deletes auditados (CloudTrail)

**Exceções:**
- 🔒 Backups com Object Lock não podem ser deletados até fim do período de retenção
- ⚖️ Backups relacionados a processos legais devem ser retidos indefinidamente (Legal Hold)

---

## 📞 9. Procedimentos de Restauração

### 9.1 Restauração em Staging/Dev (Não-Produção)

**Autorização:** DevOps Lead (sem necessidade de aprovação CTO)

**Passo a Passo:**

1. Identificar backup desejado:
   ```bash
   aws rds describe-db-snapshots \
     --db-instance-identifier [NOME-EMPRESA]-prod \
     --query 'DBSnapshots[*].[DBSnapshotIdentifier,SnapshotCreateTime]' \
     --output table
   ```

2. Restaurar snapshot para novo RDS (staging):
   ```bash
   aws rds restore-db-instance-from-db-snapshot \
     --db-instance-identifier [NOME-EMPRESA]-staging-restore \
     --db-snapshot-identifier [SNAPSHOT-ID] \
     --db-instance-class db.t3.medium \
     --no-publicly-accessible
   ```

3. Aguardar disponibilidade (~10-15 min)

4. Atualizar string de conexão (staging)

5. Validar dados

### 9.2 Restauração em Produção (CRÍTICO)

**⚠️ Requer aprovação explícita do CTO/CISO**

**Pré-Requisitos:**
-  Incidente documentado (ClickUp/Slack)
-  Causa raiz identificada (se possível)
-  Aprovação do CTO/CISO (verbal + email/Slack)
-  Janela de manutenção comunicada (clientes notificados)
-  War Room ativada (Google Meet + Slack #incidents)

**Passo a Passo (RDS):**

1. **Preparação (T-10min):**
   - Snapshot do estado atual (mesmo que corrompido)
   - Documentar timestamp de falha
   - Validar que backup escolhido é anterior à falha

2. **Comunicação (T-5min):**
   - Notificar clientes (ex: Serasa) - Template 03
   - Atualizar Status Page (manutenção programada)
   - Iniciar cronômetro de RTO

3. **Execução (T-0):**
   ```bash
   # Point-in-Time Recovery (se < 30 dias)
   aws rds restore-db-instance-to-point-in-time \
     --source-db-instance-identifier [NOME-EMPRESA]-prod \
     --target-db-instance-identifier [NOME-EMPRESA]-prod-restored \
     --restore-time "2025-01-15T10:30:00Z"  # Antes da falha
   
   # OU Snapshot Recovery
   aws rds restore-db-instance-from-db-snapshot \
     --db-instance-identifier [NOME-EMPRESA]-prod-restored \
     --db-snapshot-identifier [SNAPSHOT-ID]
   ```

4. **Validação (T+15min):**
   - Aguardar RDS ficar "available"
   - Conectar e executar queries de validação:
     ```sql
     -- Validar contagem de registros
     SELECT COUNT(*) FROM users;
     SELECT COUNT(*) FROM transactions WHERE created_at > 'YYYY-MM-DD';
     
     -- Validar integridade referencial
     SELECT constraint_name, constraint_type 
     FROM information_schema.table_constraints 
     WHERE constraint_type = 'FOREIGN KEY';
     ```

5. **Swap (T+20min):**
   - Renomear RDS original: `[NOME-EMPRESA]-prod` → `[NOME-EMPRESA]-prod-old`
   - Renomear RDS restaurado: `[NOME-EMPRESA]-prod-restored` → `[NOME-EMPRESA]-prod`
   - Atualizar DNS/Endpoint (se necessário)

6. **Smoke Tests (T+25min):**
   - Executar testes automatizados
   - Validar APIs Serasa especificamente
   - Monitorar dashboards (5 minutos)

7. **Comunicação (T+30min):**
   - Declarar "serviços restaurados"
   - Notificar clientes (ex: Serasa)
   - Atualizar Status Page
   - Documentar RTO alcançado

8. **Post-Mortem (T+24h):**
   - Documentar incidente completo
   - Causa raiz
   - Timeline
   - Lições aprendidas
   - Ações corretivas

### 9.3 RTO/RPO por Cenário

| Cenário | RTO Estimado | RPO Estimado | Procedimento |
|---------|--------------|--------------|--------------|
| **Deleção acidental (< 30 dias)** | 45 min | ~5 min | Point-in-Time Recovery (PITR) |
| **Corrupção de dados (< 30 dias)** | 45 min | ~5 min | PITR para momento antes da corrupção |
| **Falha de hardware/AZ** | 10 min | 0 min | Failover automático (Multi-AZ) |
| **Falha de região** | 2 horas | 15 min | Ativação DR (us-west-2) - ver Template 02 |
| **Ransomware** | 4 horas | 24 horas | Restauração de snapshot pré-infecção + validação exaustiva |

---

## 🛡️ 10. Conformidade e Auditoria

### 10.1 Requisitos de Conformidade

**ISO 27001:2022:**
-  **A.12.3.1:** Backup de informação - Conformidade total
-  **A.17.1.2:** Implementar redundância - Multi-region

**ISO 22301:2019:**
-  **8.4:** Determinar recursos para continuidade - Backups documentados
-  **8.5:** Estabelecer procedimentos - Procedimentos de restauração documentados

**SOC 2 Type II:**
-  **CC6.1:** Operações lógicas e físicas de segurança - Encryption at rest/transit
-  **A1.2:** Disponibilidade - Backups testados regularmente

**LGPD:**
-  **Art. 46:** Segurança da informação - Backups criptografados
-  **Art. 48:** Comunicação de incidente - Procedimentos de restauração minimizam impacto

### 10.2 Evidências para Auditoria

**Artefatos Disponíveis:**
- 📄 Esta política (documento principal)
- 📊 Logs de backups (CloudWatch, S3 access logs)
- 📊 Relatórios de testes de restauração (mensais/trimestrais)
- 📊 Dashboards de monitoramento (CloudWatch)
- 📊 Alertas e incidentes relacionados a backups (CloudWatch Alarms)
- 📄 Runbooks e documentação de infraestrutura

**Localização:**
- `[Google Drive/SharePoint]/Compliance/Backup-Policies/`
- AWS CloudWatch Logs (retention: 365 dias)
- S3 bucket: `[nome-empresa]-compliance-evidences/backup-logs/`

### 10.3 Auditorias Internas

**Frequência:** Semestral

**Checklist de Auditoria:**
- [ ] Política de backup está atualizada (revisão anual)
- [ ] Todos os sistemas Tier 1 têm backups habilitados
- [ ] Taxa de sucesso de backups ≥ 99% (últimos 6 meses)
- [ ] Testes de restauração executados conforme cronograma
- [ ] RTO/RPO atingidos em todos os testes
- [ ] Backups criptografados (amostra de 10 backups)
- [ ] Controles de acesso implementados (IAM policies)
- [ ] Retenção conforme política (sem backups expirados mantidos)
- [ ] Cross-region replication funcionando (lag < 15 min)
- [ ] Monitoramento e alertas funcionais (testar falha simulada)

---

## 📚 11. Referências

- **[02-plano-recuperacao-desastres.md](02-plano-recuperacao-desastres.md)** - Procedimentos de DR
- **ISO 27001:2022** - Controle A.12.3.1 (Backup de Informação)
- **ISO 22301:2019** - Seção 8.4 (Recursos de Continuidade)
- **SOC 2** - CC6.1 (Operações de Segurança), A1.2 (Disponibilidade)
- **LGPD** - Art. 46 (Segurança da Informação)
- **AWS Backup Best Practices:** https://docs.aws.amazon.com/aws-backup/latest/devguide/best-practices.html
- **Regra 3-2-1:** https://www.backblaze.com/blog/the-3-2-1-backup-strategy/

---

## ✅ 12. Checklist de Validação

- [ ] Todos os sistemas críticos (Tier 1) identificados
- [ ] RTO/RPO definidos para cada sistema
- [ ] Backups automatizados configurados
- [ ] Regra 3-2-1 implementada (3 cópias, 2 mídias, 1 offsite)
- [ ] Criptografia habilitada (em trânsito e repouso)
- [ ] Controles de acesso implementados (IAM)
- [ ] Monitoramento e alertas configurados
- [ ] Cronograma de testes de restauração definido
- [ ] Procedimentos de restauração documentados (staging + produção)
- [ ] Política aprovada por CTO/CISO
- [ ] Equipe treinada nos procedimentos
- [ ] Conformidade com ISO 27001/22301/SOC2/LGPD validada

---

## ✍️ 13. Aprovação

| Papel | Nome | Assinatura | Data |
|-------|------|------------|------|
| **Elaborado por** | [NOME - DevOps Lead] | __________ | [DATA] |
| **Revisado por** | [NOME - CISO] | __________ | [DATA] |
| **Aprovado por** | [NOME - CTO] | __________ | [DATA] |
| **Aprovação Final** | [NOME - CEO] | __________ | [DATA] |

---

## 🔄 14. Histórico de Revisões

**Próxima Revisão:** [DATA + 1 ANO]

| Data | Versão | Mudanças | Revisor |
|------|--------|----------|---------|
| [DATA] | 1.0 | Versão inicial | [NOME - CTO] |
| [DATA] | 1.1 | [Descrição de mudanças futuras] | [NOME] |

---

**🔒 Classificação:** CONFIDENCIAL - USO INTERNO  
**📁 Categoria:** Policies - Security - Backup  
**📅 Data de Criação:** [DATA]  
**🔄 Revisão Anual:** Obrigatória  
**👤 Responsável:** [NOME - CTO/CISO]

---

**Versão do Template:** 1.0 - Genérico  
**Data de Criação:** 09/10/2025  
**Conformidade:** ISO 27001:2022, ISO 22301:2019, SOC 2, LGPD  
**Para uso com:** Serasa Experian e demais clientes enterprise

