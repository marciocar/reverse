# Implementation Plan - Refatorar Sistema de Compliance

## 🎯 Objetivo Geral
Transformar sistema de documentação de compliance específico da Granaai em sistema genérico e reutilizável baseado em templates.

---

## 📋 Fase 1: Generalização de Documentos (3 dias)

### Objetivos Específicos
- Eliminar 100% das referências específicas à Granaai
- Criar sistema de placeholders padronizado
- Garantir que templates sejam reutilizáveis para qualquer organização

### Implementação Detalhada

#### 1.1 Auditar Referências (4h)
```bash
# Buscar todas as referências
grep -ri "granaai\|grana\.ai" .cursor/commands/docs/compliance/ > audit-report.txt

# Análise:
# - 569 matches encontrados em 68 arquivos
# - Tipos de referência: nome da empresa, URLs, pessoas, infraestrutura
```

**Output Esperado**:
- Arquivo `audit-report.txt` com todas as referências
- Planilha de mapeamento (arquivo → linha → contexto → placeholder)

#### 1.2 Criar Dicionário de Placeholders (2h)
**Placeholders Padrão:**
```markdown
{{COMPANY_NAME}} - Nome da empresa (ex: "Granaai" → "{{COMPANY_NAME}}")
{{COMPANY_DOMAIN}} - Domínio (ex: "grana.ai" → "{{COMPANY_DOMAIN}}")
{{INDUSTRY}} - Setor (ex: "Fintech" → "{{INDUSTRY}}")
{{CTO_NAME}} - Nome do CTO
{{CISO_NAME}} - Nome do CISO
{{COMPLIANCE_OFFICER_NAME}} - Nome do Compliance Officer
{{CLOUD_PROVIDER}} - Provedor de cloud (ex: "AWS" → "{{CLOUD_PROVIDER}}")
{{STACK_SUMMARY}} - Resumo do stack técnico
{{TEAM_SIZE}} - Tamanho da equipe técnica
```

**Documentação:**
- Adicionar seção no `README.md` de compliance
- Criar guia de uso de placeholders

#### 1.3 Substituir Referências (12h)
**Estratégia de Substituição:**
```bash
# Substituição automatizada com validação manual
find .cursor/commands/docs/compliance -name "*.md" -exec sed -i 's/Granaai/{{COMPANY_NAME}}/gi' {} +
find .cursor/commands/docs/compliance -name "*.md" -exec sed -i 's/grana\.ai/{{COMPANY_DOMAIN}}/gi' {} +
```

**Arquivos Prioritários:**
1. `index.md` e `README.md`
2. `security/` (5 arquivos)
3. `business-continuity/` (5 arquivos)
4. `soc2/` (4 arquivos)
5. `governance/` (26 arquivos)
6. Templates de comitês (13 arquivos)

#### 1.4 Validação (2h)
```bash
# Busca final por referências não substituídas
grep -ri "granaai\|grana\.ai" .cursor/commands/docs/compliance/

# Resultado esperado: 0 matches
```

---

## 📋 Fase 2: Correção de Links (2 dias)

### Implementação Detalhada

#### 2.1 Auditar Links (3h)
```bash
# Encontrar todos os links markdown
grep -r "\[.*\](.*)" .cursor/commands/docs/compliance/ | grep -E "(business-context|technical-context)"
```

#### 2.2 Criar Estrutura business-context (2h)
```
docs/business-context/
├── README.md
├── company-profile.md
├── industry-overview.md
└── stakeholder-map.md
```

#### 2.3 Criar Estrutura technical-context (2h)
```
docs/technical-context/
├── README.md
├── ARCHITECTURE.md
├── infrastructure-overview.md
└── stack-summary.md
```

#### 2.4 Templates de Contexto (4h)
Criar templates com placeholders para cada arquivo de contexto.

---

## 📋 Fase 3: Comandos de Templates (3 dias)

### Implementação Detalhada

#### 3.1 Comando create-committee (6h)
**Localização**: `.cursor/commands/docs/compliance-create-committee.md`

**Sintaxe:**
```bash
/docs/compliance/create-committee type=ia
/docs/compliance/create-committee type=compliance
```

**Lógica:**
1. Validar parâmetro `type` (ia ou compliance)
2. Copiar templates de `.cursor/commands/docs/compliance/governance/templates/comites/{1-compliance ou 2-ia}/`
3. Substituir placeholders nos templates
4. Gerar estrutura no projeto destino

#### 3.2 Comando use-governance-template (4h)
**Sintaxe:**
```bash
/docs/compliance/use-governance-template type=formularios
/docs/compliance/use-governance-template type=termos
```

**Tipos Suportados:**
- ai-governance
- calendarios
- checklists
- comites
- formularios
- termos
- treinamento

#### 3.3 Comando apply-template-set (3h)
**Sintaxe:**
```bash
/docs/compliance/apply-template-set sets=formularios,termos,checklists
```

---

## 📋 Fase 4: Sistema de Questionário (3 dias)

### Implementação Detalhada

#### 4.1 Comando collect-organization-info (8h)
**Questionário Interativo:**

**Perfil Organizacional:**
1. Nome da empresa?
2. Setor de atuação?
3. Tamanho da equipe técnica?

**Infraestrutura:**
4. Provedor de cloud principal?
5. Stack tecnológico principal?
6. Tipos de dados sensíveis processados?

**Processos:**
7. CI/CD implementado? Qual ferramenta?
8. Frequência de backups?
9. Processo de gestão de incidentes formalizado?

**Objetivos de Compliance:**
10. Frameworks de interesse? (ISO 27001, ISO 22301, SOC2, etc.)
11. Prazo para conclusão da documentação?
12. Há auditoria/certificação prevista?

**Output:** `.compliance-config.json`

#### 4.2 Comando generate-business-context (4h)
Usar informações de `.compliance-config.json` para gerar:
- `docs/business-context/company-profile.md`
- `docs/business-context/industry-overview.md`
- `docs/business-context/stakeholder-map.md`

#### 4.3 Comando generate-technical-context (4h)
Usar informações + análise do código para gerar:
- `docs/technical-context/ARCHITECTURE.md`
- `docs/technical-context/infrastructure-overview.md`
- `docs/technical-context/stack-summary.md`

---

## 📋 Fase 5: Integração Build Command (2-3 dias)

### Implementação Detalhada

#### 5.1 Atualizar build-compliance-docs.md (6h)
**Novo Fluxo:**
```markdown
1. Verificar se `.compliance-config.json` existe
   - Se NÃO: executar `/docs/compliance/collect-organization-info`
   - Se SIM: carregar informações

2. Gerar business/technical context (se não existir)
   - `/docs/compliance/generate-business-context`
   - `/docs/compliance/generate-technical-context`

3. Detectar frameworks necessários (mantém lógica atual)

4. Gerar documentação de compliance com placeholders substituídos

5. Gerar comitês (se aplicável)

6. Aplicar templates de governance selecionados

7. Validar e reportar status
```

#### 5.2 Modo --dry-run (2h)
```bash
/docs/build-compliance frameworks="iso27001,soc2" --dry-run
```
Mostra preview sem executar.

#### 5.3 Validação de Placeholders (2h)
Após geração, buscar por placeholders não substituídos e alertar usuário.

---

## ✅ Checklist de Validação Final

### Documentação
- [ ] 0 referências "Granaai" em 68 arquivos
- [ ] Dicionário de placeholders documentado
- [ ] Todos os links funcionando

### Comandos
- [ ] create-committee testado (ia + compliance)
- [ ] use-governance-template testado (todos os tipos)
- [ ] apply-template-set testado
- [ ] collect-organization-info testado
- [ ] generate-business-context testado
- [ ] generate-technical-context testado

### Integração
- [ ] build-compliance-docs.md atualizado
- [ ] Fluxo end-to-end testado
- [ ] Modo --dry-run funcionando
- [ ] Validação de placeholders funcionando
- [ ] Relatório final gerado corretamente

---

**Estimativa Total**: 60-75 horas (12-15 dias)  
**Complexidade**: Alta  
**Dependências**: Sequencial (Fase 1 → 2 → 3 → 4 → 5)

