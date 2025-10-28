# Construir Documentação de Compliance

Orquestrador principal para gerar **documentação de compliance completa** a partir de templates genéricos e dados da organização.

## 🎯 Objetivo

Executar fluxo end-to-end que:
1. Coleta dados da organização (questionário)
2. Gera documentação de contexto (business + técnico)
3. Aplica templates de compliance (por domínio)
4. Valida e consolida tudo em `docs/`

**Resultado Final**: Documentação pronta para auditorias, certificações e due diligence.

## 🚀 Sintaxe

```bash
# Modo Simples - Fluxo completo interativo
/docs/build-compliance-docs

# Modo Específico - Apenas um domínio
/docs/build-compliance-docs domain=security

# Modo Rápido - Questão rápida + templates
/docs/build-compliance-docs --quick

# Modo Teste - Usar dados fictícios predefinidos
/docs/build-compliance-docs --test-dataset=fintech
/docs/build-compliance-docs --test-dataset=saas-b2b
```

## 📊 Modos de Execução

### 1️⃣ Modo Completo (Padrão)

```bash
/docs/build-compliance-docs
```

**Fluxo:**
```
1. Coletar dados da organização
   /collect-organization-info
   ↓ Cria .compliance-config.json

2. Gerar contexto de negócio
   /generate-business-context
   ↓ Cria docs/business-context/ (4 docs)

3. Gerar contexto técnico
   /generate-technical-context --analyze
   ↓ Cria docs/technical-context/ (4 docs)

4. Aplicar templates de compliance
   ✓ Pergunta: Quais domínios aplicar?
   ✓ security, soc2, privacy, business-continuity, ai-governance, due-diligence, governance
   
   /apply-template-set domain=security
   /apply-template-set domain=soc2
   ...
   ↓ Cria docs/{domain}/ (múltiplos docs)

5. Validação Final
   ✓ Listar todos documentos criados
   ✓ Gerar índice consolidado
   ✓ Resumo do que foi gerado
```

**Output:**
```
✅ Documentação de Compliance Gerada!

Contextos Criados:
  • docs/business-context/ (4 documentos)
  • docs/technical-context/ (4 documentos)

Domínios Aplicados:
  • docs/security/ (15 documentos)
  • docs/soc2/ (12 documentos)
  • docs/privacy/ (14 documentos)
  [... mais conforme selecionado]

Total: 59 documentos
Localização: docs/

Próximos passos:
  1. Revisar docs/ para validar conteúdo
  2. Personalizar conforme necessário
  3. Usar para auditorias, certificações, due diligence
```

### 2️⃣ Modo Específico (Um Domínio)

```bash
/docs/build-compliance-docs domain=privacy
```

Gera apenas:
- `docs/privacy/` (14 documentos LGPD)
- Sem questionar outros domínios

### 3️⃣ Modo Rápido

```bash
/docs/build-compliance-docs --quick
```

Questão mínima + aplica templates frequentes:
- ✓ Nome da empresa (rápido)
- ✓ Domínios padrão: security, soc2

Útil para prototipagem rápida.

### 4️⃣ Modo Teste (Datasets Fictícios)

```bash
/docs/build-compliance-docs --test-dataset=fintech
/docs/build-compliance-docs --test-dataset=saas-b2b
```

Usa dados predefinidos sem questionar:

**Dataset Fintech** (Acme Fintech Inc):
```json
{
  "nome": "Acme Fintech Inc",
  "dominio": "acme-fintech.com",
  "setor": "Fintech",
  "tamanho_equipe": "51-200",
  "faturamento": "$1M-10M",
  "cloud_provider": "AWS",
  "regulacoes": ["LGPD", "SOC2", "PCI-DSS"]
}
```

**Dataset SaaS B2B** (TechFlow Systems):
```json
{
  "nome": "TechFlow Systems",
  "dominio": "techflow.com",
  "setor": "SaaS",
  "tamanho_equipe": "11-50",
  "faturamento": "$100k-1M",
  "cloud_provider": "GCP",
  "regulacoes": ["LGPD", "SOC2"]
}
```

## 🔗 Integração com 6 Comandos

```
┌─────────────────────────────────────────────────────────┐
│            build-compliance-docs (Orquestrador)          │
└─────────────────────────────────────────────────────────┘
         │
         ├─→ [1] collect-organization-info
         │       └─→ Cria .compliance-config.json
         │
         ├─→ [2] generate-business-context
         │       └─→ Cria docs/business-context/
         │
         ├─→ [3] generate-technical-context --analyze
         │       └─→ Cria docs/technical-context/
         │
         ├─→ [4] create-committee type=ia (opcional)
         │       └─→ Cria governance/comites/2-ia/
         │
         ├─→ [5] use-governance-template type=formularios (opcional)
         │       └─→ Cria governance/formularios/
         │
         └─→ [6] apply-template-set domain={x} (múltiplas)
                 └─→ Cria docs/{domain}/
```

## 📋 Parâmetros

| Parâmetro | Valores | Descrição |
|-----------|---------|-----------|
| `domain` | security, soc2, privacy, business-continuity, ai-governance, due-diligence, governance | Aplicar apenas um domínio |
| `--quick` | - | Modo rápido (questões mínimas) |
| `--test-dataset` | fintech, saas-b2b | Usar dados fictícios para teste |
| `--interactive` | - | Confirmar cada substituição de placeholder |
| `--force` | - | Sobrescrever sem confirmar |
| `--dry-run` | - | Mostrar o que seria feito |

## ✨ Exemplos

### Exemplo 1: Fluxo Completo Interativo

```bash
/docs/build-compliance-docs
```

**Output esperado:**
```
🎯 CONSTRUTOR DE COMPLIANCE DOCUMENTATION

📝 Fase 1: Coletar Dados
  Executando: /collect-organization-info
  
  Nome da Empresa: Acme Corp
  Domínio: acme.com
  ... [perguntas]
  
  ✅ Config salva em .compliance-config.json

📚 Fase 2: Gerar Contextos
  Gerando: /generate-business-context
  ✅ Criados 4 documentos em docs/business-context/
  
  Gerando: /generate-technical-context --analyze
  📊 Stack detectado: Python, Django, PostgreSQL, Kubernetes
  ✅ Criados 4 documentos em docs/technical-context/

🏛️ Fase 3: Aplicar Templates de Compliance

  Domínios disponíveis:
    1. security (Segurança da Informação)
    2. soc2 (Conformidade SOC2)
    3. privacy (Proteção de Dados - LGPD)
    4. business-continuity (Continuidade de Negócios)
    5. ai-governance (Governança de IA)
    6. due-diligence (Avaliação de Riscos)
    7. governance (Estrutura de Compliance)

  Selecione domínios [1,2,3,7]: 1,2,3,7
  
  Aplicando security...
  ✅ 15 documentos criados em docs/security/
  
  Aplicando soc2...
  ✅ 12 documentos criados em docs/soc2/
  
  Aplicando privacy...
  ✅ 14 documentos criados em docs/privacy/
  
  Aplicando governance...
  ✅ 20 documentos criados em docs/governance/

✅ DOCUMENTAÇÃO COMPLETA!

📊 Sumário:
  • Business Context: 4 docs
  • Technical Context: 4 docs
  • Security: 15 docs
  • SOC2: 12 docs
  • Privacy: 14 docs
  • Governance: 20 docs

  Total: 69 documentos em docs/

Próximos passos:
  1. cd docs/ && find . -name "*.md" | head
  2. Revisar README.md em cada domínio
  3. Personalizar com informações específicas da empresa
  4. Usar para auditorias, certificações, due diligence
```

### Exemplo 2: Teste com Dataset Fintech

```bash
/docs/build-compliance-docs --test-dataset=fintech
```

**Output:**
```
🎯 MODO TESTE: Fintech Startup

✅ Usando dados fictícios: Acme Fintech Inc
✅ .compliance-config.json carregado

📚 Gerando contextos...
  ✅ docs/business-context/
  ✅ docs/technical-context/ (AWS, Python, PostgreSQL)

🏛️ Aplicando templates (todos os domínios por ser fintech)...
  ✅ docs/security/
  ✅ docs/soc2/
  ✅ docs/privacy/ (LGPD + PCI-DSS)
  ✅ docs/business-continuity/
  ✅ docs/governance/

✅ Documentação de teste criada!
Total: 75 documentos

Use este output para:
  • Entender a estrutura
  • Testar integração
  • Ver exemplos de cada domínio
```

### Exemplo 3: Modo Rápido

```bash
/docs/build-compliance-docs --quick
```

**Output:**
```
⚡ MODO RÁPIDO

Nome da Empresa: [Sua Empresa]
  
✅ Aplicando templates padrão (security + soc2)...
  ✅ docs/business-context/ (4)
  ✅ docs/technical-context/ (4)
  ✅ docs/security/ (15)
  ✅ docs/soc2/ (12)

✅ Concluído: 35 documentos
```

## 🎯 Fluxo de Decisão

```
START
  ↓
┌─ --test-dataset? ─→ Usar dados fictícios ─→ Executar tudo
│                                              ↓
│                                         Fim ✅
│
└─ --quick? ─→ Questão mínima + templates padrão
             ↓
           Fim ✅

├─ domain={x}? ─→ Aplicar apenas um domínio
│               ↓
│             Fim ✅
│
└─ DEFAULT (Completo interativo)
          ↓
    1. collect-organization-info
          ↓
    2. generate-business-context
          ↓
    3. generate-technical-context
          ↓
    4. Perguntar: Quais domínios?
          ↓
    5. apply-template-set para cada
          ↓
    6. Validar + consolidar
          ↓
       Fim ✅
```

## ✅ Validações

- ✓ Verifica se `.compliance-config.json` existe (se necessário)
- ✓ Valida se todos os templates existem
- ✓ Confirma antes de sobrescrever arquivos
- ✓ Gera sumário final com contagem de documentos
- ✓ Cria índice consolidado em `docs/INDEX.md`

## 📁 Estrutura Final

```
docs/
├── business-context/
│   ├── README.md
│   ├── company-profile.md
│   ├── industry-overview.md
│   └── stakeholder-map.md
├── technical-context/
│   ├── README.md
│   ├── ARCHITECTURE.md
│   ├── infrastructure-overview.md
│   └── stack-summary.md
├── security/           (se selecionado)
│   ├── README.md
│   └── [15 documentos]
├── soc2/               (se selecionado)
│   ├── README.md
│   └── [12 documentos]
├── privacy/            (se selecionado)
│   ├── README.md
│   └── [14 documentos]
├── governance/         (se selecionado)
│   ├── README.md
│   └── [20+ documentos]
└── INDEX.md            (consolidado)
```

## 🚀 MVP Status

- ✅ Fluxo end-to-end funcional
- ✅ Integração de 6 comandos
- ✅ Modo teste com datasets fictícios
- ✅ Modo rápido para prototipagem
- ✅ Estrutura simplificada e clara
- ⏳ Validações avançadas (fase futura)
- ⏳ Geração de relatórios (fase futura)

---

**Nota**: Para fluxo completo com mais controle, use os comandos individuais:
- `/collect-organization-info`
- `/generate-business-context`
- `/generate-technical-context`
- `/apply-template-set`
- `/create-committee`
- `/use-governance-template`

