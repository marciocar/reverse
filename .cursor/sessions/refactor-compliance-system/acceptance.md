# Acceptance Criteria - Refatorar Sistema de Compliance

## 🎯 Critérios Principais de Aceitação

### 1. Generalização de Documentos ✅

#### 1.1 Referências Específicas Eliminadas
- [ ] **0 referências "Granaai/Grana.ai"** encontradas em busca final
- [ ] **0 referências a pessoas específicas** (nomes próprios substituídos por {{ROLE_NAME}})
- [ ] **0 referências a URLs específicas** (substituídas por {{COMPANY_DOMAIN}})
- [ ] **Validação automatizada** implementada e passando

#### 1.2 Sistema de Placeholders
- [ ] **Dicionário de placeholders** documentado em README.md
- [ ] **Mínimo 10 placeholders** definidos e documentados
- [ ] **Exemplos de uso** incluídos na documentação
- [ ] **Convenções de nomenclatura** claras e consistentes

#### 1.3 Arquivos Atualizados
- [ ] **index.md** atualizado com placeholders
- [ ] **README.md** atualizado com guia de uso
- [ ] **Todos os 68 arquivos** em compliance/ revisados
- [ ] **Templates de comitês** (13 arquivos) generalizados

---

### 2. Estrutura de Documentação ✅

#### 2.1 Links Funcionando
- [ ] **0 links quebrados** em auditoria final
- [ ] **Cross-references validados** entre documentos
- [ ] **Auditoria automatizada** de links implementada

#### 2.2 Business Context Criado
- [ ] **Diretório `docs/business-context/`** criado
- [ ] **README.md** com overview completo
- [ ] **company-profile.md** template criado
- [ ] **industry-overview.md** template criado
- [ ] **stakeholder-map.md** template criado

#### 2.3 Technical Context Criado
- [ ] **Diretório `docs/technical-context/`** criado
- [ ] **README.md** com overview completo
- [ ] **ARCHITECTURE.md** template criado
- [ ] **infrastructure-overview.md** template criado
- [ ] **stack-summary.md** template criado

---

### 3. Comandos de Templates ✅

#### 3.1 Comando create-committee
- [ ] **Arquivo `.cursor/commands/docs/compliance-create-committee.md`** criado
- [ ] **Parâmetro `type`** aceita "ia" e "compliance"
- [ ] **Templates copiados corretamente** do diretório fonte
- [ ] **Placeholders substituídos** automaticamente
- [ ] **Validação de parâmetros** implementada
- [ ] **Documentação de uso** com exemplos completa
- [ ] **Testado com type=ia** - 7 arquivos gerados ✅
- [ ] **Testado com type=compliance** - 6 arquivos gerados ✅

#### 3.2 Comando use-governance-template
- [ ] **Arquivo `.cursor/commands/docs/compliance-use-governance-template.md`** criado
- [ ] **Parâmetro `type`** aceita todos os tipos (7 tipos)
- [ ] **Templates aplicados corretamente**
- [ ] **Placeholders substituídos** automaticamente
- [ ] **Documentação de uso** com exemplos
- [ ] **Testado para cada tipo**:
  - [ ] ai-governance ✅
  - [ ] calendarios ✅
  - [ ] checklists ✅
  - [ ] comites ✅
  - [ ] formularios ✅
  - [ ] termos ✅
  - [ ] treinamento ✅

#### 3.3 Comando apply-template-set
- [ ] **Arquivo `.cursor/commands/docs/compliance-apply-template-set.md`** criado
- [ ] **Parâmetro `sets`** aceita múltiplos valores (CSV)
- [ ] **Orquestração de múltiplos templates** funcionando
- [ ] **Documentação de uso** com exemplos
- [ ] **Testado com múltiplos sets** ✅

---

### 4. Sistema de Questionário ✅

#### 4.1 Comando collect-organization-info
- [ ] **Arquivo `.cursor/commands/docs/compliance-collect-organization-info.md`** criado
- [ ] **Questionário interativo** com 10-15 perguntas
- [ ] **4 categorias de perguntas** implementadas:
  - [ ] Perfil Organizacional ✅
  - [ ] Infraestrutura ✅
  - [ ] Processos ✅
  - [ ] Objetivos de Compliance ✅
- [ ] **Validação de respostas** implementada
- [ ] **Salva em `.compliance-config.json`** ✅
- [ ] **Documentação completa** com exemplos

#### 4.2 Comando generate-business-context
- [ ] **Arquivo `.cursor/commands/docs/compliance-generate-business-context.md`** criado
- [ ] **Lê `.compliance-config.json`** corretamente
- [ ] **Gera company-profile.md** personalizado ✅
- [ ] **Gera industry-overview.md** personalizado ✅
- [ ] **Gera stakeholder-map.md** personalizado ✅
- [ ] **Placeholders substituídos** automaticamente
- [ ] **Validação de output** implementada

#### 4.3 Comando generate-technical-context
- [ ] **Arquivo `.cursor/commands/docs/compliance-generate-technical-context.md`** criado
- [ ] **Lê `.compliance-config.json`** corretamente
- [ ] **Gera ARCHITECTURE.md** personalizado ✅
- [ ] **Gera infrastructure-overview.md** personalizado ✅
- [ ] **Gera stack-summary.md** personalizado ✅
- [ ] **Análise de código** (opcional) implementada
- [ ] **Validação de output** implementada

#### 4.4 Persistência de Configuração
- [ ] **Schema JSON definido** para .compliance-config.json
- [ ] **Salvamento de respostas** funcionando
- [ ] **Carregamento de respostas** funcionando
- [ ] **Validação de schema** implementada
- [ ] **Documentação do formato** completa

---

### 5. Integração Build Command ✅

#### 5.1 Atualização do Comando Principal
- [ ] **Arquivo `build-compliance-docs.md`** atualizado
- [ ] **Verifica `.compliance-config.json`** antes de executar
- [ ] **Chama collect-organization-info** se config não existir
- [ ] **Integra generate-business-context** ✅
- [ ] **Integra generate-technical-context** ✅
- [ ] **Substitui placeholders** automaticamente
- [ ] **Novo fluxo documentado** no arquivo

#### 5.2 Modo Dry-Run
- [ ] **Flag `--dry-run`** implementada
- [ ] **Preview de arquivos a gerar** mostrado
- [ ] **Preview de placeholders** mostrado
- [ ] **Confirmação antes de gerar** solicitada
- [ ] **Documentação do modo** incluída

#### 5.3 Validação de Placeholders
- [ ] **Validação pós-geração** implementada
- [ ] **Busca por placeholders não substituídos** funcionando
- [ ] **Relatório de placeholders faltantes** gerado
- [ ] **Alertas ao usuário** implementados
- [ ] **Processo documentado** no comando

#### 5.4 Relatório Final
- [ ] **Relatório de conclusão** implementado
- [ ] **Lista de arquivos gerados** incluída
- [ ] **Lista de frameworks implementados** incluída
- [ ] **Próximos passos** sugeridos
- [ ] **Checklist de validação** incluído

---

## 🧪 Testes de Aceitação

### Teste 1: Generalização Completa
```bash
# Busca por referências não generalizadas
grep -ri "granaai\|grana\.ai" .cursor/commands/docs/compliance/

# Resultado esperado: 0 matches
```
**Status**: [ ] Passou

### Teste 2: Links Funcionando
```bash
# Auditoria de links
# (implementar script de validação de links)

# Resultado esperado: 0 links quebrados
```
**Status**: [ ] Passou

### Teste 3: Criação de Comitê IA
```bash
/docs/compliance/create-committee type=ia

# Resultado esperado: 7 arquivos criados em estrutura correta
```
**Status**: [ ] Passou

### Teste 4: Criação de Comitê Compliance
```bash
/docs/compliance/create-committee type=compliance

# Resultado esperado: 6 arquivos criados em estrutura correta
```
**Status**: [ ] Passou

### Teste 5: Aplicação de Templates de Governance
```bash
/docs/compliance/use-governance-template type=formularios

# Resultado esperado: Templates aplicados corretamente
```
**Status**: [ ] Passou

### Teste 6: Questionário End-to-End
```bash
/docs/compliance/collect-organization-info

# Resultado esperado:
# - Questionário apresentado
# - Respostas coletadas
# - .compliance-config.json criado
```
**Status**: [ ] Passou

### Teste 7: Geração de Business Context
```bash
/docs/compliance/generate-business-context

# Resultado esperado:
# - 4 arquivos criados em docs/business-context/
# - Placeholders substituídos corretamente
```
**Status**: [ ] Passou

### Teste 8: Geração de Technical Context
```bash
/docs/compliance/generate-technical-context

# Resultado esperado:
# - 4 arquivos criados em docs/technical-context/
# - Placeholders substituídos corretamente
```
**Status**: [ ] Passou

### Teste 9: Build Command End-to-End
```bash
# Remover .compliance-config.json se existir
rm .compliance-config.json

# Executar build command do zero
/docs/build-compliance frameworks="iso27001,soc2"

# Resultado esperado:
# - Questionário apresentado
# - Business/technical context gerados
# - Documentação de compliance gerada
# - Placeholders substituídos
# - Relatório final apresentado
```
**Status**: [ ] Passou

### Teste 10: Modo Dry-Run
```bash
/docs/build-compliance frameworks="iso27001" --dry-run

# Resultado esperado:
# - Preview mostrado
# - Nenhum arquivo criado
# - Confirmação solicitada
```
**Status**: [ ] Passou

---

## 📊 Métricas de Qualidade

### Cobertura de Generalização
- **Target**: 100% dos arquivos generalizados
- **Medição**: 0 referências específicas encontradas
- **Status**: [ ] Atingido

### Cobertura de Links
- **Target**: 100% dos links funcionando
- **Medição**: 0 links quebrados em auditoria
- **Status**: [ ] Atingido

### Cobertura de Comandos
- **Target**: 6 comandos criados e funcionando
- **Medição**: 6/6 comandos testados e aprovados
- **Status**: [ ] Atingido

### Cobertura de Testes
- **Target**: 10 testes de aceitação passando
- **Medição**: 10/10 testes executados e aprovados
- **Status**: [ ] Atingido

---

## ✅ Checklist Final de Aceitação

**A task está completa quando:**
- [ ] Todos os critérios de aceitação marcados como ✅
- [ ] Todos os 10 testes de aceitação passando
- [ ] Todas as métricas de qualidade atingidas
- [ ] Documentação completa e atualizada
- [ ] Code review aprovado
- [ ] Pull request criado e aprovado
- [ ] Merge para branch principal realizado

---

**Revisado em**: ___/___/2025  
**Aprovado por**: _________________  
**Status**: [ ] Completo e Aceito

