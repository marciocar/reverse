# Template ISO 27001:2022 - Sistema de Gestão de Segurança da Informação (SGSI)

*Template especializado para geração de documentação ISO/IEC 27001:2022 (Information Security Management System)*

---

## Introdução ao ISO 27001:2022

**ISO/IEC 27001:2022** é o padrão internacional para Sistema de Gestão de Segurança da Informação (SGSI / ISMS). Define requisitos para estabelecer, implementar, manter e melhorar continuamente um sistema de gestão de segurança da informação.

**Objetivo deste Template:**
Guiar a geração de documentação completa de SGSI que atenda aos requisitos da norma ISO 27001:2022 e prepare a organização para certificação oficial.

**Aplicável para:**
- Organizações que lidam com dados sensíveis
- Fintechs, SaaS, Healthcare, E-commerce
- Empresas que precisam demonstrar segurança da informação para clientes/parceiros
- Preparação para certificação ISO 27001

---

## Documentos Obrigatórios do SGSI

O specialist agent `@iso-27001-specialist` deve gerar **5 documentos principais**:

| # | Documento | Arquivo | Seção ISO 27001 | Prioridade |
|---|-----------|---------|-----------------|------------|
| 1 | Política de Segurança da Informação | `information-security-policy.md` | Cláusula 5.2 | Alta |
| 2 | Risk Assessment (Avaliação de Riscos) | `risk-assessment.md` | Cláusula 6.1.2 | Alta |
| 3 | Gestão de Ativos | `asset-management.md` | Annex A 5.9 | Média |
| 4 | Controle de Acesso (Access Control) | `access-control.md` | Annex A 5.15-5.18 | Alta |
| 5 | Resposta a Incidentes | `incident-response.md` | Annex A 5.24-5.28 | Alta |

**Output Directory:** `docs/compliance/security/`

---

## 1. information-security-policy.md

### Objetivo
Documentar a Política de Segurança da Informação da organização, estabelecendo diretrizes, responsabilidades e compromisso da alta direção com a segurança da informação.

### Seções Obrigatórias

#### 1.1 Propósito e Escopo (PT-BR)
```markdown
## Propósito

Esta Política de Segurança da Informação estabelece as diretrizes e responsabilidades para proteger os ativos de informação da [Nome da Empresa] contra ameaças internas e externas, garantindo confidencialidade, integridade e disponibilidade.

## Escopo

Esta política se aplica a:
- Todos os colaboradores (funcionários, estagiários, terceirizados)
- Todos os sistemas de informação (infraestrutura, aplicações, dados)
- Todos os ativos de informação (digitais e físicos)
- Todos os processos de negócio que lidam com informação
```

#### 1.2 Princípios de Segurança da Informação (Híbrido PT-BR + EN-US)
```markdown
## Princípios Fundamentais

### Confidencialidade (Confidentiality)
Garantir que a informação seja acessível apenas a pessoas autorizadas.

**Controles Implementados:**
- Classificação de dados por sensibilidade
- Controle de acesso baseado em função (RBAC)
- Criptografia de dados em repouso e em trânsito
- Multi-Factor Authentication (MFA) obrigatório

### Integridade (Integrity)
Garantir que a informação seja precisa, completa e não seja alterada de forma não autorizada.

**Controles Implementados:**
- Logs de auditoria imutáveis
- Checksums e assinaturas digitais
- Controle de versionamento de código
- Segregação de ambientes (dev/staging/prod)

### Disponibilidade (Availability)
Garantir que a informação e sistemas estejam disponíveis quando necessário.

**Controles Implementados:**
- Alta disponibilidade (multi-AZ AWS)
- Backups automatizados (diários)
- Disaster Recovery Plan (DRP) testado
- Monitoramento 24/7
```

#### 1.3 Responsabilidades (PT-BR)
```markdown
## Matriz de Responsabilidades

### Alta Direção
- Aprovar e revisar anualmente a Política de Segurança da Informação
- Alocar recursos para implementação do SGSI
- Demonstrar compromisso com segurança da informação

### CISO (Chief Information Security Officer)
- Gerenciar o SGSI e garantir conformidade com ISO 27001
- Conduzir risk assessments anuais
- Reportar métricas de segurança para alta direção
- Coordenar resposta a incidentes de segurança

### Times de Desenvolvimento
- Seguir práticas de secure coding (OWASP Top 10)
- Realizar code reviews com foco em segurança
- Reportar vulnerabilidades identificadas
- Participar de treinamentos de segurança

### Todos os Colaboradores
- Proteger credenciais de acesso
- Reportar incidentes de segurança imediatamente
- Completar treinamentos obrigatórios de segurança
- Seguir política de uso aceitável de recursos
```

#### 1.4 Referências a Controles ISO 27001 Annex A
```markdown
## Controles ISO 27001 Implementados

Esta política é suportada pelos seguintes controles do Annex A:

| Controle | Descrição | Status | Documento |
|----------|-----------|--------|-----------|
| A.5.1 | Políticas de Segurança da Informação | ✅ Implementado | Este documento |
| A.5.2 | Revisão de Políticas | ✅ Implementado | Processo anual |
| A.5.9 | Inventário de Ativos | ✅ Implementado | [asset-management.md] |
| A.5.15 | Controle de Acesso | ✅ Implementado | [access-control.md] |
| A.5.24 | Planejamento de Segurança | ✅ Implementado | [incident-response.md] |
```

### Guidelines de Conteúdo
- **Idioma:** PT-BR para texto descritivo, termos técnicos em EN-US
- **Aprovação:** Incluir assinatura da alta direção
- **Versionamento:** Manter histórico de revisões
- **Frequência de Revisão:** Anual ou quando houver mudanças significativas

---

## 2. risk-assessment.md

### Objetivo
Documentar o processo de Risk Assessment (Avaliação de Riscos) conforme ISO/IEC 27005:2022, identificando ameaças, vulnerabilidades e tratamento de riscos de segurança da informação.

### Seções Obrigatórias

#### 2.1 Metodologia de Risk Assessment (Híbrido)
```markdown
## Metodologia de Risk Assessment

### Framework Utilizado
**ISO/IEC 27005:2022** - Information Security Risk Management

### Processo de Avaliação

#### Step 1: Identificação de Ativos
Catalogar todos os ativos de informação:
- Dados (customer data, financial data, source code)
- Sistemas (aplicações, infraestrutura, APIs)
- Pessoas (desenvolvedores, operações, suporte)
- Processos (deployment, backup, incident response)

#### Step 2: Identificação de Ameaças
Ameaças consideradas:
- **Externas:** Cyberattacks, DDoS, ransomware, phishing
- **Internas:** Erro humano, insider threats, vazamento acidental
- **Ambientais:** Falhas de hardware, desastres naturais
- **Regulatórias:** Não conformidade, multas, sanções

#### Step 3: Identificação de Vulnerabilidades
Vulnerabilidades avaliadas:
- Técnicas (software desatualizado, configurações inseguras)
- Organizacionais (falta de treinamento, processos inadequados)
- Físicas (acesso não controlado, ausência de redundância)

#### Step 4: Análise de Impacto
**Impact Levels:**
- **Crítico (4):** Perda de negócio, danos à reputação, impacto legal
- **Alto (3):** Impacto operacional significativo, perda de confiança
- **Médio (2):** Impacto operacional moderado, custos de correção
- **Baixo (1):** Impacto mínimo, fácil recuperação

#### Step 5: Análise de Probabilidade
**Likelihood Levels:**
- **Muito Provável (4):** Ocorre frequentemente (>1x/ano)
- **Provável (3):** Pode ocorrer (1x/2 anos)
- **Possível (2):** Pouco provável (<1x/5 anos)
- **Raro (1):** Muito improvável (<1x/10 anos)

#### Step 6: Cálculo de Risco
**Risk Level = Impact × Likelihood**

| Score | Nível de Risco | Ação Requerida |
|-------|----------------|----------------|
| 12-16 | Crítico | Tratamento imediato |
| 8-11  | Alto | Tratamento em 30 dias |
| 4-7   | Médio | Tratamento em 90 dias |
| 1-3   | Baixo | Aceitar ou monitorar |
```

#### 2.2 Registro de Riscos Identificados (PT-BR + EN-US)
```markdown
## Risk Register

### Risco R-001: Unauthorized Access (Acesso Não Autorizado)
**Ativo:** Customer Database (Banco de Dados de Clientes)  
**Ameaça:** Cyberattack, credential theft  
**Vulnerabilidade:** Autenticação básica (senha apenas)  
**Impact:** Crítico (4) - vazamento de dados pessoais  
**Likelihood:** Provável (3)  
**Risk Score:** 12 (Crítico)

**Tratamento:**
- ✅ Implementar Multi-Factor Authentication (MFA) - Concluído
- ✅ Implementar Role-Based Access Control (RBAC) - Concluído
- 🔄 Implementar detecção de anomalias - Em progresso

**Risco Residual:** 6 (Médio) - Aceitável

---

### Risco R-002: Data Loss (Perda de Dados)
**Ativo:** Production Database  
**Ameaça:** Falha de hardware, erro humano, ransomware  
**Vulnerabilidade:** Ausência de backups automatizados  
**Impact:** Crítico (4)  
**Likelihood:** Possível (2)  
**Risk Score:** 8 (Alto)

**Tratamento:**
- ✅ Backups diários automatizados - Implementado
- ✅ Replicação multi-região (AWS) - Implementado
- ✅ Testes de restore mensais - Implementado

**Risco Residual:** 2 (Baixo) - Aceitável

---

[Adicionar outros riscos identificados]
```

#### 2.3 Statement of Applicability (SoA)
```markdown
## Statement of Applicability (SoA)

Controles ISO 27001 Annex A avaliados:

| Controle | Título | Status | Justificativa |
|----------|--------|--------|---------------|
| A.5.1 | Políticas de Segurança | Implementado | Documento information-security-policy.md |
| A.5.9 | Inventário de Ativos | Implementado | 45 ativos críticos catalogados |
| A.5.15 | Controle de Acesso | Implementado | MFA + RBAC implementados |
| A.5.18 | Access Rights | Implementado | Revisão trimestral de permissões |
| A.5.23 | Uso Aceitável | Implementado | Política assinada por todos colaboradores |
| A.8.1 | User Endpoint Devices | Parcial | 70% dispositivos com MDM |
| A.8.9 | Gerenciamento de Configuração | Implementado | IaC com Terraform |
| A.8.16 | Monitoramento | Implementado | CloudWatch + alertas 24/7 |

**Total:** 78 controles implementados, 10 não aplicáveis, 5 em implementação
```

### Guidelines de Conteúdo
- **Idioma:** Risk Assessment (termo técnico), explicações em PT-BR
- **Frequência:** Revisão anual ou quando houver mudanças significativas
- **Responsável:** CISO + Security Team
- **Aprovação:** Alta direção

---

## 3. asset-management.md

### Objetivo
Catalogar e classificar ativos de informação conforme ISO 27001 Annex A 5.9, estabelecendo responsabilidades e níveis de proteção adequados.

### Seções Obrigatórias

#### 3.1 Inventário de Ativos (PT-BR + EN-US)
```markdown
## Inventário de Ativos de Informação

### Ativos de Dados (Data Assets)

| ID | Nome do Ativo | Tipo | Classificação | Localização | Owner |
|----|---------------|------|---------------|-------------|-------|
| DA-001 | Customer Database | PostgreSQL | Crítico | AWS RDS (us-east-1) | CTO |
| DA-002 | Transaction Logs | S3 Bucket | Crítico | AWS S3 (encrypted) | CFO |
| DA-003 | Source Code | Git Repository | Alto | GitHub Enterprise | CTO |
| DA-004 | Analytics Data | BigQuery | Médio | GCP (backup AWS) | CPO |

### Ativos de Sistemas (System Assets)

| ID | Nome do Ativo | Tipo | Classificação | SLA | Owner |
|----|---------------|------|---------------|-----|-------|
| SA-001 | API Gateway | Kong | Crítico | 99.9% | DevOps |
| SA-002 | Authentication Service | Auth0 | Crítico | 99.99% | Security |
| SA-003 | Payment Processing | Internal | Crítico | 99.95% | Backend |
| SA-004 | Analytics Pipeline | Airflow | Médio | 99% | Data Team |

### Ativos de Infraestrutura (Infrastructure Assets)

| ID | Nome do Ativo | Tipo | Classificação | Redundância | Owner |
|----|---------------|------|---------------|-------------|-------|
| IA-001 | Production VPC | AWS VPC | Crítico | Multi-AZ | DevOps |
| IA-002 | Kubernetes Cluster | EKS | Crítico | 3 nodes min | DevOps |
| IA-003 | Load Balancer | ALB | Crítico | Multi-AZ | DevOps |
```

#### 3.2 Classificação de Dados (Data Classification)
```markdown
## Data Classification Framework

### Nível 1: Dados Públicos
**Definição:** Informação que pode ser compartilhada publicamente sem risco.  
**Exemplos:** Marketing materials, public APIs, documentação pública  
**Controles:** Nenhum controle especial

### Nível 2: Dados Internos
**Definição:** Informação para uso interno da empresa.  
**Exemplos:** Políticas internas, métricas de negócio, roadmaps  
**Controles:** Acesso apenas para colaboradores autenticados

### Nível 3: Dados Confidenciais
**Definição:** Informação sensível que requer proteção adicional.  
**Exemplos:** Customer data, financial records, source code  
**Controles:**
- Acesso baseado em necessidade (need-to-know)
- Criptografia em repouso e em trânsito
- MFA obrigatório
- Logs de auditoria

### Nível 4: Dados Críticos (Regulated Data)
**Definição:** Informação regulada que pode causar dano severo se exposta.  
**Exemplos:** Payment card data (PCI), health records (HIPAA), PII  
**Controles:**
- Todos controles do Nível 3 +
- Segregação de dados (tokenization)
- Acesso aprovado pelo CISO
- Monitoramento contínuo
- Encryption at rest e in transit (AES-256)
```

#### 3.3 Ciclo de Vida de Ativos
```markdown
## Lifecycle Management

### Criação
- Registrar no inventário de ativos
- Classificar conforme framework
- Designar owner responsável
- Aplicar controles de segurança apropriados

### Manutenção
- Revisar classificação anualmente
- Atualizar inventário quando houver mudanças
- Validar controles aplicados
- Monitorar acessos e uso

### Descarte (Disposal)
- Remover dados sensíveis (data sanitization)
- Desativar acessos
- Atualizar inventário (status: decommissioned)
- Documentar processo de descarte
```

### Guidelines de Conteúdo
- **Idioma:** Asset Management (termo técnico), descrições em PT-BR
- **Atualização:** Trimestral ou quando novos ativos forem criados
- **Responsável:** Security Team + Asset Owners

---

## 4. access-control.md

### Objetivo
Documentar controles de Access Control (Controle de Acesso) conforme ISO 27001 Annex A 5.15-5.18, garantindo que apenas usuários autorizados tenham acesso a sistemas e dados.

### Seções Obrigatórias

#### 4.1 Política de Access Control (PT-BR + EN-US)
```markdown
## Política de Controle de Acesso

### Princípios

#### Least Privilege (Privilégio Mínimo)
Usuários recebem apenas as permissões mínimas necessárias para realizar suas funções.

#### Need-to-Know
Acesso a informações confidenciais é concedido apenas quando estritamente necessário.

#### Segregation of Duties (Segregação de Funções)
Funções críticas são divididas entre múltiplas pessoas para prevenir fraude.

#### Multi-Factor Authentication (MFA)
Autenticação de dois fatores obrigatória para todos os sistemas críticos.
```

#### 4.2 Controles Implementados (EN-US + PT-BR)
```markdown
## Controles de Acesso Implementados

### User Authentication (Autenticação de Usuários)

#### Single Sign-On (SSO)
- **Provider:** Auth0 / Okta
- **Protocols:** SAML 2.0, OAuth 2.0, OIDC
- **Coverage:** 100% dos sistemas internos

#### Multi-Factor Authentication (MFA)
- **Mandatory for:** Todos usuários (sem exceção)
- **Methods:** TOTP (Google Authenticator), SMS, Biometria
- **Enforcement:** Impossível acessar sistemas sem MFA ativo

#### Password Policy (Política de Senhas)
- **Minimum Length:** 12 caracteres
- **Complexity:** Letra maiúscula + minúscula + número + símbolo especial
- **Rotation:** Não forçada (NIST guidelines), mas recomendada a cada 90 dias
- **History:** Últimas 5 senhas não podem ser reutilizadas
- **Lockout:** 5 tentativas falhas = bloqueio por 15 minutos

### Role-Based Access Control (RBAC)

#### Roles Definidos

| Role | Permissões | Sistemas | Approval |
|------|------------|----------|----------|
| Developer | Read/Write code, Deploy staging | GitHub, CI/CD, Staging AWS | Engineering Manager |
| DevOps | Full AWS access, Prod deploy | AWS, Kubernetes, Monitoring | CTO |
| Support | Read customer data, Create tickets | Support system, Customer DB (read-only) | Support Manager |
| Admin | Full system access | All systems | CTO + CISO |

#### Access Request Process
1. Colaborador solicita acesso via ticket (Jira/ClickUp)
2. Manager aprova baseado em necessidade de trabalho
3. Security Team valida e provisiona acesso
4. Acesso revisado trimestralmente (recertification)

### Network Access Control

#### VPN Obrigatória
- Acesso remoto apenas via VPN corporativa
- MFA requerido para conectar à VPN
- Split tunneling desabilitado

#### IP Whitelisting
- Produção AWS: Apenas IPs da VPN + IPs do escritório
- Admin consoles: Apenas IPs autorizados

#### Firewall Rules
- Default deny all (whitelist approach)
- Regras revisadas mensalmente
- Logs de firewall armazenados por 12 meses
```

#### 4.3 Access Review Process (Processo de Revisão)
```markdown
## Processo de Revisão de Acessos

### Frequência
- **Trimestral:** Revisão completa de todos os acessos
- **Imediata:** Quando colaborador muda de função ou sai da empresa

### Processo

#### Step 1: Relatório Automatizado
Sistema gera relatório de todos os acessos ativos:
- Usuário
- Sistemas acessados
- Permissões concedidas
- Data da última utilização
- Aprovação original

#### Step 2: Revisão por Managers
Cada manager revisa acessos do seu time:
- ✅ Confirmar acessos necessários
- ❌ Remover acessos desnecessários
- 🔄 Ajustar permissões (upgrade/downgrade)

#### Step 3: Auditoria Security Team
Security Team valida:
- Princípio de least privilege seguido
- Segregation of duties mantida
- Acessos órfãos removidos
- Documentação atualizada

### Offboarding Automático
Quando colaborador é desligado:
- ✅ Desativar SSO/LDAP imediatamente
- ✅ Revogar acessos a sistemas (automático via SCIM)
- ✅ Coletar dispositivos e credenciais físicas
- ✅ Transferir ownership de ativos críticos
- ✅ Documentar processo no ticket de offboarding
```

### Guidelines de Conteúdo
- **Idioma:** Access Control (termo técnico), explicações em PT-BR
- **Atualização:** Quando houver mudanças em sistemas ou processos
- **Responsável:** Security Team + IT

---

## 5. incident-response.md

### Objetivo
Documentar o processo de Incident Response (Resposta a Incidentes) conforme ISO 27001 Annex A 5.24-5.28, estabelecendo procedimentos para detectar, responder e recuperar de incidentes de segurança.

### Seções Obrigatórias

#### 5.1 Definição de Security Incident (PT-BR + EN-US)
```markdown
## Security Incident (Incidente de Segurança)

**Definição:** Evento que pode comprometer confidencialidade, integridade ou disponibilidade de informações ou sistemas.

### Categorias de Incidentes

#### Categoria 1: Breach (Vazamento de Dados)
- Acesso não autorizado a dados sensíveis
- Exfiltração de dados
- Exposição acidental de informações

#### Categoria 2: Cyberattack (Ataque Cibernético)
- DDoS, ransomware, phishing
- Tentativas de invasão
- Malware detectado

#### Categoria 3: Insider Threat
- Acesso indevido por colaborador
- Vazamento intencional
- Sabotagem

#### Categoria 4: Availability Issue (Indisponibilidade)
- Outage não planejado
- Performance degradation crítica
- Perda de serviços essenciais

### Severidade de Incidentes

| Severidade | Impacto | Tempo de Resposta | Escalation |
|------------|---------|-------------------|------------|
| **P0 - Crítico** | Dados sensíveis expostos, sistema crítico down | Imediato (15min) | CTO + CISO + CEO |
| **P1 - Alto** | Tentativa de breach, degradação severa | 1 hora | CISO + CTO |
| **P2 - Médio** | Anomalia detectada, indisponibilidade parcial | 4 horas | Security Team |
| **P3 - Baixo** | Evento suspeito, sem impacto imediato | 24 horas | Security Analyst |
```

#### 5.2 Incident Response Process (Processo)
```markdown
## Processo de Resposta a Incidentes

### Fase 1: Detection & Reporting (Detecção e Reporte)

#### Canais de Reporte
- **Email:** security@empresa.com (24/7)
- **Slack:** #security-incidents (alertas automatizados)
- **On-call:** PagerDuty (incidentes críticos)
- **Phone:** +55 11 XXXX-XXXX (emergências)

#### Monitoramento Contínuo
- SIEM (Security Information and Event Management)
- CloudWatch Alarms
- Intrusion Detection System (IDS)
- Log analysis automatizado

**SLA de Detecção:** < 5 minutos para incidentes críticos

---

### Fase 2: Triage & Classification (Triagem e Classificação)

#### Security Analyst Analisa:
1. Validar se é um incidente real (vs falso positivo)
2. Determinar categoria do incidente
3. Atribuir severidade (P0/P1/P2/P3)
4. Iniciar incident ticket (Jira/ClickUp)
5. Notificar stakeholders apropriados

**SLA de Triagem:** < 15 minutos

---

### Fase 3: Containment (Contenção)

#### Ações Imediatas (baseadas na categoria):

**Para Breach:**
- Isolar sistema comprometido (network isolation)
- Revogar credenciais suspeitas
- Bloquear IPs maliciosos
- Preservar logs para análise forense

**Para DDoS:**
- Ativar WAF rules
- Escalar infraestrutura automaticamente
- Implementar rate limiting agressivo
- Contatar cloud provider para mitigação

**Para Insider Threat:**
- Desativar acesso do usuário imediatamente
- Auditar ações recentes do usuário
- Preservar evidências
- Notificar RH/Legal

**SLA de Contenção:** < 1 hora para P0/P1

---

### Fase 4: Eradication (Erradicação)

#### Remover Causa Raiz:
- Aplicar patches de segurança
- Remover malware/backdoors
- Corrigir configurações vulneráveis
- Atualizar regras de firewall/WAF

#### Validação:
- Scan completo de vulnerabilidades
- Teste de penetração (se aplicável)
- Confirmar que ameaça foi eliminada

---

### Fase 5: Recovery (Recuperação)

#### Restaurar Operações Normais:
- Reativar sistemas isolados
- Restaurar dados de backups (se necessário)
- Monitorar intensivamente por 24-48h
- Validar integridade de dados

#### Comunicação:
- Notificar clientes afetados (se aplicável)
- Update status page
- Comunicado interno para time

---

### Fase 6: Post-Incident Review (Revisão Pós-Incidente)

#### Meeting de Retrospectiva (72h após resolução):
- Timeline detalhada do incidente
- Root cause analysis
- Lições aprendidas
- Action items para prevenir recorrência

#### Documentação Final:
- Incident report completo
- Evidências preservadas
- Melhorias implementadas
- Atualização de runbooks/playbooks

**Documento:** Armazenado em `docs/security/incidents/[YYYY-MM-DD]-[incident-id].md`
```

#### 5.3 Runbooks por Tipo de Incidente
```markdown
## Incident Response Runbooks

### Runbook 1: Suspected Data Breach

**Checklist:**
- [ ] Isolar sistema afetado imediatamente
- [ ] Identificar dados potencialmente comprometidos
- [ ] Preservar logs e evidências
- [ ] Notificar CISO e Legal Team
- [ ] Avaliar obrigações de notificação (LGPD/GDPR)
- [ ] Comunicar clientes afetados dentro de 72h (se requerido)
- [ ] Conduzir análise forense
- [ ] Documentar timeline e ações tomadas

---

### Runbook 2: Ransomware Attack

**Checklist:**
- [ ] Isolar máquinas infectadas (desconectar rede)
- [ ] Não pagar resgate (política da empresa)
- [ ] Identificar variante de ransomware
- [ ] Restaurar dados de backups
- [ ] Aplicar patches de segurança
- [ ] Scan completo da rede
- [ ] Notificar autoridades (Polícia Federal)
- [ ] Revisar controles de prevenção

---

### Runbook 3: DDoS Attack

**Checklist:**
- [ ] Ativar AWS Shield / Cloudflare DDoS Protection
- [ ] Implementar rate limiting agressivo
- [ ] Escalar infraestrutura (auto-scaling)
- [ ] Analisar padrão de tráfego
- [ ] Bloquear IPs/ranges maliciosos
- [ ] Contatar ISP/cloud provider
- [ ] Comunicar clientes via status page
- [ ] Monitorar até tráfego normalizar
```

### Guidelines de Conteúdo
- **Idioma:** Incident Response (termo técnico), procedimentos em PT-BR
- **Atualização:** Após cada incidente (lições aprendidas)
- **Responsável:** CISO + Security Team
- **Treinamento:** Simulações anuais (tabletop exercises)

---

## Cross-References com Outros Frameworks

### ISO 27001 ↔ SOC2 Overlap (~70%)
- ISO 27001 Risk Assessment ≈ SOC2 Risk Management Process
- ISO 27001 Access Control ≈ SOC2 Logical Access Controls
- ISO 27001 Incident Response ≈ SOC2 Incident Management

**Estratégia:** Documentos ISO 27001 servem como base para controles SOC2. Adicionar cross-references nos documentos SOC2.

### ISO 27001 ↔ ISO 22301
- ISO 27001 Incident Response → ISO 22301 Crisis Management
- ISO 27001 Availability Controls → ISO 22301 Business Continuity

**Estratégia:** Documentos separados com cross-references explícitos.

---

## Mapeamento ISO 27001 Annex A (Resumo)

| Annex A Section | Controle | Documento | Status |
|-----------------|----------|-----------|--------|
| A.5.1 | Políticas de Segurança | information-security-policy.md | ✅ |
| A.5.9 | Inventário de Ativos | asset-management.md | ✅ |
| A.5.15 | Access Control | access-control.md | ✅ |
| A.5.18 | Access Rights | access-control.md | ✅ |
| A.5.24 | Security Incident Management | incident-response.md | ✅ |
| A.6.1 | Screening | (RH process) | ✅ |
| A.8.1 | User Endpoint Devices | (IT policy) | 🔄 |
| A.8.9 | Configuration Management | (DevOps IaC) | ✅ |
| A.8.16 | Monitoring Activities | incident-response.md | ✅ |

**Total:** 78/93 controles implementados (84% coverage)

---

## Certification Readiness Checklist

Para preparação para certificação ISO 27001:

- [ ] Todos os 5 documentos obrigatórios criados
- [ ] Risk assessment completo e atualizado
- [ ] Statement of Applicability (SoA) documentado
- [ ] Evidências de controles implementados coletadas
- [ ] Internal audit realizada
- [ ] Management review conduzida
- [ ] Non-conformities corrigidas
- [ ] Treinamentos de segurança completados (100% do time)
- [ ] Incident response testado (simulação)
- [ ] Processo de melhoria contínua estabelecido

---

**Última Atualização do Template:** 2025-06-03  
**Versão:** 1.0 (ISO 27001:2022)  
**Mantido por:** @iso-27001-specialist

