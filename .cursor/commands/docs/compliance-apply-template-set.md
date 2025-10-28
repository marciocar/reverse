# Aplicar Conjunto de Templates de Compliance

Comando para aplicar um conjunto **COMPLETO** de templates de compliance (Security, SOC2, Privacy, Business Continuity, etc.), com geração orquestrada e substituição automática de placeholders.

## Objetivo

Aplicar todos os templates de um domínio de compliance específico (compliance-set), gerando estrutura completa com documentação e sub-categorias correlatas.

## Sintaxe

```bash
/docs/compliance/apply-template-set domain=security
/docs/compliance/apply-template-set domain=soc2
/docs/compliance/apply-template-set domain=privacy
```

## Parâmetros

| Parâmetro | Valores | Descrição |
|-----------|---------|-----------|
| `domain` | Ver tabela | Domínio/Conjunto de compliance |

## Domínios Disponíveis

| Domain | Localização | Propósito | Sub-categorias |
|--------|-------------|----------|-----------------|
| `security` | `.cursor/docs/templates/compliance/domains/security/` | Segurança da informação | ~15 templates |
| `soc2` | `.cursor/docs/templates/compliance/domains/soc2/` | Conformidade SOC2 | ~12 templates |
| `privacy` | `.cursor/docs/templates/compliance/domains/privacy/` | Proteção de dados (LGPD) | ~14 templates |
| `business-continuity` | `.cursor/docs/templates/compliance/domains/business-continuity/` | Continuidade de negócios | ~8 templates |
| `ai-governance` | `.cursor/docs/templates/compliance/domains/ai-governance/` | Governança de IA | ~10 templates |
| `due-diligence` | `.cursor/docs/templates/compliance/domains/due-diligence/` | Avaliação de riscos | ~6 templates |
| `governance` | `.cursor/docs/templates/compliance/domains/governance/` | Estruturas de compliance | ~20+ templates |

## Fluxo de Execução

### 1. Validar Domínio
```
Input: domain=security
  ✓ Verifica se domínio existe
  ✓ Lista domínios disponíveis em caso de erro
```

### 2. Carregar Estrutura
```
.cursor/docs/templates/compliance/domains/{domain}/
  ✓ Encontra todos os arquivos .md
  ✓ Preserva hierarquia de pastas
  ✓ Valida estrutura
```

### 3. Ler Configuração
```
.compliance-config.json
  • {{COMPANY_NAME}}
  • {{INDUSTRY}}
  • {{TEAM_SIZE}}
  • {{SECURITY_OFFICER_NAME}}
  • {{LAST_ASSESSMENT_DATE}}
  • Etc... (automático)
```

### 4. Substituir Placeholders
```
Para cada arquivo:
  ✓ Lê conteúdo
  ✓ Identifica todos os {{PLACEHOLDER}}
  ✓ Substitui com dados da config
  ✓ Confirma substituições se --interactive
```

### 5. Gerar Documentos Orquestrados
```
docs/{domain}/
├── README.md (índice)
├── sub-categoria-1/
│   ├── documento1.md
│   ├── documento2.md
│   └── documentos...
├── sub-categoria-2/
│   ├── documento3.md
│   ├── documento4.md
│   └── documentos...
└── sub-categoria-N/
```

### 6. Gerar Relatório
```
✅ Templates de {domain} aplicados com sucesso
   Total de documentos: X
   Total de categorias: Y
   Localização: docs/{domain}/
   
Sumário:
   • sub-categoria-1: 3 documentos
   • sub-categoria-2: 4 documentos
   • sub-categoria-N: 2 documentos
```

## Exemplos

### Exemplo 1: Aplicar Conjunto de Security
```bash
/docs/compliance/apply-template-set domain=security
```

**Output:**
```
✅ Templates de security aplicados com sucesso

Estrutura criada:
  docs/security/
  ├── README.md
  ├── access-control/
  │   ├── politica-acesso.md
  │   ├── matriz-permissoes.md
  │   └── checklist-revisao-acesso.md
  ├── encryption/
  │   ├── politica-criptografia.md
  │   ├── matriz-dados-classificados.md
  │   └── guia-implementacao.md
  ├── incident-response/
  │   ├── plano-resposta-incidentes.md
  │   ├── matriz-severidade.md
  │   └── template-comunicacao-incidente.md
  └── [mais categorias...]

Total: 15 documentos em 5 categorias
Localização: docs/security/

Próximos passos:
  1. Revisar README.md para entender estrutura
  2. Personalizar nomes de responsáveis
  3. Integrar com processos existentes
```

### Exemplo 2: Aplicar Conjunto de Privacy (LGPD)
```bash
/docs/compliance/apply-template-set domain=privacy
```

**Output:**
```
✅ Templates de privacy aplicados com sucesso

Estrutura criada:
  docs/privacy/
  ├── README.md
  ├── data-mapping/
  │   ├── inventario-dados.md
  │   └── matriz-fluxos-dados.md
  ├── data-protection/
  │   ├── politica-protecao-dados.md
  │   ├── guia-privacidade-by-design.md
  │   └── checklist-dpia.md
  ├── consent-management/
  │   ├── politica-consentimento.md
  │   ├── registro-consentimentos.md
  │   └── template-aceite-cookies.md
  └── [mais categorias...]

Total: 14 documentos em 6 categorias
Localização: docs/privacy/
```

### Exemplo 3: Aplicar com Modo Interativo
```bash
/docs/compliance/apply-template-set domain=soc2 --interactive
```

**Output:**
```
✅ Modo interativo ativado

Processando: soc2/security/politica-acesso.md
  Placeholders encontrados:
    • {{COMPANY_NAME}} = "Acme Corp" [usar?] y
    • {{SECURITY_OFFICER_EMAIL}} = "" [informar?] security@acme.com
    • {{LAST_UPDATED}} = "" [usar data de hoje?] y

Processando: soc2/availability/rto-rpo.md
  ...

✅ Templates de soc2 aplicados com sucesso (modo interativo)
```

## Domínios Explicados

### 🔒 security
Políticas e procedimentos de segurança:
- Controle de acesso
- Criptografia
- Resposta a incidentes
- Backup e restauração

### ✓ soc2
Conformidade com SOC 2 Type II:
- Segurança (CC)
- Disponibilidade (A)
- Integridade (I)
- Confidencialidade (C)

### 👤 privacy
Conformidade com LGPD:
- Mapeamento de dados
- Consentimento
- Direitos do titular
- DPIA

### 🏢 business-continuity
Planos de continuidade:
- RTO/RPO
- Procedimentos de backup
- Testes de recuperação
- Matriz de criticidade

### 🤖 ai-governance
Governança de IA:
- Políticas de desenvolvimento
- Avaliação de risco
- Bias detection
- Auditoria de modelos

### 📋 due-diligence
Avaliação de riscos:
- Matriz de risco
- Avaliação de fornecedores
- Avaliação de conformidade
- Relatórios de avaliação

### 📚 governance
Estrutura geral de compliance:
- Políticas corporativas
- Comitês e responsabilidades
- Código de conduta
- Treinamento

## Dependências

- Templates em: `.cursor/docs/templates/compliance/domains/`
- Config (opcional): `.compliance-config.json`
- Permissões de escrita em: `docs/`

## Validações

- ✓ Valida domínio
- ✓ Verifica se templates existem
- ✓ Valida estrutura de templates
- ✓ Cria estrutura de output se necessário
- ✓ Confirma antes de sobrescrever (--force para skip)

## Flags Opcionais

| Flag | Descrição |
|------|-----------|
| `--interactive` | Modo interativo: confirma cada substituição |
| `--force` | Sobrescreve sem confirmar |
| `--dry-run` | Mostra o que seria feito sem fazer |
| `--verbose` | Output detalhado |

## Integrações

- Fase 3: Comando standalone
- Fase 5: Integrado no `build-compliance-docs.md`
- Fase 4: Usa dados de `.compliance-config.json`

## Status MVP

- ✅ Suporte a 7 domínios
- ✅ Substituição de placeholders
- ✅ Geração orquestrada
- ✅ Preservação de hierarquia
- ⏳ Modo --dry-run (fase futura)
- ⏳ Validações avançadas (fase futura)
