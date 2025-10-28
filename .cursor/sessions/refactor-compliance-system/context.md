# Task Context - Refatorar Sistema de Compliance para Templates Genéricos

## 📋 ClickUp Structure
**Task ID**: 86acw3zwm  
**Task URL**: https://app.clickup.com/t/86acw3zwm  
**Estimation**: 12-15 dias (60-75 horas)

## 🏗️ Decomposition Overview
**Pattern Used**: Tech Debt / Improvement  
**Subtasks**: 5 componentes funcionais  
**Action Items**: ~25 ações executáveis (5 por subtask)  
**Dependencies**: Sequencial (Fase 1 → Fase 2 → Fase 3 → Fase 4 → Fase 5)

## 🎯 Success Metrics
- 0 referências "Granaai" em documentação de compliance
- 100% dos links funcionando corretamente
- 6 novos comandos criados e testados
- Sistema de questionário interativo funcionando
- build-compliance-docs.md atualizado e integrado

## 🔧 Technical Context
**Affected Components**:
- `.cursor/commands/docs/compliance/` (68 arquivos)
- `.cursor/commands/build-compliance-docs.md`
- `.cursor/commands/common/templates/`
- `docs/business-context/` (a criar)
- `docs/technical-context/` (a criar)

**Stack/Technologies**:
- Markdown para documentação
- JSON para configuração (.compliance-config.json)
- Shell scripts para automação
- Git para versionamento

**Integration Points**:
- ClickUp MCP para tasks
- Comandos Cursor customizados
- Agentes especializados de compliance

## 📝 Implementation Strategy

### **Phase 1: Generalização de Documentos (3 dias)**
- Auditar todas as 569 referências "Granaai" em 68 arquivos
- Criar dicionário de placeholders padronizados
- Substituir referências por placeholders
- Validar generalização completa

### **Phase 2: Correção de Links e Estrutura (2 dias)**
- Auditar e corrigir todos os links quebrados
- Criar estrutura `docs/business-context/`
- Criar estrutura `docs/technical-context/`
- Atualizar cross-references entre documentos

### **Phase 3: Comandos de Templates (3 dias)**
- Criar comando `/docs/compliance/create-committee`
- Criar comando `/docs/compliance/use-governance-template`
- Criar comando `/docs/compliance/apply-template-set`
- Documentar e testar todos os comandos

### **Phase 4: Sistema de Questionário (3 dias)**
- Criar comando `/docs/compliance/collect-organization-info`
- Criar comando `/docs/compliance/generate-business-context`
- Criar comando `/docs/compliance/generate-technical-context`
- Implementar persistência em `.compliance-config.json`

### **Phase 5: Integração Build Command (2-3 dias)**
- Atualizar `build-compliance-docs.md` com novo fluxo
- Integrar chamadas aos novos comandos
- Adicionar modo `--dry-run`
- Criar validação de placeholders
- Implementar relatório final

## 🚀 Next Steps
1. Review structure in ClickUp: https://app.clickup.com/t/86acw3zwm
2. Execute: `/engineer/start refactor-compliance-system`
3. Follow implementation plan per phase
4. Update action items as completed
5. Validate with: `/product/task-check 86acw3zwm`

## 📚 Additional Resources
- Documentação de Compliance: `.cursor/commands/docs/compliance/`
- Templates Atuais: `.cursor/commands/docs/compliance/governance/templates/`
- Comando Build Atual: `.cursor/commands/build-compliance-docs.md`
- Template de Contexto: `.cursor/commands/common/templates/compliance_context_template.md`

---

**Created**: 2025-10-28  
**Pattern**: Tech Debt / Improvement  
**Branch**: feature/refactor-compliance-system-generalization  
**Session**: .cursor/sessions/refactor-compliance-system/

