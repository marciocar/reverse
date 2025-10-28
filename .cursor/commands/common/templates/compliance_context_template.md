# Template de Arquitetura de Contexto de Compliance
*Framework estratégico para organizar documentação de conformidade regulatória para habilitar auditorias, certificações e Due Diligence*

---

## Propósito Deste Template

Este template ajuda organizações a projetar sua **Arquitetura de Contexto de Compliance** - a abordagem sistemática para organizar, estruturar e manter toda a documentação de conformidade regulatória para que auditores, certificadores e stakeholders possam entender políticas, processos e controles implementados.

**Use este template para:**
- Criar documentação de compliance auditável e pronta para certificação
- Responder requisitos de Due Diligence de forma estruturada
- Preparar para certificações (ISO 27001, ISO 22301, SOC2)
- Demonstrar maturidade em governança e gestão de riscos
- Alinhar desenvolvimento técnico com requisitos de compliance

---

## Estrutura Base de Compliance

### IMPORTANT: Multi-File Modular Architecture

**CRITICAL: Create a multi-file structure. Do NOT create one large compliance file.**

**Implementation Approach:**
1. **First**: Create `index.md` with compliance profile and framework links
2. **Then**: Create individual directories and files for each selected framework
3. **Finally**: Create consolidated `COMPLIANCE_OVERVIEW.md` with status dashboard

**File Naming Convention:**
- Use UPPERCASE for generic compliance files (e.g., `COMPLIANCE_OVERVIEW.md`)
- Use lowercase for framework-specific files (e.g., `business-continuity-plan.md`)
- Use descriptive names that reflect document purpose

### Create Index File First

**Create: `docs/compliance/index.md`**
```markdown
# Documentação de Compliance - [Nome da Empresa]

## Perfil de Compliance

### Informações da Organização
- **Empresa:** [Nome da Empresa]
- **Setor:** [Fintech, SaaS, Healthcare, etc.]
- **Escala:** [Número de usuários/clientes/transações]
- **Infraestrutura:** [Cloud provider, arquitetura]

### Frameworks de Compliance Implementados
- [x] ISO/IEC 27001:2022 - Sistema de Gestão de Segurança da Informação (SGSI)
- [x] ISO 22301:2019 - Sistema de Gestão de Continuidade de Negócios (SGCN)
- [x] SOC2 Type II - AICPA Trust Services Criteria
- [x] PMBOK® 7th Edition - Governança de Projetos

---

## 🔒 ISO 27001:2022 - Segurança da Informação

- [Política de Segurança da Informação](security/information-security-policy.md)
- [Risk Assessment (Avaliação de Riscos)](security/risk-assessment.md)
- [Gestão de Ativos](security/asset-management.md)
- [Controle de Acesso (Access Control)](security/access-control.md)
- [Resposta a Incidentes](security/incident-response.md)

## 🏥 ISO 22301:2019 - Continuidade de Negócios

- [Business Continuity Plan (BCP)](business-continuity/business-continuity-plan.md)
- [Disaster Recovery Plan (DRP)](business-continuity/disaster-recovery-plan.md)
- [Plano de Gerenciamento de Crise](business-continuity/crisis-management.md)
- [Testes de Resiliência](business-continuity/resilience-testing.md)
- [Recovery Time Objectives (RTOs) e RPOs](business-continuity/recovery-objectives.md)

## 📊 PMBOK® 7th - Governança de Projetos

- [Governança de Projetos](project-management/project-governance.md)
- [Gestão de Mudanças (Change Management)](project-management/change-management.md)
- [Gestão de Qualidade](project-management/quality-management.md)
- [Gestão de Stakeholders](project-management/stakeholder-management.md)

## ✅ SOC2 Type II - Trust Services Criteria

- [Trust Services Criteria (TSC)](soc2/trust-services-criteria.md)
- [Controles de Segurança](soc2/security-controls.md)
- [Controles de Disponibilidade](soc2/availability-controls.md)
- [Controles de Confidencialidade](soc2/confidentiality-controls.md)
- [Estratégia de Coleta de Evidências](soc2/evidence-collection.md)

---

## 📋 Documentação Consolidada

- [COMPLIANCE OVERVIEW - Status Geral](COMPLIANCE_OVERVIEW.md)
- [Due Diligence - Respostas Estruturadas](due-diligence/)
- [Audit Readiness Checklist](due-diligence/audit-readiness-checklist.md)

---

**Última Atualização:** [Data]  
**Responsável:** [Nome/Time]  
**Próxima Revisão:** [Data]
```

---

## Framework-Specific Templates

### Template References

Este template genérico **referencia** 4 templates específicos por framework:

| Framework | Template | Documentos | Output Directory |
|-----------|----------|------------|------------------|
| **ISO 27001** | `compliance_iso27001_template.md` | 5 docs SGSI | `docs/compliance/security/` |
| **ISO 22301** | `compliance_iso22301_template.md` | 5 docs BC/DR | `docs/compliance/business-continuity/` |
| **PMBOK** | `compliance_pmbok_template.md` | 4 docs Governança | `docs/compliance/project-management/` |
| **SOC2** | `compliance_soc2_template.md` | 5 docs TSC | `docs/compliance/soc2/` |

**Specialist Agents** lerão templates específicos para gerar documentação detalhada.

**Master Agent** usará este template genérico para consolidar outputs.

---

## Consolidated Overview Document

**Create: `docs/compliance/COMPLIANCE_OVERVIEW.md`**
```markdown
# COMPLIANCE OVERVIEW - [Nome da Empresa]

*Dashboard consolidado do status de compliance e governança*

---

## 📊 Status Geral de Compliance

| Framework | Status | Completude | Última Atualização | Próxima Revisão |
|-----------|--------|------------|-------------------|-----------------|
| ISO 27001:2022 | ✅ Implementado | 100% (5/5 docs) | [Data] | [Data +3 meses] |
| ISO 22301:2019 | ✅ Implementado | 100% (5/5 docs) | [Data] | [Data +6 meses] |
| PMBOK 7th | ✅ Implementado | 100% (4/4 docs) | [Data] | [Data +1 ano] |
| SOC2 Type II | 🔄 Em Progresso | 80% (4/5 docs) | [Data] | [Data +3 meses] |

**Legenda:**
- ✅ Implementado: Documentação completa e revisada
- 🔄 Em Progresso: Documentação parcial, requer complemento
- ⏳ Pendente: Não iniciado
- ❌ Desatualizado: Requer revisão urgente

---

## 🎯 Objetivos de Compliance

### Objetivos de Curto Prazo (3 meses)
- [ ] Concluir documentação SOC2 (evidence-collection.md)
- [ ] Realizar auditoria interna ISO 27001
- [ ] Atualizar RTOs/RPOs conforme crescimento

### Objetivos de Médio Prazo (6 meses)
- [ ] Certificação ISO 27001:2022 oficial
- [ ] Relatório SOC2 Type II auditado
- [ ] Implementar melhorias identificadas em testes BC/DR

### Objetivos de Longo Prazo (12 meses)
- [ ] Certificação ISO 22301:2019 oficial
- [ ] Renovação SOC2 Type II
- [ ] Expansão de frameworks (LGPD, GDPR se aplicável)

---

## 🔍 Resumo por Framework

### ISO 27001:2022 - Segurança da Informação
**Escopo:** Sistema de Gestão de Segurança da Informação (SGSI)  
**Aplicabilidade:** Toda a infraestrutura e dados da [Empresa]

**Documentos Implementados:**
1. ✅ Política de Segurança da Informação (atualizada [data])
2. ✅ Risk Assessment - 15 riscos identificados, 12 mitigados
3. ✅ Gestão de Ativos - 45 ativos críticos catalogados
4. ✅ Controle de Acesso - MFA + RBAC implementados
5. ✅ Resposta a Incidentes - Playbooks definidos

**Controles ISO 27001 Annex A:**
- Implementados: 78/93 controles (84%)
- Não aplicáveis: 10 controles
- Em implementação: 5 controles

---

### ISO 22301:2019 - Continuidade de Negócios
**Escopo:** Processos críticos e infraestrutura de TI  
**Aplicabilidade:** Serviços core da [Empresa]

**Documentos Implementados:**
1. ✅ Business Continuity Plan (BCP) - 8 processos críticos
2. ✅ Disaster Recovery Plan (DRP) - Infraestrutura AWS
3. ✅ Plano de Gerenciamento de Crise - Matriz de comunicação
4. ✅ Testes de Resiliência - Último teste: [data]
5. ✅ RTOs/RPOs Definidos - RTO: 4h, RPO: 1h

**Processos Críticos Cobertos:**
- Processamento de transações (RTO: 1h, RPO: 15min)
- Autenticação de usuários (RTO: 30min, RPO: 0)
- APIs core (RTO: 2h, RPO: 1h)
- [Adicionar outros]

---

### PMBOK 7th - Governança de Projetos
**Escopo:** Processos de desenvolvimento e gerenciamento de projetos  
**Aplicabilidade:** Time de Engenharia + Product

**Documentos Implementados:**
1. ✅ Governança de Projetos - Framework baseado em NX monorepo
2. ✅ Change Management - CI/CD + feature flags
3. ✅ Quality Management - Code review + testes automatizados
4. ✅ Stakeholder Management - Rituais ágeis + comunicação

**Práticas Implementadas:**
- Planning: Sprint planning + roadmap trimestral
- Execution: Feature branches + peer review obrigatório
- Monitoring: Métricas de qualidade + dashboards
- Closing: Retrospectivas + documentação pós-deploy

---

### SOC2 Type II - Trust Services Criteria
**Escopo:** Controles de segurança, disponibilidade e confidencialidade  
**Aplicabilidade:** Toda plataforma [Empresa]

**Documentos Implementados:**
1. ✅ Trust Services Criteria (TSC) - 5 princípios
2. ✅ Controles de Segurança - 35 controles implementados
3. ✅ Controles de Disponibilidade - SLA 99.9% 
4. ✅ Controles de Confidencialidade - Criptografia end-to-end
5. 🔄 Estratégia de Coleta de Evidências (em desenvolvimento)

**SOC2 Trust Services:**
- ✅ Security (Segurança): 100% controles ativos
- ✅ Availability (Disponibilidade): 99.95% uptime (último trimestre)
- ✅ Confidentiality (Confidencialidade): Criptografia implementada
- 🔄 Processing Integrity: Em implementação (monitoramento)
- ⏳ Privacy: Planejado para Q2 2025

---

## 📈 Métricas de Compliance

### Indicadores de Governança
- **Documentação Atualizada:** 95% (19/20 documentos revisados nos últimos 6 meses)
- **Treinamentos de Compliance:** 85% do time treinado em 2024
- **Incidentes de Segurança:** 0 incidentes críticos em 12 meses
- **Tempo de Resposta a Incidentes:** Média de 45 minutos (meta: <1h)

### Indicadores de Continuidade
- **Testes BC/DR Realizados:** 2 testes em 2024 (meta: 2/ano)
- **RTO Atingido:** 100% dos testes (média: 2.5h, meta: <4h)
- **RPO Atingido:** 100% dos testes (média: 45min, meta: <1h)
- **Backups Validados:** 100% backups testados mensalmente

### Indicadores SOC2
- **Uptime:** 99.95% (SLA: 99.9%)
- **Controles Auditados:** 40 controles (100% aprovados em último audit)
- **Evidências Coletadas:** 180 evidências em últimos 3 meses
- **Non-Conformities:** 0 NCs em últimos 6 meses

---

## 🚨 Riscos e Non-Conformities

### Riscos Ativos
| ID | Risco | Severidade | Mitigação | Responsável | Prazo |
|----|-------|------------|-----------|-------------|-------|
| R-001 | [Descrição] | Alta | [Plano] | [Nome] | [Data] |

### Non-Conformities Abertas
| ID | Framework | NC | Ação Corretiva | Status | Prazo |
|----|-----------|-----|----------------|--------|-------|
| NC-001 | [Framework] | [Descrição] | [Ação] | Em Progresso | [Data] |

**Total Riscos:** 0 críticos, 2 altos, 5 médios, 8 baixos  
**Total NCs:** 0 abertas

---

## 📅 Cronograma de Atividades

### Próximos 3 Meses
- **Semana 1-2:** Auditoria interna ISO 27001
- **Semana 3-4:** Atualização de RTOs/RPOs
- **Semana 5-8:** Preparação para SOC2 Type II audit
- **Semana 9-12:** Teste anual de BC/DR

### Próximos 6 Meses
- **Q2 2025:** Certificação ISO 27001 oficial
- **Q2 2025:** Relatório SOC2 Type II final
- **Q3 2025:** Início preparação ISO 22301 certification

---

## 🔗 Due Diligence e Integrações

### Requisitos Atendidos
✅ **Serasa Experian** (8/8 requisitos):
- Plano de Continuidade de Negócios (ISO 22301)
- Plano de Recuperação de Desastres (ISO 22301)
- Plano de Gerenciamento de Crise (ISO 22301)
- Evidências de testes anuais BC/DR (ISO 22301)
- Política de backup/restauração com RTOs/RPOs (ISO 22301)
- Certificado/Relatório SOC2 (SOC2 Type II)
- Confirmação SLAs de Disponibilidade (SOC2)
- Documentação contratual SLAs (SOC2)

✅ **Bancos Parceiros** (requisitos comuns):
- ISO 27001 (SGSI implementado)
- ISO 22301 (BC/DR documentado)
- SOC2 Type II (em preparação para audit)

---

## 👥 Responsabilidades

### Ownership Matrix
| Área | Responsável | Revisor | Frequência Revisão |
|------|-------------|---------|-------------------|
| ISO 27001 | CISO / Security Team | CTO | Trimestral |
| ISO 22301 | DevOps Lead | CTO | Semestral |
| PMBOK | Engineering Manager | CTO | Anual |
| SOC2 | Compliance Officer | Auditoria Externa | Anual |

### Comitê de Compliance
- **Chair:** [Nome - Cargo]
- **Membros:** [Nomes e cargos]
- **Frequência:** Reuniões mensais
- **Responsabilidades:** Revisar métricas, aprovar mudanças, escalar riscos

---

**Última Atualização:** [Data]  
**Próxima Revisão Completa:** [Data + 3 meses]  
**Responsável pela Manutenção:** [Nome/Time]
```

---

## Guidelines de Idioma e Terminologia

### Estratégia de Idioma PT-BR

**CRITICAL: Language Strategy**

1. **Conteúdo Principal: PT-BR**
   - Parágrafos descritivos
   - Explicações de processos
   - Instruções e guidelines
   - Contexto organizacional

2. **Termos Técnicos: Preservar Original (EN-US)**
   - Siglas internacionais: SGSI, BCMS, BCP, DRP, TSC
   - Termos consagrados: Risk Assessment, Access Control, RTO, RPO
   - Nomes de frameworks: ISO 27001:2022, SOC2 Type II, PMBOK® 7th
   - Conceitos técnicos: Business Impact Analysis, Disaster Recovery

3. **Formato Híbrido (Primeira Menção):**
   ```markdown
   ## Risk Assessment (Avaliação de Riscos)
   
   O processo de Risk Assessment segue a metodologia ISO/IEC 27005:2022...
   ```

4. **Formato Subsequente:**
   ```markdown
   Os resultados do risk assessment indicam...
   (usar termo original, já traduzido anteriormente)
   ```

### Termos a Preservar por Framework

**ISO 27001:**
- Risk Assessment, Risk Treatment
- Access Control, Information Security Management System (ISMS)
- Statement of Applicability (SoA)
- Business Impact Analysis (BIA)
- Incident Response, Security Incident

**ISO 22301:**
- Business Continuity Plan (BCP), Business Continuity Management System (BCMS)
- Disaster Recovery Plan (DRP), Disaster Recovery
- Recovery Time Objective (RTO), Recovery Point Objective (RPO)
- Maximum Tolerable Period of Disruption (MTPD)
- Business Impact Analysis (BIA)
- Crisis Management, Resilience Testing

**SOC2:**
- Trust Services Criteria (TSC), Trust Services Principles
- Type II Report, Type II Audit
- Control Environment, Control Activities
- Continuous Monitoring, Attestation Report
- Service Organization Control (SOC)

**PMBOK:**
- Change Management, Quality Management
- Stakeholder Management, Project Governance
- Project Charter, Work Breakdown Structure (WBS)
- Project Management Office (PMO)

---

## Integration with Due Diligence

### Due Diligence Response Structure

Quando `due-diligence` mode é usado, criar diretório adicional:

**Create: `docs/compliance/due-diligence/[cliente]-response.md`**
```markdown
# Resposta Due Diligence - [Nome do Cliente]

*Documentação estruturada para requisitos de Due Diligence*

---

## Requisitos Solicitados

### 1. [Requisito 1 do Cliente]
**Framework Aplicável:** [ISO 27001 / ISO 22301 / SOC2 / PMBOK]  
**Documento de Referência:** [Link para documento específico]

**Resposta:**
[Resposta estruturada baseada na documentação gerada]

**Evidências:**
- [Lista de evidências disponíveis]

---

### 2. [Requisito 2 do Cliente]
[Repetir estrutura acima]

---

## Documentos Anexos

Todos os documentos referenciados estão disponíveis em:
- `docs/compliance/[framework]/` (documentação detalhada)
- `docs/technical-context/` (evidências técnicas)
- `docs/business-context/` (contexto organizacional)

---

**Data de Resposta:** [Data]  
**Responsável:** [Nome]  
**Contato:** [Email/Tel]
```

---

## Master Agent Instructions

**Para `@security-information-master`:**

Quando delegar geração de documentação de compliance:

1. **Leia este template** para entender estrutura base
2. **Leia templates específicos** para cada framework selecionado
3. **Crie estrutura de diretórios:**
   ```bash
   mkdir -p docs/compliance/{security,business-continuity,project-management,soc2,due-diligence}
   ```
4. **Gere arquivos base primeiro:**
   - `docs/compliance/index.md`
   - `docs/compliance/COMPLIANCE_OVERVIEW.md`
5. **Delegue para specialists:**
   - `@iso-27001-specialist` → `docs/compliance/security/`
   - `@iso-22301-specialist` → `docs/compliance/business-continuity/`
   - `@pmbok-specialist` → `docs/compliance/project-management/`
   - `@soc2-specialist` → `docs/compliance/soc2/`
6. **Consolide outputs:**
   - Atualizar `index.md` com links para todos documentos gerados
   - Atualizar `COMPLIANCE_OVERVIEW.md` com métricas e status
   - Criar cross-references entre frameworks quando aplicável
7. **Se Due Diligence mode:**
   - Criar `docs/compliance/due-diligence/[cliente]-response.md`
   - Mapear requisitos para documentos específicos

---

## Success Criteria

Documentação de compliance bem-sucedida deve:
- ✅ Ser modular e multi-arquivo (não um arquivo único gigante)
- ✅ Estar em PT-BR com termos técnicos preservados
- ✅ Cobrir todos frameworks selecionados completamente
- ✅ Incluir cross-references entre frameworks relacionados
- ✅ Ter index.md navegável e COMPLIANCE_OVERVIEW.md informativo
- ✅ Mapear requisitos de Due Diligence (se aplicável)
- ✅ Ser auditável por terceiros
- ✅ Refletir implementação técnica real da organização

---

**Última Atualização do Template:** 2025-06-03  
**Versão:** 1.0  
**Mantido por:** Sistema Onion - Compliance Team

