# Architecture - Refatorar Sistema de Compliance para Templates Genéricos

## 🎯 Visão Geral (MVP - Fluxo Funcionando)

### **Antes (Estado Atual)**
```
Sistema de compliance específico para Granaai
├── 68 arquivos com 569 referências hardcoded "Granaai"
├── build-compliance-docs.md que gera docs específicos
└── Templates que assumem infraestrutura Granaai
```

### **Depois (Novo Sistema)**
```
Sistema genérico reutilizável
├── Templates com placeholders {{VARIABLE}}
├── Questionário interativo coleta dados da organização
├── build-compliance-docs.md reescrito (fluxo limpo)
└── Qualquer organização pode gerar docs personalizados
```

---

## 🏗️ Componentes e Arquitetura

### **Componentes Principais (MVP)**

**Fase 1-2 (Sequencial)**: Generalizar + Corrigir Links
- 68 arquivos compliance → com placeholders {{}}
- Criar estrutura docs/business-context/ + docs/technical-context/
- Validar 0 links quebrados

**Fase 3-4 (Paralelo)**: Comandos + Questionário
- 3 novos comandos: create-committee, use-governance-template, apply-template-set
- Questionário interativo → .compliance-config.json
- Geração automática de contextos (business + technical)

**Fase 5 (Integração)**: Build Command
- Reescrever build-compliance-docs.md (novo fluxo limpo)
- Orquestrar Fases 3-4 + substituição de placeholders
- Modo --dry-run para preview

---

## 📋 Placeholders a Generalizar (MVP - Tipos 1-3)

### **Tipo 1: Nome da Empresa**
```
Antes:  "Granaai", "Grana.ai"
Depois: "{{COMPANY_NAME}}"
```

### **Tipo 2: Domínio/URLs**
```
Antes:  "grana.ai", "https://grana.ai", "grana.com"
Depois: "{{COMPANY_DOMAIN}}"
```

### **Tipo 3: Pessoas/Roles**
```
Antes:  "CTO da Granaai", "CISO Marcio"
Depois: "{{CTO_NAME}}", "{{CISO_NAME}}"
```

**NÃO Generalizar (MVP):**
- Infraestrutura específica (AWS accounts, etc) - deixar ou remover contexto
- Metadados históricos (data de geração) - apenas remover

---

## 🔄 Fluxo de Execução End-to-End

### **Executar:**
```bash
/docs/build-compliance frameworks="iso27001,soc2"
```

### **Fluxo Automático:**
1. Checar `.compliance-config.json`
   - Se não existe: abrir questionário interativo
   - Se existe: usar dados salvos
   
2. Aplicar Fases 3-4 (paralelo)
   - Gerar business-context/ (company-profile, industry-overview, stakeholder-map)
   - Gerar technical-context/ (ARCHITECTURE, infrastructure, stack-summary)
   - Criar comitês (se aplicável)
   
3. Aplicar Fase 5 (integração)
   - Carregar dados de .compliance-config.json
   - Criar mapeamento: {{PLACEHOLDER}} → valor real
   - Substituir placeholders em todos os arquivos
   - Gerar docs personalizados em compliance/
   
4. Output:
   ```
   ✅ 50 arquivos gerados
   ✅ 0 placeholders não substituídos
   ✅ Documentação pronta para auditar
   ```

---

## 📊 Datasets para Teste (MVP)

### **Dataset 1: FinTech (Simples)**
```json
{
  "company": {
    "name": "FinTech Pro",
    "domain": "fintechpro.com",
    "industry": "Fintech",
    "teamSize": 15
  },
  "infrastructure": {
    "cloudProvider": "AWS",
    "stackSummary": "Node.js + React + MongoDB",
    "sensitiveData": ["PII", "Financial Data"]
  },
  "compliance": {
    "frameworks": ["iso27001", "soc2"],
    "deadline": "2025-12-31"
  }
}
```

### **Dataset 2: SaaS B2B (Complexo)**
```json
{
  "company": {
    "name": "CloudScale",
    "domain": "cloudscale.io",
    "industry": "SaaS",
    "teamSize": 45
  },
  "infrastructure": {
    "cloudProvider": "GCP",
    "stackSummary": "Go + React + PostgreSQL + Kafka",
    "sensitiveData": ["Customer Data", "PII", "Business Secrets"]
  },
  "compliance": {
    "frameworks": ["iso27001", "iso22301", "soc2"],
    "deadline": "2025-10-30"
  }
}
```

---

## 🛠️ Arquivos a Criar/Modificar

### **Fase 1: Generalização (3 dias)**
- 🔄 Modificar: `.cursor/commands/docs/compliance/index.md` (remover refs Granaai)
- 🔄 Modificar: `.cursor/commands/docs/compliance/README.md` (guia placeholders)
- 🔄 Modificar: `security/*.md` (5 arquivos)
- 🔄 Modificar: `business-continuity/*.md` (5 arquivos)
- 🔄 Modificar: `soc2/*.md` (4 arquivos)
- 🔄 Modificar: `governance/*.md` (26 arquivos + templates)

### **Fase 2: Links e Estrutura (2 dias)**
- ➕ Criar: `docs/business-context/` (4 templates)
- ➕ Criar: `docs/technical-context/` (4 templates)
- 🔄 Atualizar: cross-references entre documentos

### **Fase 3-4: Comandos + Questionário (3 dias paralelo)**
- ➕ Criar: `.cursor/commands/docs/compliance-create-committee.md`
- ➕ Criar: `.cursor/commands/docs/compliance-use-governance-template.md`
- ➕ Criar: `.cursor/commands/docs/compliance-apply-template-set.md`
- ➕ Criar: `.cursor/commands/docs/compliance-collect-organization-info.md`
- ➕ Criar: `.cursor/commands/docs/compliance-generate-business-context.md`
- ➕ Criar: `.cursor/commands/docs/compliance-generate-technical-context.md`

### **Fase 5: Build Command (2 dias)**
- 🔄 Reescrever: `.cursor/commands/build-compliance-docs.md` (novo fluxo)
- ➕ Criar: `.compliance-config.json` (gerado por questionário)

---

## ⚙️ Substituição de Placeholders (Automática + Confirmação)

**Passo 1**: Detectar todos os {{}} nos templates
**Passo 2**: Criar mapeamento automático de .compliance-config.json
**Passo 3**: Mostrar preview de substituição para usuário confirmar
**Passo 4**: Substituir + validar 0 placeholders não substituídos

**Exemplo Preview:**
```
PREVIEW DE SUBSTITUIÇÃO
━━━━━━━━━━━━━━━━━━━━━━━━

Detectados 45 placeholders:
  • {{COMPANY_NAME}} → "FinTech Pro" (5x) ✓
  • {{COMPANY_DOMAIN}} → "fintechpro.com" (3x) ✓
  • {{CTO_NAME}} → "João Silva" (2x) ✓

Faltando:
  ❓ {{BACKUP_FREQUENCY}} - definir valor

Prosseguir? [y/n]
```

---

## 🧪 Testes (MVP - Happy Path)

1. **Teste Generalização**: 0 refs "Granaai" (grep)
2. **Teste Dataset 1**: FinTech + frameworks simples → gerado correto
3. **Teste Dataset 2**: SaaS + frameworks completo → gerado correto
4. **Teste Links**: 0 links quebrados em docs/

---

## 📝 Restrições e Suposições

### **Restrições (MVP)**
- Apenas tipos 1-3 de placeholders
- Sem compatibilidade retroativa (reescrever OK)
- Fluxo funcionando é prioridade > perfeição

### **Suposições**
- Usuário valida dados pós-geração
- Questionário coleta dados corretos
- Testes com dados fictícios suficientes para MVP
