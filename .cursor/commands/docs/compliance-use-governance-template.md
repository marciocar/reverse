# Usar Template de Governance

Comando para aplicar templates de governance específicos por tipo, permitindo seleção entre múltiplos conjuntos de templates organizados.

## Objetivo

Aplicar templates de governance de um tipo específico (ai-governance, formularios, termos, etc.) substituindo placeholders {{}} com dados da organização.

## Sintaxe

```bash
/docs/compliance/use-governance-template type=formularios
/docs/compliance/use-governance-template type=ai-governance
/docs/compliance/use-governance-template type=termos
```

## Parâmetros

| Parâmetro | Valores | Descrição |
|-----------|---------|-----------|
| `type` | Ver tabela abaixo | Tipo de template de governance |

## Tipos de Templates Disponíveis

| Type | Localização | Propósito | Arquivos |
|------|-------------|----------|----------|
| `ai-governance` | `governance/templates/ai-governance/` | Governança de IA | ~3-5 templates |
| `calendarios` | `governance/templates/calendarios/` | Calendários de conformidade | ~2 templates |
| `checklists` | `governance/templates/checklists/` | Checklists operacionais | ~3-5 templates |
| `formularios` | `governance/templates/formularios/` | Formulários de aprovação | ~4-6 templates |
| `termos` | `governance/templates/termos/` | Termos e adesões | ~2-3 templates |
| `treinamento` | `governance/templates/treinamento/` | Materiais de treinamento | ~3-5 templates |

## Fluxo de Execução

### 1. Validação de Tipo
```
Input: type=formularios
  ✓ Valida se tipo existe
  ✗ Rejeita valores inválidos
  ✓ Lista tipos disponíveis em caso de erro
```

### 2. Carregar Templates
```
governance/templates/{type}/*.md
  ✓ Encontra todos os arquivos markdown
  ✓ Valida estrutura
```

### 3. Substituir Placeholders
```
Lê dados de .compliance-config.json
  • {{COMPANY_NAME}}
  • {{COMPANY_DOMAIN}}
  • {{COMPLIANCE_EMAIL}}
  • {{CTO_NAME}}
  • {{LAST_UPDATED}}
  • Etc...
```

### 4. Gerar Documentos
```
governance/{type}/
├── documento1.md (com placeholders substituídos)
├── documento2.md (com placeholders substituídos)
└── documentoN.md
```

### 5. Output
```
✅ Templates de {type} aplicados com sucesso
   Total de documentos: X
   Localização: governance/{type}/
```

## Exemplos

### Exemplo 1: Aplicar Templates de Formulários
```bash
/docs/compliance/use-governance-template type=formularios
```

**Output:**
```
✅ Templates de formularios aplicados com sucesso

Documentos criados/atualizados:
  • declaracao-anual-conflito-interesses.md
  • declaracao-pontual-conflito-interesses.md
  • kyc-pj-matriz-risco-pld.md
  • README.md

Total: 4 documentos
Localização: governance/formularios/

Próximos passos:
  1. Revisar README.md para entender cada formulário
  2. Personalizar nomes de revisores em declaracao-anual-*
  3. Integrar com sistema de aprovações
```

### Exemplo 2: Aplicar Templates de Termos
```bash
/docs/compliance/use-governance-template type=termos
```

**Output:**
```
✅ Templates de termos aplicados com sucesso

Documentos criados/atualizados:
  • termo-adesao-codigo-conduta.md
  • termo-ciencia-politicas-compliance.md
  • README.md

Total: 3 documentos
Localização: governance/termos/
```

### Exemplo 3: Aplicar Templates de IA Governance
```bash
/docs/compliance/use-governance-template type=ai-governance
```

**Output:**
```
✅ Templates de ai-governance aplicados com sucesso

Documentos criados/atualizados:
  • politica-ia-desenvolvimento.md
  • matriz-risco-modelos-ia.md
  • checklist-auditoria-ia.md

Total: 3 documentos
Localização: governance/ai-governance/
```

## Tipos Explicados

### 🤖 ai-governance
Documentação para governança de modelos de IA:
- Políticas de desenvolvimento
- Matriz de risco
- Checklists de auditoria
- Avaliações de bias

### 📅 calendarios
Calendários e cronogramas:
- Calendário anual de compliance
- Cronograma de treinamentos
- Cronograma de auditorias

### ✅ checklists
Checklists operacionais:
- Checklist de investigação de denúncias
- Checklist de auditoria interna
- Checklist de conformidade

### 📋 formularios
Formulários para aprovações e decisões:
- Declaração de conflito de interesses
- Formulários de aprovação
- Matriz de risco (PLD/AML)

### 📄 termos
Termos de adesão e conformidade:
- Termo de adesão ao código de conduta
- Termo de ciência de políticas
- Termos gerais

### 📚 treinamento
Materiais de treinamento:
- Sumários de políticas
- FAQs consolidadas
- Guias de conformidade

## Dependências

- Templates em: `.cursor/docs/templates/compliance/governance/templates/`
- Config (opcional): `.compliance-config.json`
- Estrutura de governance existente

## Validações

- ✓ Valida tipo de template
- ✓ Verifica se templates existem
- ✓ Valida placeholders
- ✓ Cria estrutura se necessário
- ✓ Confirma antes de sobrescrever

## Integrações

- Fase 3: Comando standalone
- Fase 5: Integrado no `build-compliance-docs.md`
- Fase 4: Usa dados de `.compliance-config.json`

## Status MVP

- ✅ Suporte a 6 tipos
- ✅ Substituição de placeholders
- ✅ Cópia de templates
- ⏳ Validações personalizadas por tipo (fase futura)
