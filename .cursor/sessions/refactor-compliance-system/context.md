# Task Context - Refatorar Sistema de Compliance para Templates Genéricos

## 📋 ClickUp Structure
**Task ID**: 86acw3zwm  
**Task URL**: https://app.clickup.com/t/86acw3zwm  
**Estimation**: 8 dias (optimized MVP - vs 12-15 original)  
**Branch**: feature/refactor-compliance-system-generalization  
**Commit**: 328ffaa (Fase 1 complete)

## 🏗️ Decomposition Overview
**Pattern Used**: Tech Debt / Improvement  
**Subtasks**: 5 componentes funcionais  
**Fases**: 5 (com Fases 3-4 paralelas)
**Status**: Fase 1 ✅ Complete | Fase 2 ⏳ In Progress

## 📊 Phase-Subtask Mapping

### Fase 1: Generalização de Documentos ✅
**Subtask ID**: 86acw40b4  
**Status**: COMPLETE  
**Tempo Real**: < 1 hora (target: 3 dias)

**Ações Completadas:**
- ✅ Auditar 569 referências "Granaai" em 68 arquivos
- ✅ Criar dicionário de 10 placeholders
- ✅ Substituir 518 referências por placeholders em 46 arquivos
- ✅ Backup automático de todos os arquivos
- ✅ Commit: 328ffaa

**Resultados:**
- 344 ocorrências `{{COMPANY_NAME}}`
- 66 ocorrências `{{COMPANY_DOMAIN}}`
- 108 ocorrências `{{*_EMAIL}}` (8 tipos)

---

### Fase 2: Correção de Links e Estrutura ⏳
**Subtask ID**: 86acw40gv  
**Status**: IN PROGRESS  
**Tempo Estimado**: 2 dias

**Ações a Executar:**
- [ ] Auditar links quebrados para business-context e technical-context
- [ ] Criar estrutura `docs/business-context/` (4 templates)
- [ ] Criar estrutura `docs/technical-context/` (4 templates)
- [ ] Atualizar README.md com guia de placeholders
- [ ] Validar todos os links funcionando

---

### Fases 3-4: Templates + Questionário (PARALELO) ⏳
**Fases**: 3 e 4 (executam em paralelo)  
**Tempo Estimado**: 3 dias paralelo

#### Fase 3: Comandos de Templates
**Subtask ID**: 86acw40qp  
**Ações Estimadas:**
- [ ] Criar `.cursor/commands/docs/compliance-create-committee.md`
- [ ] Criar `.cursor/commands/docs/compliance-use-governance-template.md`
- [ ] Criar `.cursor/commands/docs/compliance-apply-template-set.md`

#### Fase 4: Sistema de Questionário
**Subtask ID**: 86acw40wu  
**Ações Estimadas:**
- [ ] Criar `.cursor/commands/docs/compliance-collect-organization-info.md`
- [ ] Criar `.cursor/commands/docs/compliance-generate-business-context.md`
- [ ] Criar `.cursor/commands/docs/compliance-generate-technical-context.md`

---

### Fase 5: Integração Build Command ⏳
**Subtask ID**: 86acw4148  
**Status**: PENDING  
**Tempo Estimado**: 2 dias

**Ações Estimadas:**
- [ ] Reescrever `.cursor/commands/build-compliance-docs.md`
- [ ] Integrar chamadas às Fases 3-4
- [ ] Modo `--dry-run` para preview
- [ ] Validação de placeholders não substituídos

---

## 🎯 Success Metrics (MVP)

- [x] 0 referências "Granaai" em tipos 1-3 (tipos 4 deixados para depois)
- [ ] 100% dos links funcionando
- [ ] 6 novos comandos criados e testados
- [ ] Sistema de questionário interativo funcionando
- [ ] build-compliance-docs.md atualizado e testado
- [ ] 2 datasets fictícios testados com sucesso

## 🔧 Technical Context

**Affected Components**:
- `.cursor/commands/docs/compliance/` (68 arquivos)
- `.cursor/commands/build-compliance-docs.md`
- `docs/business-context/` (a criar - Fase 2)
- `docs/technical-context/` (a criar - Fase 2)

**Placeholders Definidos (Fase 1)**:
```
{{COMPANY_NAME}} - Nome da empresa
{{COMPANY_DOMAIN}} - Domínio (ex: company.com)
{{SECURITY_EMAIL}} - Email de segurança
{{COMPLIANCE_EMAIL}} - Email de compliance
{{CISO_EMAIL}} - Email do CISO
{{CTO_EMAIL}} - Email do CTO
{{DEVOPS_EMAIL}} - Email de DevOps
{{HR_EMAIL}} - Email de RH
{{WHISTLEBLOWING_EMAIL}} - Email de denúncia
{{CONTACT_EMAIL}} - Email de contato
```

**Git Integration**:
- Branch: `feature/refactor-compliance-system-generalization`
- Ultimo commit: 328ffaa (Fase 1)
- Backups: `.cursor/sessions/refactor-compliance-system/backups/`

## 📝 Implementation Strategy

### Phase 1 (COMPLETE) ✅
Substituir 518 referências "Granaai" por 10 placeholders em 46 arquivos

### Phase 2 (IN PROGRESS) ⏳  
Auditar links + criar estrutura docs/business-context e docs/technical-context

### Phases 3-4 (PARALLEL - PENDING) ⏳
Criar 3 comandos de templates + 3 comandos de questionário

### Phase 5 (PENDING) ⏳
Reescrever build-compliance-docs.md com orquestração

## 🚀 Next Steps

1. ✅ Complete Fase 1
2. ⏳ Execute Fase 2: Links and Structure
3. ⏳ Execute Fases 3-4 in parallel: Commands + Questionnaire
4. ⏳ Execute Fase 5: Integration
5. ⏳ Test com 2 datasets fictícios

---

**Timeline**: 8 dias total (vs 12-15 original)  
**MVP Focus**: Fluxo funcionando > Perfeição  
**Last Updated**: 2025-10-28  
**Session**: .cursor/sessions/refactor-compliance-system/

