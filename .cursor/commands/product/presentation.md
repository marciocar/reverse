# 🎨 Criação de Apresentações Profissionais

Comando facilitador para criar apresentações profissionais via Gamma.app usando o agente orquestrador especializado `@presentation-orchestrator`.

## 📢 Regras de Comunicação (Cursor v2+)

### Comunicação com o Usuário
1. Use markdown com backticks para formatar nomes de arquivos, diretórios, funções e classes
2. Evite emojis a menos que sejam extremamente informativos ou explicitamente solicitados
3. NUNCA mencione nomes de ferramentas - use linguagem natural
4. NUNCA use `echo` ou ferramentas de terminal para comunicar pensamentos ao usuário
5. Toda comunicação deve estar diretamente na resposta de texto

### Execução de Ferramentas
1. Não se refira a nomes de ferramentas ao falar com o usuário
2. Implemente mudanças ao invés de apenas sugerir (padrão)
3. Maximize chamadas paralelas quando não há dependências
4. Use ferramentas especializadas ao invés de comandos de terminal

## Requisitos do Usuário
<requirements>
{{ARGUMENTS}}
</requirements>

---

## 🎯 Propósito

Este comando é um **wrapper intuitivo** para o agente `@presentation-orchestrator`, facilitando a criação de apresentações profissionais no Gamma.app através de uma interface simplificada.

**Diferencial:** Ao invés de invocar `@presentation-orchestrator` diretamente com todos os parâmetros, este comando:
- 🎯 Analisa automaticamente o contexto da solicitação
- 🔍 Identifica o tipo de apresentação necessária
- 📊 Busca dados relevantes (ClickUp, docs, código)
- 🚀 Orquestra todo o pipeline de geração
- ✅ Entrega apresentação pronta com links

---

## 📋 Processo

### **1. Análise da Solicitação**

Identifique automaticamente o **tipo de apresentação** solicitada:

#### **Tipo A: Apresentação a partir de Tema Geral**
```yaml
Indicadores:
  - Usuário menciona tema/tópico geral
  - Não menciona task ou documento específico
  - Exemplo: "Crie apresentação sobre nosso produto X"

Ação:
  - Coletar informações sobre o tema (codebase_search, read_file)
  - Identificar audiência-alvo e objetivo
  - Definir estrutura narrativa apropriada
```

#### **Tipo B: Apresentação a partir de Task ClickUp**
```yaml
Indicadores:
  - Usuário menciona ID de task (CU-xxx, #xxx)
  - Quer transformar task em apresentação
  - Exemplo: "Transforme a task #86ac9zh84 em apresentação"

Ação:
  - Buscar dados da task via MCP ClickUp
  - Extrair: título, descrição, status, custom fields
  - Estruturar como case study ou relatório
```

#### **Tipo C: Apresentação a partir de Documentação**
```yaml
Indicadores:
  - Usuário menciona arquivo/documento específico
  - Quer converter doc técnico em apresentação
  - Exemplo: "Transforme docs/architecture.md em apresentação"

Ação:
  - Ler arquivo mencionado
  - Adaptar conteúdo técnico para formato apresentável
  - Extrair diagramas se existirem
```

#### **Tipo D: Apresentação com Métricas/Dados**
```yaml
Indicadores:
  - Usuário menciona métricas, relatórios, dashboards
  - Foco em dados quantitativos
  - Exemplo: "Crie apresentação com métricas do Q4"

Ação:
  - Buscar dados de métricas (arquivos, tasks, comentários)
  - Estruturar narrativa data-driven
  - Criar visualizações (gráficos via Mermaid SVG)
```

---

### **2. Coleta de Contexto e Dados**

Com base no tipo identificado, colete informações necessárias:

#### **Para Tipo A (Tema Geral):**
```typescript
// Buscar informações sobre o tema
codebase_search({
  query: "Como funciona [tema]?",
  target_directories: []
})

// Ler arquivos relevantes
read_file("docs/[tema-relacionado].md")
read_file("README.md")
```

#### **Para Tipo B (Task ClickUp):**
```typescript
// Buscar task no ClickUp
mcp_clickup_get_task({
  task_id: "[task-id]",
  workspace_id: "[workspace-id]"
})

// Extrair dados estruturados
const taskData = {
  title: task.name,
  description: task.description,
  status: task.status.status,
  assignees: task.assignees,
  customFields: task.custom_fields,
  comments: task.comments // se relevante
}
```

#### **Para Tipo C (Documentação):**
```typescript
// Ler documento mencionado
read_file("[caminho-do-documento]")

// Buscar documentos relacionados
glob_file_search({
  glob_pattern: "docs/**/*.md"
})
```

#### **Para Tipo D (Métricas):**
```typescript
// Buscar arquivos de métricas
codebase_search({
  query: "Onde estão as métricas de [período]?",
  target_directories: ["docs/", "reports/"]
})

// Ler dados de métricas
read_file("reports/[periodo].md")
```

---

### **3. Definição de Especificações**

Determine automaticamente as especificações da apresentação:

```typescript
interface PresentationSpecs {
  // Básico
  title: string;              // Título claro e impactante
  audience: string;           // Quem vai ver (devs, stakeholders, investidores)
  objective: string;          // O que queremos alcançar
  
  // Estrutura
  estimatedSlides: number;    // 10-15 (pitch), 15-20 (case study), 20-30 (técnica)
  format: "presentation" | "document" | "social";
  
  // Estilo
  theme: string;              // "Oasis" (padrão), "Monochrome", "Corporate"
  tone: string;               // "professional", "inspiring", "technical"
  language: "pt-br";          // Padrão português brasileiro
  
  // Assets
  needsDiagrams: boolean;     // Se precisa de diagramas
  diagramTypes: string[];     // ["flowchart", "architecture", "sequence"]
  
  // Avançado
  textMode: "generate" | "condense" | "preserve";
  textAmount: "brief" | "medium" | "detailed" | "extensive";
}
```

**Heurísticas de Decisão:**

```yaml
Audiência:
  - Menciona "investidores" → audience: "investors", tone: "inspiring"
  - Menciona "time técnico" → audience: "developers", tone: "technical"
  - Menciona "stakeholders" → audience: "executives", tone: "professional"
  - Não menciona → audience: "general", tone: "professional"

Slides:
  - Pitch/Proposta → 10-15 slides
  - Case Study → 15-20 slides
  - Documentação Técnica → 20-30 slides
  - Relatório → 15-25 slides

Diagramas:
  - Arquitetura/Sistema → flowchart, C4
  - Processo/Workflow → sequence, flowchart
  - Dados/Métricas → charts (via Mermaid)
  - Roadmap → gantt, timeline

Tema:
  - Técnico → "Monochrome"
  - Corporativo → "Corporate"
  - Criativo → "Bold"
  - Padrão → "Oasis"
```

---

### **4. Preparação do Contexto para Orquestrador**

Monte o contexto completo para passar ao `@presentation-orchestrator`:

```markdown
@presentation-orchestrator

## 🎯 Solicitação de Apresentação

### **Tipo Identificado**
[Tipo A/B/C/D]

### **Especificações**
- **Título**: [título proposto]
- **Audiência**: [audiência-alvo]
- **Objetivo**: [objetivo claro]
- **Tom**: [tom desejado]
- **Slides estimados**: [N]
- **Formato**: [presentation/document]
- **Tema**: [tema Gamma]
- **Idioma**: pt-br

### **Dados Coletados**
[Dados extraídos de tasks, docs, código, etc.]

### **Diagramas Necessários**
[Lista de diagramas identificados como necessários]

### **Requisitos Específicos**
[Qualquer requisito adicional do usuário]

---

**Por favor, execute o pipeline completo:**
1. Criar narrativa estruturada (@storytelling-business-specialist)
2. Gerar diagramas em SVG (@mermaid-specialist)
3. Gerar apresentação via Gamma.app (@gamma-api-specialist)
4. Validar e entregar links completos

**Autonomia**: Alta - Execute automaticamente, solicite confirmação apenas em decisões críticas
```

---

### **5. Invocação do Orquestrador**

Invoque o agente `@presentation-orchestrator` com o contexto preparado:

```markdown
@presentation-orchestrator [contexto completo montado na etapa 4]
```

**O orquestrador executará automaticamente:**
1. ✅ Fase 1: Estratégia e validação
2. ✅ Fase 2: Narrativa (@storytelling-business-specialist)
3. ✅ Fase 3: Diagramas SVG (@mermaid-specialist)
4. ✅ Fase 4: Preparação Gamma
5. ✅ Fase 5: Geração (@gamma-api-specialist)
6. ✅ Fase 6: Validação e entrega
7. ✅ Fase 7: Documentação

---

### **6. Monitoramento e Status**

Durante a execução, forneça updates de progresso ao usuário:

```markdown
## 🎬 Gerando Apresentação: [Título]

### ✅ Concluído
- [x] Análise e coleta de dados
- [x] Especificações definidas
- [x] Narrativa estruturada (15 slides)

### ⏳ Em Andamento
- [ ] Gerando diagramas (2/3 concluídos)
  - ✅ Arquitetura do sistema
  - ✅ Fluxo de usuário
  - ⏳ Roadmap

### ⏸️ Pendente
- [ ] Geração via Gamma.app
- [ ] Validação final
- [ ] Entrega de links

**Estimativa**: 2-3 minutos restantes
```

---

### **7. Entrega Final**

Após conclusão, apresente resultado formatado ao usuário:

```markdown
# 🎉 Apresentação Criada com Sucesso!

## 📊 [Título da Apresentação]

### 🔗 Acesso Rápido

**🌐 Visualizar Apresentação**
[Link direto para visualização]

**✏️ Editar no Gamma**
[Link para edição]

### 📥 Exportar

- **PDF**: [Link ou "Disponível após geração completa"]
- **PPTX**: [Link ou "Disponível após geração completa"]

---

## 📋 Detalhes

| Propriedade | Valor |
|------------|-------|
| **Slides** | [N] slides |
| **Formato** | [presentation/document] |
| **Tema** | [Nome do tema] |
| **Idioma** | pt-br |

---

## 🎨 Assets Gerados

### Narrativa
- `.tmp/presentation-narrative-[timestamp].md`

### Diagramas
- `diagram-1.svg` - [Descrição]
- `diagram-2.svg` - [Descrição]

### Configuração
- `.tmp/gamma-input-[timestamp].txt`
- `.tmp/gamma-config-[timestamp].json`

---

## 🔑 Informações Técnicas

**Generation ID**: `[generationId]`
**Status**: ✅ completed
**Criado em**: [timestamp]

---

## 🚀 Próximos Passos

1. Revise a apresentação usando o link de visualização
2. Faça ajustes finais no editor Gamma (se necessário)
3. Exporte em PDF/PPTX para compartilhamento offline
4. Compartilhe com a audiência-alvo

---

**Apresentação criada por**: Sistema Onion - Comando `/product/presentation`
**Orquestrador**: @presentation-orchestrator
**Colaboradores**: @storytelling-business-specialist, @mermaid-specialist, @gamma-api-specialist
```

---

### **8. Atualização ClickUp (se aplicável)**

Se a apresentação foi baseada em task do ClickUp, adicione comentário automático:

```typescript
// Comentar na task original
mcp_clickup_create_task_comment({
  task_id: "[task-id]",
  comment_text: `
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎨 APRESENTAÇÃO GERADA
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ Apresentação criada com sucesso via Sistema Onion

🔗 LINKS DE ACESSO
▶ Visualizar: [viewLink]
▶ Editar: [editLink]

📊 DETALHES
▶ Slides: ${numSlides}
▶ Tema: ${theme}
▶ Formato: ${format}

🔑 ID DA GERAÇÃO
${generationId}

⏰ ${new Date().toLocaleString('pt-BR')}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  `
})
```

---

## 💡 Guidelines

### ✅ Boas Práticas

**Análise de Contexto:**
- ✅ Sempre identifique o tipo de apresentação antes de prosseguir
- ✅ Colete todos os dados necessários antes de invocar orquestrador
- ✅ Defina especificações baseadas em heurísticas inteligentes
- ✅ Preserve contexto completo ao delegar para orquestrador

**Comunicação com Usuário:**
- ✅ Forneça updates de progresso durante geração
- ✅ Entregue resultado formatado e completo
- ✅ Inclua todos os links e informações técnicas
- ✅ Sugira próximos passos claros

**Integração:**
- ✅ Use MCP ClickUp para buscar tasks quando aplicável
- ✅ Comente na task original com link da apresentação
- ✅ Salve assets temporários para debugging
- ✅ Documente processo completo

**Delegação:**
- ✅ Sempre delegue para `@presentation-orchestrator`
- ✅ Nunca tente criar apresentação diretamente
- ✅ Forneça contexto completo e estruturado
- ✅ Confie na autonomia do orquestrador

---

### ⚠️ Atenções Especiais

**Identificação de Tipo:**
- ⚠️ Analise cuidadosamente a solicitação antes de classificar
- ⚠️ Se ambíguo, pergunte ao usuário para esclarecer
- ⚠️ Tipo errado pode resultar em apresentação inadequada

**Coleta de Dados:**
- ⚠️ Verifique se task ID é válido antes de buscar
- ⚠️ Confirme que arquivos existem antes de ler
- ⚠️ Trate erros de busca graciosamente
- ⚠️ Não prossiga sem dados essenciais

**Especificações:**
- ⚠️ Audiência incorreta pode comprometer apresentação
- ⚠️ Número de slides deve ser realista (não >60)
- ⚠️ Tema deve ser válido no Gamma.app
- ⚠️ Tom deve ser apropriado para audiência

**Diagramas:**
- ⚠️ Sempre especifique "converter para SVG" ao orquestrador
- ⚠️ Gamma.app NÃO aceita código Mermaid direto
- ⚠️ Diagramas complexos podem levar tempo
- ⚠️ Valide que SVGs foram gerados antes de prosseguir

**Integração ClickUp:**
- ⚠️ Verifique workspace ID antes de buscar tasks
- ⚠️ Trate erros de API graciosamente
- ⚠️ Não falhe se comentário não puder ser adicionado
- ⚠️ Formatação Unicode para comentários ClickUp

---

### ❌ O Que Evitar

**Execução:**
- ❌ Nunca tente gerar apresentação sem invocar orquestrador
- ❌ Não chame `@storytelling-business-specialist` diretamente
- ❌ Não chame `@mermaid-specialist` diretamente
- ❌ Não chame `@gamma-api-specialist` diretamente
- ❌ Não use API Gamma sem passar pelo orquestrador

**Dados:**
- ❌ Não prossiga com dados incompletos ou inválidos
- ❌ Não assuma informações não fornecidas
- ❌ Não invente métricas ou dados
- ❌ Não use task ID sem validar formato

**Especificações:**
- ❌ Não use temas Gamma inválidos
- ❌ Não defina >60 slides (limite Gamma)
- ❌ Não use idioma em formato incorreto (pt-BR ❌, pt-br ✅)
- ❌ Não misture tom incompatível com audiência

**Comunicação:**
- ❌ Não deixe usuário sem feedback durante geração
- ❌ Não entregue apenas link sem contexto
- ❌ Não esqueça de documentar processo
- ❌ Não omita informações técnicas importantes

---

## 📊 Exemplos

### **Exemplo 1: Apresentação de Produto**

**Input:**
```
/product/presentation Crie apresentação sobre nossa nova feature de IA para investidores
```

**Execução:**
```markdown
🎬 Analisando solicitação...

## 📋 Análise
- **Tipo identificado**: A (Tema Geral)
- **Tema**: Nova feature de IA
- **Audiência**: Investidores
- **Objetivo**: Apresentar capacidades e potencial de mercado

## 🔍 Coletando dados...
✅ Informações sobre feature de IA coletadas
✅ Métricas de mercado identificadas
✅ Diferencial competitivo mapeado

## 🎯 Especificações definidas
- Título: "IA Revolucionária: O Futuro do Desenvolvimento"
- Audiência: Investidores (executiva)
- Tom: Inspirador e profissional
- Slides: 12-15
- Tema: Bold
- Diagramas: Arquitetura, Roadmap, Comparativo

## 🚀 Invocando orquestrador...

@presentation-orchestrator [contexto completo]

[Orquestrador executa pipeline...]

## 🎉 Apresentação Criada!

🔗 Visualizar: https://gamma.app/docs/...
✏️ Editar: https://gamma.app/edit/...

📊 15 slides | Tema: Bold | pt-br
🔑 ID: gen_abc123xyz

✅ Apresentação pronta para investidores!
```

---

### **Exemplo 2: Apresentação a partir de Task**

**Input:**
```
/product/presentation Transforme a task #86ac9zh84 em apresentação para stakeholders
```

**Execução:**
```markdown
🎬 Analisando solicitação...

## 📋 Análise
- **Tipo identificado**: B (Task ClickUp)
- **Task ID**: #86ac9zh84
- **Audiência**: Stakeholders

## 🔍 Buscando task no ClickUp...
✅ Task encontrada: "Implementação de Dashboard Analytics"
✅ Dados extraídos:
  - Status: Done
  - Assignees: @dev1, @dev2
  - Impacto: High
  - Resultado: +40% performance

## 🎯 Especificações definidas
- Título: "Dashboard Analytics: Case Study de Sucesso"
- Audiência: Stakeholders (executiva)
- Tom: Profissional com foco em resultados
- Slides: 10-12
- Formato: Case study (Desafio → Solução → Resultados)
- Tema: Corporate
- Diagramas: Before/After, Arquitetura, Métricas

## 🚀 Invocando orquestrador...

@presentation-orchestrator [contexto completo]

[Orquestrador executa pipeline...]

## 🎉 Apresentação Criada!

🔗 Visualizar: https://gamma.app/docs/...
✏️ Editar: https://gamma.app/edit/...

📊 12 slides | Tema: Corporate | pt-br
🔑 ID: gen_def456uvw

✅ Comentário adicionado na task #86ac9zh84
✅ Apresentação pronta para stakeholders!
```

---

### **Exemplo 3: Apresentação Técnica**

**Input:**
```
/product/presentation Converta docs/architecture.md em apresentação para time técnico + CTO
```

**Execução:**
```markdown
🎬 Analisando solicitação...

## 📋 Análise
- **Tipo identificado**: C (Documentação)
- **Documento**: docs/architecture.md
- **Audiência**: Time técnico + CTO

## 🔍 Lendo documentação...
✅ Arquivo lido: docs/architecture.md (2.5k linhas)
✅ Conteúdo: Arquitetura completa do sistema
✅ Identificados: Diagramas C4, decisões técnicas, stack

## 🎯 Especificações definidas
- Título: "Arquitetura do Sistema: Visão Técnica Completa"
- Audiência: Time técnico + CTO (técnica/executiva)
- Tom: Profissional e acessível
- Slides: 20-25
- Tema: Monochrome
- Diagramas: C4 Context, C4 Container, Fluxo de dados, Stack

## 🚀 Invocando orquestrador...

@presentation-orchestrator [contexto completo]

[Orquestrador executa pipeline...]

## 🎉 Apresentação Criada!

🔗 Visualizar: https://gamma.app/docs/...
✏️ Editar: https://gamma.app/edit/...

📊 22 slides | Tema: Monochrome | pt-br
🔑 ID: gen_ghi789rst

📁 Assets:
  - diagram-c4-context.svg
  - diagram-c4-container.svg
  - diagram-data-flow.svg
  - diagram-tech-stack.svg

✅ Apresentação técnica pronta!
```

---

### **Exemplo 4: Relatório de Métricas**

**Input:**
```
/product/presentation Crie apresentação com métricas do Q4 2024
```

**Execução:**
```markdown
🎬 Analisando solicitação...

## 📋 Análise
- **Tipo identificado**: D (Métricas/Dados)
- **Período**: Q4 2024
- **Audiência**: Stakeholders (presumido)

## 🔍 Buscando dados de métricas...
✅ Encontrado: reports/q4-2024.md
✅ Métricas coletadas:
  - Receita: +35% vs Q3
  - Usuários ativos: +50k
  - NPS: 72 (+8 pontos)
  - Churn: -15%

## 🎯 Especificações definidas
- Título: "Q4 2024: Resultados e Conquistas"
- Audiência: Stakeholders (executiva)
- Tom: Profissional e data-driven
- Slides: 15-18
- Tema: Corporate
- Diagramas: Gráficos de crescimento, Comparativos, Funil

## 🚀 Invocando orquestrador...

@presentation-orchestrator [contexto completo]

[Orquestrador executa pipeline...]

## 🎉 Apresentação Criada!

🔗 Visualizar: https://gamma.app/docs/...
✏️ Editar: https://gamma.app/edit/...

📊 16 slides | Tema: Corporate | pt-br
🔑 ID: gen_jkl012mno

📁 Gráficos gerados:
  - chart-revenue-growth.svg
  - chart-user-acquisition.svg
  - chart-nps-evolution.svg
  - chart-churn-reduction.svg

✅ Relatório Q4 pronto!
```

---

## 🔄 Casos de Uso Comuns

### **Caso 1: Pitch para Investidores**
```bash
/product/presentation Crie pitch deck para investidores sobre [produto/feature]
```
- Audiência: Investidores
- Tom: Inspirador
- Slides: 10-15
- Foco: Problema → Solução → Mercado → Tração → Visão

---

### **Caso 2: Case Study Interno**
```bash
/product/presentation Transforme task #[id] em case study para stakeholders
```
- Audiência: Stakeholders
- Tom: Profissional
- Slides: 10-12
- Foco: Desafio → Solução → Resultados → Aprendizados

---

### **Caso 3: Documentação Técnica**
```bash
/product/presentation Converta docs/[arquivo].md em apresentação técnica
```
- Audiência: Time técnico
- Tom: Técnico e acessível
- Slides: 20-30
- Foco: Arquitetura → Decisões → Implementação → Manutenção

---

### **Caso 4: Relatório de Resultados**
```bash
/product/presentation Crie relatório de métricas do [período]
```
- Audiência: Executivos
- Tom: Data-driven
- Slides: 15-20
- Foco: Métricas → Análise → Insights → Ações

---

### **Caso 5: Apresentação de Feature**
```bash
/product/presentation Apresente nova feature [nome] para [audiência]
```
- Audiência: Variável
- Tom: Profissional
- Slides: 12-18
- Foco: Contexto → Feature → Benefícios → Demo → Roadmap

---

## ✅ Checklist de Validação

Após criação da apresentação, verifique:

### Processo
- [ ] Tipo de apresentação identificado corretamente
- [ ] Dados coletados completos e relevantes
- [ ] Especificações definidas apropriadamente
- [ ] Contexto completo passado ao orquestrador
- [ ] Pipeline executado sem erros

### Resultado
- [ ] Apresentação gerada com sucesso
- [ ] Links de visualização e edição funcionais
- [ ] Número de slides adequado
- [ ] Tema e tom apropriados para audiência
- [ ] Diagramas em SVG (se aplicável)

### Entrega
- [ ] Resultado formatado apresentado ao usuário
- [ ] Todos os links incluídos
- [ ] Informações técnicas fornecidas
- [ ] Assets salvos e documentados
- [ ] Próximos passos sugeridos

### Integração (se aplicável)
- [ ] Comentário adicionado na task ClickUp
- [ ] Formatação Unicode correta
- [ ] Links funcionais no comentário
- [ ] Timestamp incluído

---

## 🔗 Comandos Relacionados

### Comandos de Produto
- `/product/task` - Criar task estruturada
- `/product/spec` - Especificação técnica
- `/product/collect` - Coletar requisitos

### Comandos de Documentação
- `/docs/build-tech-docs` - Documentação técnica
- `/docs/build-business-docs` - Documentação de negócio

### Agentes Relacionados
- `@presentation-orchestrator` - Orquestrador master (invocado por este comando)
- `@storytelling-business-specialist` - Narrativa e conteúdo
- `@mermaid-specialist` - Diagramas SVG
- `@gamma-api-specialist` - Geração Gamma.app
- `@clickup-specialist` - Operações ClickUp

---

## 🔧 Troubleshooting

### Problema: Tipo de apresentação não identificado
**Causa:** Solicitação ambígua ou incompleta

**Solução:**
```markdown
Pergunte ao usuário:
- Qual é o tema/tópico da apresentação?
- Quem é a audiência-alvo?
- Qual é o objetivo principal?
- Há alguma task ou documento base?
```

---

### Problema: Task ClickUp não encontrada
**Causa:** ID inválido ou workspace incorreto

**Solução:**
```markdown
1. Validar formato do ID (CU-xxx ou #xxx)
2. Verificar workspace ID configurado
3. Tentar buscar task com ID alternativo
4. Informar usuário e pedir ID correto
```

---

### Problema: Documento não encontrado
**Causa:** Caminho incorreto ou arquivo não existe

**Solução:**
```markdown
1. Usar glob_file_search para encontrar arquivo
2. Listar arquivos disponíveis em docs/
3. Perguntar ao usuário o caminho correto
4. Sugerir alternativas se encontradas
```

---

### Problema: Orquestrador retorna erro
**Causa:** Contexto incompleto ou especificações inválidas

**Solução:**
```markdown
1. Revisar contexto passado ao orquestrador
2. Validar especificações (tema, idioma, slides)
3. Verificar se dados estão completos
4. Retentar com ajustes
5. Escalar para @presentation-orchestrator se persistir
```

---

### Problema: Diagramas não gerados
**Causa:** Especificação incorreta ou complexidade alta

**Solução:**
```markdown
1. Verificar se "converter para SVG" foi especificado
2. Simplificar diagramas complexos
3. Solicitar re-geração ao @mermaid-specialist
4. Prosseguir sem diagramas se não críticos
```

---

## 📚 FAQ

**P: Posso criar apresentação sem especificar audiência?**  
R: Sim, o comando usará heurísticas para definir audiência "geral" e tom "profissional".

**P: Quantos slides posso criar?**  
R: Recomendado 10-30 slides. Máximo do Gamma.app: 60-75 (varia por plano).

**P: Posso usar task de outro workspace?**  
R: Sim, mas precisa especificar workspace_id correto.

**P: Posso editar apresentação depois de criada?**  
R: Sim! Use o link de edição fornecido para ajustar no Gamma.app.

**P: Diagramas são obrigatórios?**  
R: Não. O comando identifica automaticamente se são necessários.

**P: Posso criar múltiplas apresentações em sequência?**  
R: Sim, cada invocação é independente.

**P: Como exportar em PDF/PPTX?**  
R: Use os links de export fornecidos ou exporte manualmente no Gamma.app.

**P: Posso reutilizar assets de apresentações anteriores?**  
R: Sim, assets ficam salvos em `.tmp/` para reutilização.

---

## 📖 Resumo de Uso

### Sintaxe Básica
```bash
/product/presentation [descrição da apresentação desejada]
```

### Exemplos Rápidos
```bash
# Tema geral
/product/presentation Crie apresentação sobre [tema] para [audiência]

# A partir de task
/product/presentation Transforme task #[id] em apresentação

# A partir de doc
/product/presentation Converta docs/[arquivo].md em apresentação

# Com métricas
/product/presentation Crie relatório de métricas do [período]
```

### O Que Acontece
1. ✅ Análise automática da solicitação
2. ✅ Identificação do tipo de apresentação
3. ✅ Coleta de dados relevantes
4. ✅ Definição de especificações inteligentes
5. ✅ Invocação do `@presentation-orchestrator`
6. ✅ Execução do pipeline completo
7. ✅ Entrega de apresentação pronta com links

---

## 🎉 Comece Agora!

**Primeira apresentação?**
```bash
/product/presentation Crie apresentação sobre [seu tema] para [sua audiência]
```

**Tem uma task?**
```bash
/product/presentation Transforme task #[id] em apresentação
```

**Quer converter documentação?**
```bash
/product/presentation Converta docs/[arquivo].md em apresentação
```

---

**O Sistema Onion está pronto para criar apresentações profissionais de forma automatizada! 🎨🚀**

Use `/product/presentation` como seu atalho inteligente para gerar apresentações Gamma.app de alta qualidade com apenas um comando.

