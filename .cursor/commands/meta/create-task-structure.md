# Comando Criar Estrutura de Tarefas

Decompõe uma tarefa complexa em uma estrutura organizada de subtarefas gerenciáveis.

## Requisitos do Usuário
<requirements>
#$ARGUMENTS
</requirements>

## Processo

### 1. Analisar a Tarefa Complexa
Primeiro, entenda profundamente a tarefa fornecida:
- **Objetivo final**: O que precisa estar pronto ao final?
- **Escopo**: Quais áreas do projeto são afetadas?
- **Complexidade**: Quantas etapas lógicas são necessárias?
- **Dependências**: Existem pré-requisitos ou ordem obrigatória?
- **Riscos**: Quais são os pontos críticos ou bloqueadores?

### 2. Identificar Subtarefas Lógicas
Decomponha a tarefa principal em subtarefas usando critérios:

**Por Camada Técnica:**
- 📊 Data Layer (schemas, migrations, modelos)
- 🔌 API Layer (endpoints, validação, business logic)
- 🎨 UI Layer (componentes, páginas, styling)
- 🧪 Testing Layer (unit, integration, e2e)
- 📚 Documentation Layer (docs, comentários, exemplos)

**Por Tipo de Atividade:**
- 🔍 Research & Planning (investigação, decisões arquiteturais)
- 🏗️ Setup & Configuration (configuração, dependências)
- ⚙️ Implementation (código funcional)
- ✅ Validation & Testing (testes, QA)
- 🚀 Deployment & Monitoring (deploy, observabilidade)

**Por Sequência Lógica:**
- 🥇 Fundação (estrutura base, configuração)
- 🥈 Core (funcionalidade principal)
- 🥉 Refinamento (otimizações, polimento)
- 🎯 Finalização (validação, documentação)

### 3. Definir Status e Dependências
Para cada subtarefa, determine:

**Status Inicial:**
- `pending` - Ainda não iniciada
- `in_progress` - Atualmente em execução (use apenas para 1ª tarefa)
- `completed` - Já finalizada
- `cancelled` - Não será mais feita

**Dependências:**
- Quais tarefas são bloqueantes?
- Quais podem ser feitas em paralelo?
- Qual é o caminho crítico?

### 4. Criar Estrutura com todo_write
Use a ferramenta `todo_write` para criar a estrutura:

```javascript
{
  "merge": false,  // false = substituir TODOs existentes; true = mesclar com existentes
  "todos": [
    {
      "id": "task-1",
      "content": "📊 [Categoria] Descrição clara da subtarefa",
      "status": "in_progress"  // Primeira tarefa sempre in_progress
    },
    {
      "id": "task-2",
      "content": "🔌 [Categoria] Próxima subtarefa",
      "status": "pending"
    },
    // ... mais tarefas
  ]
}
```

### 5. Criar Checklist de Validação
Para cada subtarefa, defina critérios de conclusão:
- O que indica que a tarefa está completa?
- Quais artefatos devem existir?
- Quais testes devem passar?

### 6. Fornecer Resumo Executivo
Apresente ao usuário:
- 📋 Total de subtarefas criadas
- 🎯 Tarefa atual (in_progress)
- ⏱️ Estimativa de esforço (se possível)
- 🚨 Riscos e bloqueadores identificados
- ✅ Critérios de conclusão geral

## Guidelines

### ✅ Boas Práticas

**Granularidade:**
- ✅ Cada subtarefa deve ser **completável em 1-2 horas**
- ✅ Se maior, decomponha ainda mais
- ✅ Tarefas muito pequenas (<15min) podem ser agrupadas
- ✅ Busque equilíbrio: nem muito granular, nem muito genérico

**Nomenclatura:**
- ✅ Use **emojis** para categorização visual rápida
- ✅ Comece com **verbo de ação** (Criar, Implementar, Configurar, Testar)
- ✅ Seja **específico**: "Criar endpoint POST /users" > "Fazer API"
- ✅ Inclua **contexto suficiente** para entender isoladamente

**Organização:**
- ✅ Ordene por **dependência lógica** (fundação antes de features)
- ✅ Agrupe tarefas **relacionadas** em sequência
- ✅ Primeira tarefa sempre `in_progress` (ação imediata)
- ✅ Use IDs sequenciais (`task-1`, `task-2`, ..., `task-N`)

**Conteúdo:**
- ✅ Inclua **contexto** sobre onde/o que fazer
- ✅ Mencione **padrões** ou **referências** se aplicável
- ✅ Destaque **validações** necessárias
- ✅ Sinalize **riscos** ou **decisões** pendentes

### ⚠️ Atenções Especiais

**Dependências:**
- ⚠️ Identifique **caminho crítico** (sequência que não pode ser paralelizada)
- ⚠️ Sinalize **bloqueadores** explicitamente
- ⚠️ Considere **decisões arquiteturais** que afetam downstream

**Escopo:**
- ⚠️ Evite **scope creep** - foque no objetivo definido
- ⚠️ Documente **nice-to-have** separadamente
- ⚠️ Mantenha alinhamento com **requisitos originais**

**Pragmatismo:**
- ⚠️ Prefira **valor incremental** vs "perfeição"
- ⚠️ Identifique **MVP** dentro da tarefa se aplicável
- ⚠️ Sinalize pontos de **validação intermediária**

### ❌ O Que Evitar

- ❌ **Tarefas genéricas**: "Melhorar sistema" não é acionável
- ❌ **Ausência de critérios**: Sem definição de "pronto"
- ❌ **Dependências ocultas**: Não mencionar pré-requisitos
- ❌ **Estimativas irreais**: Considere complexidade realista
- ❌ **Tarefas gigantes**: >1 dia de trabalho precisa decomposição
- ❌ **Duplicação**: Tarefas que se sobrepõem causam confusão
- ❌ **Ordem ilógica**: UI antes do backend que ela consome

## Emojis Sugeridos por Categoria

Use estes emojis para categorização visual consistente:

**Camadas Técnicas:**
- 📊 Data / Database / Schema
- 🔌 API / Backend / Services
- 🎨 UI / Frontend / Components
- 🧪 Tests / QA / Validation
- 📚 Documentation / Examples

**Tipos de Atividade:**
- 🔍 Research / Investigation / Planning
- 🏗️ Setup / Configuration / Infrastructure
- ⚙️ Implementation / Coding / Building
- ✅ Validation / Testing / Review
- 🚀 Deploy / Release / Monitoring

**Prioridade/Status:**
- 🚨 Bloqueador / Urgente / Crítico
- ⭐ Importante / Alta prioridade
- 🔧 Manutenção / Refactoring
- 💡 Melhoria / Enhancement
- 📝 Documentação / Planejamento

**Alertas:**
- ⚠️ Atenção / Risco / Decisão pendente
- 🐛 Bug / Problema / Fix
- 🔒 Segurança / Permissões
- 🎯 Objetivo / Meta / Milestone

## Template de Estrutura

```markdown
## 📋 Estrutura de Tarefas: [Nome da Tarefa Principal]

**Objetivo**: [Descreva o resultado final esperado]
**Escopo**: [Áreas do projeto afetadas]
**Estimativa**: [Tempo total estimado]

### 🎯 Caminho Crítico
[Liste a sequência de tarefas que não pode ser paralelizada]

### 📊 Subtarefas

1. 🔍 **[ID]** - [Descrição da tarefa]
   - **Status**: pending / in_progress / completed
   - **Dependências**: [IDs de tarefas bloqueantes]
   - **Critério de conclusão**: [Como saber que está pronto]
   - **Estimativa**: [Tempo]

2. 🏗️ **[ID]** - [Próxima tarefa]
   - ...

[Repita para todas as subtarefas]

### ⚠️ Riscos e Bloqueadores
- [Risco 1 e plano de mitigação]
- [Risco 2 e plano de mitigação]

### ✅ Checklist de Conclusão Geral
- [ ] [Critério 1]
- [ ] [Critério 2]
- [ ] [Critério N]
```

## Exemplos

### Exemplo 1: Feature Simples (3-5 subtarefas)

**Tarefa**: Adicionar campo "biografia" ao perfil do usuário

**Estrutura:**
```json
{
  "merge": false,
  "todos": [
    {
      "id": "bio-1",
      "content": "📊 Adicionar campo 'bio' no schema.zmodel (model User) com validação max 500 chars",
      "status": "in_progress"
    },
    {
      "id": "bio-2",
      "content": "🔌 Atualizar endpoint PATCH /users/:id para aceitar campo 'bio'",
      "status": "pending"
    },
    {
      "id": "bio-3",
      "content": "🎨 Criar componente BioInput com textarea e contador de caracteres",
      "status": "pending"
    },
    {
      "id": "bio-4",
      "content": "🧪 Adicionar testes para validação e persistência do campo bio",
      "status": "pending"
    },
    {
      "id": "bio-5",
      "content": "📚 Atualizar documentação da API com novo campo opcional",
      "status": "pending"
    }
  ]
}
```

**Checklist de Conclusão:**
- [ ] Campo bio aparece na UI do perfil
- [ ] Validação de 500 chars funciona
- [ ] Dados persistem no banco corretamente
- [ ] Testes passando (>80% coverage)
- [ ] API docs atualizada

---

### Exemplo 2: Feature Complexa (8-12 subtarefas)

**Tarefa**: Implementar sistema de notificações em tempo real

**Estrutura:**
```json
{
  "merge": false,
  "todos": [
    {
      "id": "notif-1",
      "content": "🔍 Research: Definir arquitetura (WebSocket vs SSE vs Long Polling) e tech stack",
      "status": "in_progress"
    },
    {
      "id": "notif-2",
      "content": "📊 Criar schema Notification (id, userId, type, message, read, createdAt)",
      "status": "pending"
    },
    {
      "id": "notif-3",
      "content": "🏗️ Setup WebSocket server com Socket.io no Fastify",
      "status": "pending"
    },
    {
      "id": "notif-4",
      "content": "🔌 Criar endpoints: GET /notifications, PATCH /notifications/:id/read, DELETE /notifications/:id",
      "status": "pending"
    },
    {
      "id": "notif-5",
      "content": "🔌 Implementar lógica de broadcast de notificações para usuários conectados",
      "status": "pending"
    },
    {
      "id": "notif-6",
      "content": "🎨 Criar componente NotificationBell com badge de contagem não lidas",
      "status": "pending"
    },
    {
      "id": "notif-7",
      "content": "🎨 Criar componente NotificationList com scroll infinito e mark as read",
      "status": "pending"
    },
    {
      "id": "notif-8",
      "content": "⚙️ Implementar hook useNotifications com conexão WebSocket e state management",
      "status": "pending"
    },
    {
      "id": "notif-9",
      "content": "🧪 Criar testes unitários para endpoints e broadcast logic",
      "status": "pending"
    },
    {
      "id": "notif-10",
      "content": "🧪 Criar testes E2E para fluxo completo de notificação",
      "status": "pending"
    },
    {
      "id": "notif-11",
      "content": "🚀 Configurar rate limiting e throttling para WebSocket connections",
      "status": "pending"
    },
    {
      "id": "notif-12",
      "content": "📚 Documentar arquitetura, APIs e guia de uso do sistema de notificações",
      "status": "pending"
    }
  ]
}
```

**Caminho Crítico:**
1. notif-1 (Research) → notif-2 (Schema) → notif-3 (WebSocket Setup)
2. notif-3 → notif-4 + notif-5 (APIs) → notif-8 (Hook) → notif-6 + notif-7 (UI)
3. Testes após implementação funcional completa

**Riscos Identificados:**
- ⚠️ Escalabilidade: WebSocket pode precisar Redis pub/sub para múltiplas instâncias
- ⚠️ Conexões: Limite de conexões simultâneas precisa ser definido
- ⚠️ Fallback: Considerar fallback para polling se WebSocket falhar

**Checklist de Conclusão:**
- [ ] Notificações aparecem em tempo real (<500ms latência)
- [ ] Badge de contagem atualiza automaticamente
- [ ] Marcar como lida funciona
- [ ] Reconexão automática em caso de queda
- [ ] Rate limiting configurado e testado
- [ ] Testes E2E passando
- [ ] Documentação completa
- [ ] Performance validada (>100 conexões simultâneas)

---

### Exemplo 3: Refatoração Grande (6-8 subtarefas)

**Tarefa**: Migrar authentication de JWT para session-based com cookies

**Estrutura:**
```json
{
  "merge": false,
  "todos": [
    {
      "id": "auth-1",
      "content": "🔍 Auditar código atual: identificar todos os pontos de uso de JWT",
      "status": "in_progress"
    },
    {
      "id": "auth-2",
      "content": "📊 Criar tabela Session (id, userId, token, expiresAt, userAgent, ip)",
      "status": "pending"
    },
    {
      "id": "auth-3",
      "content": "🏗️ Setup session store com connect-redis + configurar cookies seguros",
      "status": "pending"
    },
    {
      "id": "auth-4",
      "content": "🔌 Refatorar middleware de autenticação para validar session ao invés de JWT",
      "status": "pending"
    },
    {
      "id": "auth-5",
      "content": "🔌 Atualizar endpoints /login e /logout para criar/destruir sessions",
      "status": "pending"
    },
    {
      "id": "auth-6",
      "content": "🎨 Atualizar HTTP client para enviar cookies + handle CORS corretamente",
      "status": "pending"
    },
    {
      "id": "auth-7",
      "content": "🧪 Atualizar todos os testes de autenticação para novo formato",
      "status": "pending"
    },
    {
      "id": "auth-8",
      "content": "🚀 Deploy com feature flag + migração gradual de usuários JWT → Session",
      "status": "pending"
    }
  ]
}
```

**Atenção Especial:**
- ⚠️ Migração gradual: Manter JWT funcionando durante transição
- ⚠️ Rollback: Ter plano de rollback caso problemas em produção
- ⚠️ CORS: Configurar corretamente credentials: 'include'

---

## Workflow Completo

Ao criar estrutura de tarefas, siga este workflow:

1. **📖 Leia requisitos cuidadosamente**
2. **🤔 Analise complexidade e escopo**
3. **🗂️ Decomponha em subtarefas lógicas**
4. **🔗 Identifique dependências**
5. **✍️ Escreva tarefas acionáveis e específicas**
6. **🏷️ Categorize com emojis apropriados**
7. **⚙️ Execute todo_write**
8. **📊 Apresente resumo executivo**
9. **✅ Confirme critérios de conclusão**
10. **🎯 Destaque próxima ação (in_progress)**

---

**Agora você está pronto para transformar qualquer tarefa complexa em uma estrutura organizada e acionável!** 🚀

