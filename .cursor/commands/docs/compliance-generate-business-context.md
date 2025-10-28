# Gerar Business Context

Comando para gerar documentação de **Business Context** automaticamente a partir dos templates e dados coletados via questionário.

## Objetivo

Transformar templates genéricos de contexto de negócio (em `.cursor/docs/templates/compliance/contexts/business-context/`) em documentação **REAL** dentro de `docs/business-context/`, substituindo todos os placeholders {{}} com dados da organização.

## Sintaxe

```bash
/docs/compliance/generate-business-context
/docs/compliance/generate-business-context --review
/docs/compliance/generate-business-context --force
```

## Parâmetros e Flags

| Flag | Descrição |
|------|-----------|
| `--review` | Modo interativo: confirma cada substituição |
| `--force` | Sobrescreve sem confirmar |
| `--dry-run` | Mostra o que seria gerado sem salvar |

## Pré-requisitos

- ✅ `.compliance-config.json` deve existir (criado por `collect-organization-info`)
- ✅ Templates em `.cursor/docs/templates/compliance/contexts/business-context/`

## Fluxo de Execução

### 1. Validar Pré-requisitos
```
Verifica:
  ✓ Se .compliance-config.json existe
  ✓ Se templates existem
  ✗ Se faltam dados: lista quais
```

### 2. Carregar Dados da Organização
```
Lê .compliance-config.json:
  • Nome da empresa
  • Domínio
  • Setor
  • Tamanho da equipe
  • Faturamento
  • Pessoas-chave
  • Riscos
```

### 3. Carregar Templates
```
.cursor/docs/templates/compliance/contexts/business-context/
  ✓ README.md
  ✓ company-profile.md
  ✓ industry-overview.md
  ✓ stakeholder-map.md
```

### 4. Substituir Placeholders

```
Para cada template, substitui:
  {{COMPANY_NAME}} → "Acme Corp"
  {{COMPANY_DOMAIN}} → "acme.com"
  {{INDUSTRY}} → "Fintech"
  {{TEAM_SIZE}} → "51-200"
  {{REVENUE}} → "$1M-10M"
  {{GROWTH_RATE}} → "50-100%"
  {{CTO_NAME}} → "João Silva"
  {{CISO_NAME}} → "Maria Santos"
  {{COMPLIANCE_OFFICER_NAME}} → "Carlos Oliveira"
  {{LAST_UPDATED}} → "2025-10-28"
  [+ todas as variáveis disponíveis]
```

### 5. Gerar Documentos em `docs/business-context/`

```
docs/business-context/
├── README.md (com índice)
├── company-profile.md (perfil personalizado)
├── industry-overview.md (contexto do setor)
└── stakeholder-map.md (mapa de stakeholders)
```

### 6. Output e Confirmação

```
✅ Business Context gerado com sucesso!

Documentos criados:
  • docs/business-context/README.md
  • docs/business-context/company-profile.md
  • docs/business-context/industry-overview.md
  • docs/business-context/stakeholder-map.md

Total: 4 documentos
Tamanho: ~15 KB

Próximos passos:
  1. Revisar docs/business-context/
  2. Executar /docs/compliance/generate-technical-context
  3. Executar build-compliance-docs para orquestração completa
```

## Exemplos

### Exemplo 1: Geração Automática
```bash
/docs/compliance/generate-business-context
```

**Output:**
```
🔄 Carregando configuração...
  ✓ .compliance-config.json carregado

🔄 Validando templates...
  ✓ 4 templates encontrados
  ✓ Estrutura validada

🔄 Processando substituições...
  ✓ company-profile.md (8 placeholders substituídos)
  ✓ industry-overview.md (5 placeholders substituídos)
  ✓ stakeholder-map.md (3 placeholders substituídos)
  ✓ README.md (2 placeholders substituídos)

📝 Gerando documentos...
  ✓ docs/business-context/company-profile.md (criado)
  ✓ docs/business-context/industry-overview.md (criado)
  ✓ docs/business-context/stakeholder-map.md (criado)
  ✓ docs/business-context/README.md (criado)

✅ Business Context gerado com sucesso!
Total: 4 documentos
```

### Exemplo 2: Modo Review (Interativo)
```bash
/docs/compliance/generate-business-context --review
```

**Output:**
```
🔄 Modo Review ativado - confirme cada substituição

Processando: company-profile.md

Placeholder: {{COMPANY_NAME}}
  Template: "A {{COMPANY_NAME}} é uma empresa..."
  Substituir por: "Acme Corp"
  [y/n] y

Placeholder: {{INDUSTRY}}
  Template: "...atua no setor de {{INDUSTRY}}..."
  Substituir por: "Fintech"
  [y/n] y

[... mais substituições ...]

✅ Geração concluída com confirmações
```

### Exemplo 3: Dry-Run
```bash
/docs/compliance/generate-business-context --dry-run
```

**Output:**
```
🔍 DRY-RUN MODE - Nenhum arquivo será salvo

Processaria:
  ✓ docs/business-context/README.md
  ✓ docs/business-context/company-profile.md
  ✓ docs/business-context/industry-overview.md
  ✓ docs/business-context/stakeholder-map.md

Total de placeholders que seriam substituídos: 18
Nenhum arquivo foi salvo (dry-run)

Execute sem --dry-run para gerar realmente.
```

## Exemplos de Saída Gerada

### company-profile.md (gerado)
```markdown
# Perfil da Empresa

## Informações Básicas

- **Nome**: Acme Corp
- **Domínio**: acme.com
- **Setor**: Fintech
- **Localização**: Brasil
- **Fundação**: [ano]

## Tamanho e Escala

- **Equipe**: 51-200 pessoas
- **Faturamento Anual**: $1M-10M USD
- **Taxa de Crescimento**: 50-100% ao ano

## Estrutura Organizacional

### Liderança Técnica
- **CTO**: João Silva (joao@acme.com)
- **CISO**: Maria Santos (maria@acme.com)
- **Compliance Officer**: Carlos Oliveira (carlos@acme.com)

## Operações Críticas

[Baseado em dados coletados]
```

### stakeholder-map.md (gerado)
```markdown
# Mapa de Stakeholders

## Stakeholders Internos

### Tecnologia
- **CTO**: João Silva - Decisões arquiteturais

### Segurança e Compliance
- **CISO**: Maria Santos - Políticas de segurança
- **Compliance Officer**: Carlos Oliveira - Regulações

[... mais stakeholders ...]
```

## Validações

- ✓ Valida se `.compliance-config.json` existe
- ✓ Valida se templates existem
- ✓ Valida se todos os placeholders podem ser substituídos
- ✓ Cria diretório se não existir
- ✓ Confirma antes de sobrescrever (exceto com --force)

## Placeholders Suportados

Baseados em `.compliance-config.json`:

```
Organizacional:
  {{COMPANY_NAME}}
  {{COMPANY_DOMAIN}}
  {{INDUSTRY}}
  {{TEAM_SIZE}}
  {{REVENUE}}
  {{GROWTH_RATE}}

Pessoas:
  {{CTO_NAME}}, {{CTO_EMAIL}}
  {{CISO_NAME}}, {{CISO_EMAIL}}
  {{COMPLIANCE_OFFICER_NAME}}, {{COMPLIANCE_OFFICER_EMAIL}}
  {{EMAIL_CONTATO_PRINCIPAL}}

Dados e Riscos:
  {{TIPOS_DADOS}} (joinado)
  {{OPERACOES_CRITICAS}} (joinado)
  {{REGULACOES}} (joinado)

Metadata:
  {{LAST_UPDATED}}
  {{GENERATION_DATE}}
```

## Dependências

- `.compliance-config.json` (criado por `collect-organization-info`)
- Templates em `.cursor/docs/templates/compliance/contexts/business-context/`

## Integrações

- **Fase 4a**: Requisita dados de `collect-organization-info`
- **Fase 4b**: Gera docs reais em `docs/business-context/` ← **VOCÊ ESTÁ AQUI**
- **Fase 4c**: Precisa rodar antes de `generate-technical-context`
- **Fase 5**: Integrado em `build-compliance-docs`

## Status MVP

- ✅ Geração automática de 4 documentos
- ✅ Substituição de placeholders
- ✅ Validação de pré-requisitos
- ✅ Modo --review
- ✅ Modo --dry-run
- ⏳ Detecção automática de placeholders faltantes (fase futura)
- ⏳ Sugestões de valores (fase futura)

---

**Nota**: Após gerar Business Context, execute `/docs/compliance/generate-technical-context` para contexto técnico completo.
