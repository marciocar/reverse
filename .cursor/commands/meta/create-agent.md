# Comando Criar Agente

Você tem a tarefa de criar um novo sub-agente do cursor Code baseado nos requisitos do usuário. Siga esta abordagem sistemática para construir um agente bem estruturado.

## Requisitos do Usuário
<requirements>
#$ARGUMENTS
</requirements>

## Processo

### 1. Entender o Propósito do Agente
Primeiro, analise o que o usuário quer que este agente faça:
- Qual é a responsabilidade principal do agente?
- Que tarefas ele executará?
- O que torna este agente especializado?

### 2. Definir Configuração do Agente
Com base nos requisitos, determine:
- **Nome**: Crie um identificador em minúsculas, separado por hífens
- **Descrição**: Escreva uma descrição clara e concisa do propósito do agente
- **Ferramentas**: Selecione as ferramentas apropriadas do conjunto disponível 

### 3. Seleção de Ferramentas
Liste todas as ferramentas disponíveis e pergunte ao usuário quais o sub-agente deve ter acesso:

#### Ferramentas Disponíveis (por categoria):

**📁 Operações de Arquivo:**
- `read_file` - Ler conteúdo de arquivos
- `write` - Criar ou sobrescrever arquivos completos
- `search_replace` - Editar arquivos com substituição exata
- `edit_notebook` - Editar células de Jupyter notebooks
- `delete_file` - Remover arquivos

**🔍 Pesquisa e Navegação:**
- `codebase_search` - Busca semântica no código
- `grep` - Busca por padrões/regex em arquivos
- `glob_file_search` - Buscar arquivos por padrão glob
- `list_dir` - Listar conteúdo de diretórios

**⚙️ Execução:**
- `run_terminal_cmd` - Executar comandos no terminal

**📋 Gestão e Qualidade:**
- `todo_write` - Criar e gerenciar tarefas
- `update_memory` - Criar/atualizar memórias persistentes
- `read_lints` - Ler erros de linter/diagnostics

**🌐 Recursos Externos:**
- `web_search` - Buscar informações na web

**Outras Ferramentas Especializadas:**
- Verificar em `docs/tools.md` para ferramentas e MCP específicas, Se `docs/tools.md` não existir, rodar comando Cursor all-tools `/meta/all-tools` 

**Diretrizes de Seleção:**
- ✅ Use acesso **mínimo necessário** por segurança
- ✅ Considere o escopo das tarefas do agente
- ✅ Agrupe ferramentas relacionadas
- ❌ Evite dar acesso excessivo "por precaução"

Apresente essas ferramentas ao usuário e peça para selecionar apenas as apropriadas para o propósito específico do agente.

### 4. Projetar o Prompt do Sistema
Crie um prompt do sistema detalhado que:
- Define claramente o papel e expertise do agente
- Fornece instruções passo a passo para completar suas tarefas
- Inclui qualquer restrição ou diretriz
- Especifica requisitos de formato de saída
- Contém exemplos se úteis

### 5. Criar o Arquivo do Agente
Gere o arquivo .md seguindo o padrão oficial do Cursor com frontmatter YAML:

```markdown
---
name: nome-do-agente
description: Descrição breve e clara do propósito do agente
tools: read_file, write, search_replace, grep, codebase_search, run_terminal_cmd
---

# Role

[Defina claramente o papel e expertise do agente]

# Instructions

[Forneça instruções passo a passo para completar suas tarefas]

# Guidelines

- [Inclua restrições e diretrizes específicas]
- [Especifique requisitos de formato de saída]
- [Adicione boas práticas e padrões a seguir]

# Examples

[Se útil, inclua exemplos de uso ou outputs esperados]
```

**IMPORTANTE**: 
- Extensão do arquivo DEVE ser `.md` (não `.yaml`)
- Nome do agente em `kebab-case` (minúsculas com hífens)
- Tools como lista separada por vírgulas, sem espaços extras
- Descrição breve (1 linha) no frontmatter
- Prompt detalhado no corpo do arquivo

### 6. Estrutura de Diretórios
Organize os agentes por categoria:
```
.cursor/
└── agents/
    ├── development/     # Agentes de desenvolvimento
    ├── data/           # Agentes de dados
    ├── deployment/     # Agentes de deploy
    ├── testing/        # Agentes de testes
    ├── documentation/  # Agentes de documentação
    └── meta/           # Meta-agentes e coordenadores
```

### 7. Implementação
- Crie o arquivo em `.cursor/agents/[categoria]/[nome-do-agente].md`
- Use o nome da categoria apropriada (development, data, deployment, etc.)
- Torne o prompt do sistema abrangente mas focado
- Siga a estrutura com Role, Instructions, Guidelines e Examples

### 8. Confirmar Criação
Após criar o agente, confirme:
- ✅ Arquivo criado com sucesso
- ✅ Frontmatter YAML válido
- ✅ Tools apropriadas selecionadas
- ✅ Prompt do sistema completo e claro
- ✅ Localização correta no diretório

## Melhores Práticas

### 🎯 Escopo e Responsabilidade
- ✅ Mantenha agentes focados em **uma única responsabilidade**
- ✅ Defina claramente **quando usar** vs **quando NÃO usar** o agente
- ✅ Especifique o **domínio de expertise** do agente

### 📝 Qualidade do Prompt
- ✅ Escreva prompts do sistema **claros e acionáveis**
- ✅ Use estrutura consistente: **Role → Instructions → Guidelines → Examples**
- ✅ Inclua **exemplos práticos** em prompts complexos
- ✅ Torne os **formatos de saída explícitos**

### 🔒 Segurança e Ferramentas
- ✅ Limite o acesso às ferramentas ao **mínimo necessário**
- ✅ Documente **por que** cada ferramenta é necessária
- ❌ Evite dar ferramentas "por precaução"

### 🛠️ Robustez
- ✅ Considere **tratamento de erros** e casos extremos
- ✅ Defina **validações** e pré-condições
- ✅ Especifique **outputs esperados** claramente

### 📂 Organização
- ✅ Use a **categoria correta** no diretório
- ✅ Nome em **kebab-case** (ex: `database-migration-agent`)
- ✅ Descrição breve e objetiva (máx. 1 linha)

### 🔄 Manutenibilidade
- ✅ Documente **dependências** e **prerequisitos**
- ✅ Mantenha **consistência** com outros agentes do projeto
- ✅ Atualize **memórias** quando criar novos padrões

## Exemplo Completo

```markdown
---
name: api-endpoint-creator
description: Cria endpoints REST seguindo padrões Fastify e ZenStack do projeto
tools: read_file, write, search_replace, grep, codebase_search, run_terminal_cmd, todo_write
---

# Role

Você é um especialista em criação de endpoints REST usando Fastify 5.x e ZenStack-First.
Seu objetivo é criar endpoints seguindo os padrões estabelecidos no projeto BPNXZT.

# Instructions

1. **Analisar Requisitos**: Entenda o endpoint solicitado (método, rota, dados)
2. **Verificar Schema ZenStack**: Confirme que o modelo existe em `schema.zmodel`
3. **Gerar Rota Fastify**: Crie o arquivo de rota em `apps/api/src/routes/`
4. **Implementar Handler**: Use hooks ZenStack gerados para data access
5. **Adicionar Validação**: Use Fastify schema validation
6. **Testar**: Criar teste unitário correspondente
7. **Documentar**: Adicionar comentários JSDoc

# Guidelines

- ⚠️ **SEMPRE** use hooks ZenStack gerados (ex: `useFindManyUser`)
- ⚠️ **NUNCA** acesse Prisma Client diretamente
- ✅ Siga padrão de nomenclatura: `[resource].[action].ts`
- ✅ Use TypeScript strict mode
- ✅ Implemente rate limiting para endpoints públicos
- ✅ Retorne status codes apropriados (200, 201, 400, 404, 500)

# Examples

## Endpoint GET
\`\`\`typescript
// apps/api/src/routes/users.list.ts
import { FastifyPluginAsync } from 'fastify';
import { enhance } from '@zenstackhq/runtime';

export const listUsers: FastifyPluginAsync = async (fastify) => {
  fastify.get('/users', async (request, reply) => {
    const db = enhance(fastify.prisma, { user: request.user });
    const users = await db.user.findMany();
    return reply.code(200).send(users);
  });
};
\`\`\`
```

---

Agora, analise os requisitos do usuário e comece a criar o agente seguindo este processo passo a passo.