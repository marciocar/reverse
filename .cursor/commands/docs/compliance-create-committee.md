# Criar Comitê de Compliance/IA

Comando para criar comitês de compliance (1-compliance) ou IA (2-ia) a partir dos templates disponíveis, com documentação personalizada.

## Objetivo

Gerar automaticamente estrutura de comitê com todos os documentos e modelos necessários, permitindo seleção entre:
- **Comitê de Compliance** (templates de `1-compliance/`)
- **Comitê de IA** (templates de `2-ia/`)

## Sintaxe

```bash
/docs/compliance/create-committee type=ia
/docs/compliance/create-committee type=compliance
```

## Parâmetros

| Parâmetro | Valores | Descrição |
|-----------|---------|-----------|
| `type` | `ia` \| `compliance` | Tipo de comitê a criar |

## Fluxo de Execução

### 1. Validação de Parâmetro
```
Input: type=ia
  ✓ Valida se 'ia' ou 'compliance'
  ✗ Rejeita valores inválidos com erro claro
```

### 2. Selecionar Templates
```
type=ia → .cursor/docs/templates/compliance/governance/templates/comites/2-ia/
  ✓ matriz-risco-ia.md
  ✓ pauta-trimestral-ia.md
  ✓ regimento-comite-ia.md
  ✓ relatorio-auditoria-ia.md
  ✓ relatorio-trimestral-monitoramento-ia.md
  ✓ ata-reuniao-ia.md
  ✓ formulario-aprovacao-modelo-ia.md (7 arquivos)

type=compliance → .cursor/docs/templates/compliance/governance/templates/comites/1-compliance/
  ✓ relatorio-anual-compliance.md
  ✓ formulario-decisao-coaf.md
  ✓ matriz-responsabilidades-compliance.md
  ✓ pauta-trimestral-compliance.md
  ✓ regimento-comite-compliance.md
  ✓ ata-reuniao-compliance.md (6 arquivos)
```

### 3. Substituir Placeholders
```
Lê dados de .compliance-config.json (se existir)
  • {{COMPANY_NAME}}
  • {{COMPANY_DOMAIN}}
  • {{CISO_NAME}}
  • {{CTO_NAME}}
  • Etc...
```

### 4. Gerar Estrutura
```
governance/comites/{tipo}/
├── regimento-comite-*.md
├── pauta-trimestral-*.md
├── ata-reuniao-*.md
├── matriz-responsabilidades-*.md (if compliance)
├── matriz-risco-*.md (if ia)
├── relatorio-*.md
└── formulario-*.md
```

### 5. Output
```
✅ [TIPO] Comitê criado com X documentos
   Localização: governance/comites/{tipo}/
   Documentos: [LISTA]
```

## Exemplos

### Exemplo 1: Criar Comitê de IA
```bash
/docs/compliance/create-committee type=ia
```

**Output:**
```
✅ Comitê de IA criado com 7 documentos

Documentos criados:
  • matriz-risco-ia.md
  • pauta-trimestral-ia.md
  • regimento-comite-ia.md
  • relatorio-auditoria-ia.md
  • relatorio-trimestral-monitoramento-ia.md
  • ata-reuniao-ia.md
  • formulario-aprovacao-modelo-ia.md

Localização: governance/comites/2-ia/

Próximos passos:
  1. Revisar regimento-comite-ia.md
  2. Personalizados nomes e datas em matriz-risco-ia.md
  3. Usar pauta-trimestral-ia.md como modelo para reuniões
```

### Exemplo 2: Criar Comitê de Compliance
```bash
/docs/compliance/create-committee type=compliance
```

**Output:**
```
✅ Comitê de Compliance criado com 6 documentos

Documentos criados:
  • relatorio-anual-compliance.md
  • formulario-decisao-coaf.md
  • matriz-responsabilidades-compliance.md
  • pauta-trimestral-compliance.md
  • regimento-comite-compliance.md
  • ata-reuniao-compliance.md

Localização: governance/comites/1-compliance/
```

## Dependências

- Templates em: `.cursor/docs/templates/compliance/governance/templates/comites/`
- Config (opcional): `.compliance-config.json`
- Estrutura existente: `governance/`

## Validações

- ✓ Valida tipo de comitê (ia/compliance)
- ✓ Verifica se templates existem
- ✓ Cria estrutura se não existir
- ✓ Confirma antes de sobrescrever

## Integrações

- Fase 5: Integrado no `build-compliance-docs.md`
- Fase 4: Usa dados de `.compliance-config.json` para substituição

## Status MVP

- ✅ Estrutura base funcional
- ✅ Cópia de templates
- ✅ Substituição de placeholders (básica)
- ⏳ Validações avançadas (fase futura)
