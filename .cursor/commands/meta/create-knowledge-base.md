# Criar Base de Conhecimento Inicial

Comando especializado para gerar bases de conhecimento densas e estruturadas através de pesquisas atualizadas (internet, documentos ou outros meios disponíveis) sobre tecnologias, ferramentas, projetos, produtos, serviços ou outros temas. O comando segue um fluxo lógico auto-ajustável que busca documentação oficial e gera um arquivo único bem estruturado e com referências.

## Requisitos do Usuário
<requirements>
#$ARGUMENTS
</requirements>

## Processo

### 1. Análise e Preparação Inicial

**1.1. Interpretar Requisitos do Usuário**
- Extrair do `#$ARGUMENTS`:
  - **Tema principal**: tecnologia, ferramenta, projeto, produto, serviço ou outro assunto
  - **Categoria sugerida** (opcional): se o usuário especificar categoria, usar; caso contrário, inferir
  - **Escopo**: determinar profundidade necessária (introdução, intermediário, avançado)
  - **Contexto**: verificar se há contexto específico do projeto relacionado

**1.2. Validar Estrutura de Diretórios**
- Verificar existência de `docs/knowbase/`
- Se não existir, criar estrutura base:
  ```
  docs/knowbase/
  ├── technologies/     # Tecnologias (React, Python, etc.)
  ├── tools/           # Ferramentas (Docker, VSCode, etc.)
  ├── projects/        # Projetos open-source ou comerciais
  ├── products/        # Produtos e serviços
  ├── frameworks/      # Frameworks e bibliotecas
  ├── concepts/        # Conceitos e metodologias
  └── platforms/       # Plataformas (AWS, Azure, etc.)
  ```
- Criar categoria específica se necessário

**1.3. Verificar Duplicação**
- Buscar arquivos existentes em `docs/knowbase/` que possam sobrepor o tema
- Se existir arquivo similar:
  - Informar ao usuário sobre possível duplicação
  - Perguntar se deseja atualizar existente ou criar novo
  - Se atualizar, ler arquivo existente para contexto

**1.4. Detecção e Processamento de Fontes Atualizadas**
- **Detectar links e referências no input do usuário:**
  - Identificar URLs (http://, https://) nos `#$ARGUMENTS`
  - Identificar referências a documentações oficiais mencionadas pelo usuário
  - Identificar menções a bibliotecas, frameworks ou ferramentas específicas
- **Obter data/hora atual do sistema:**
  - Capturar timestamp atual no formato ISO 8601: `YYYY-MM-DDTHH:mm:ssZ`
  - Usar como data de criação/atualização do documento
  - Incluir na metadata do arquivo gerado
- **Verificar versão do projeto (CRÍTICO):**
  - **Sempre pesquisar sobre a versão mais avançada e atual disponível** (padrão)
  - Verificar versão utilizada no projeto atual:
    - Consultar `package.json`, `requirements.txt`, `go.mod`, `Cargo.toml`, etc.
    - Verificar arquivos de configuração e dependências
    - Buscar imports/requires no código fonte
  - **Se projeto usa versão diferente da mais recente:**
    - Documentar claramente no documento: "⚠️ **Versão do Projeto**: [versão atual] | **Versão Mais Recente**: [versão mais nova]"
    - Incluir seção específica sobre diferenças e considerações de migração
    - Manter foco na versão mais recente na documentação principal
    - Adicionar nota sobre compatibilidade com versão do projeto quando relevante
- **Consultar base de conhecimento existente:**
  - Buscar em `docs/knowbase/**/*.md` por documentos relacionados ao tema
  - Extrair informações relevantes de documentos existentes
  - Identificar gaps de conhecimento que precisam ser preenchidos
  - Evitar duplicação de conteúdo já documentado
- **Buscar informações atualizadas via MCPs e fontes oficiais:**
  - **Se links foram fornecidos:** acessar, extrair conteúdo relevante, verificar data de atualização, documentar origem
  - **Se bibliotecas/frameworks foram mencionados:**
    - Usar MCP Context7 (`mcp_context7_resolve-library-id` → `mcp_context7_get-library-docs`)
    - **Sempre priorizar versão mais recente disponível** (não especificar versão = usar latest)
    - Buscar changelogs e release notes recentes
  - **Consultar documentações oficiais:** identificar site oficial, buscar documentação mais recente
- **Sintetizar informações de múltiplas fontes:**
  - Consolidar informações de links fornecidos
  - Integrar dados de MCPs e documentações oficiais
  - Combinar com conteúdo da base de conhecimento existente
  - Resolver conflitos priorizando fontes oficiais e mais recentes
  - Documentar todas as fontes consultadas na seção de referências

### 2. Pesquisa Estruturada e Adaptativa

**2.1. Planejamento de Pesquisa**
- Definir estratégia de pesquisa baseada no tema:
  - **Tecnologias**: documentação oficial, tutoriais, best practices, changelogs recentes
  - **Ferramentas**: guias de uso, documentação API, casos de uso, comparações
  - **Projetos**: README, documentação, arquitetura, roadmap, comunidade
  - **Produtos/Serviços**: features, pricing, use cases, integrações, limitações
  - **Conceitos**: definições, exemplos práticos, aplicações, evolução histórica

**2.2. Execução de Pesquisas Múltiplas**
- **Integrar com fontes já processadas na seção 1.4:**
  - Se links foram processados, usar informações extraídas como base
  - Se MCPs foram consultados, complementar com pesquisas adicionais
  - Se base de conhecimento foi consultada, evitar repetir informações já documentadas
- Realizar pesquisas complementares em paralelo quando necessário:
  - Pesquisa 1: "[tema] documentação oficial" (se não foi obtida via MCP)
  - Pesquisa 2: "[tema] best practices 2025"
  - Pesquisa 3: "[tema] getting started tutorial"
  - Pesquisa 4: "[tema] architecture overview"
  - Pesquisa 5: "[tema] common use cases"
- Ajustar termos de pesquisa baseado em resultados:
  - Se resultados genéricos demais, refinar com termos específicos
  - Se resultados muito técnicos, adicionar termos introdutórios
  - Se tema é muito novo, focar em documentação mais recente
  - Se informações já foram obtidas via links/MCPs, focar em gaps identificados

**2.3. Análise e Síntese de Resultados**
- Para cada resultado de pesquisa:
  - Extrair informações principais
  - Identificar padrões e consistências
  - Detectar informações contraditórias ou desatualizadas
  - Priorizar fontes oficiais e documentação recente
- Consolidar informações em estrutura lógica

### 3. Estruturação da Documentação

**3.1. Definir Estrutura do Documento**
- Criar estrutura base adaptável ao tema:
  ```markdown
  # [Título do Tema]
  
  ## 📋 Visão Geral
  [Descrição concisa do tema, propósito principal, contexto de uso]
  
  ## 🎯 Conceitos Fundamentais
  [Conceitos essenciais para entender o tema]
  
  ## 🏗️ Arquitetura/Componentes
  [Estrutura, componentes principais, como funciona]
  
  ## 🚀 Guia de Início Rápido
  [Passos práticos para começar a usar]
  
  ## 💡 Casos de Uso Comuns
  [Exemplos práticos e aplicações reais]
  
  ## ⚙️ Configuração e Setup
  [Como configurar, instalar, preparar ambiente]
  
  ## 📚 Recursos e Referências
  [Links para documentação oficial, tutoriais, comunidade]
  
  ## 🔄 Atualizações e Roadmap
  [Versões recentes, mudanças importantes, direção futura]
  
  ## ⚠️ Limitações e Considerações
  [O que não fazer, limitações conhecidas, trade-offs]
  
  ## 🎓 Aprofundamento
  [Tópicos avançados, extensões, integrações]
  ```

**3.2. Adaptar Estrutura ao Tema**
- **Tecnologias**: enfatizar sintaxe, padrões, ecosystem
- **Ferramentas**: enfatizar instalação, configuração, workflows
- **Projetos**: enfatizar arquitetura, contribuição, roadmap
- **Produtos**: enfatizar features, pricing, integrações
- **Conceitos**: enfatizar definições, exemplos, aplicações práticas

### 4. Geração do Conteúdo

**4.1. Escrita Densa e Estruturada**
- Para cada seção:
  - Escrever conteúdo denso mas legível
  - Usar exemplos práticos quando relevante
  - Incluir code blocks quando aplicável (com syntax highlighting)
  - Adicionar tabelas comparativas quando útil
  - Usar listas hierárquicas para organização
- Garantir que cada seção tenha valor independente
- Evitar redundância entre seções

**4.2. Inclusão de Informações Atualizadas**
- **Sempre priorizar versão mais recente disponível** (padrão quando não especificado)
- Priorizar informações de 2025 (ano atual)
- Mencionar mudanças significativas em versões recentes
- **Referenciar datas de atualização:** incluir data de consulta de cada fonte, usar formato "Última verificação: [data] via [fonte]"

**4.3. Formatação e Qualidade**
- Usar markdown válido seguindo padrões do projeto
- Incluir links para fontes oficiais
- Adicionar emojis apenas quando extremamente informativos
- Manter consistência de formatação
- Validar hierarquia de headers (H1 → H2 → H3)

### 5. Validação e Finalização

**5.1. Revisão de Conteúdo**
- Verificar completude de todas as seções planejadas
- Validar precisão técnica das informações
- Confirmar que links estão corretos
- Garantir que não há informações contraditórias

**5.2. Criação do Arquivo**
- Determinar nome do arquivo em kebab-case baseado no tema
- Criar arquivo em `docs/knowbase/[categoria]/[nome-tema].md`
- Escrever conteúdo completo no arquivo
- **Adicionar metadata no topo com data/hora atual:**
  - Obter data/hora atual do sistema no formato ISO 8601
  - Incluir versão do documento baseada na data de criação/atualização
  - Formato padrão:
  ```markdown
  ---
  title: [Título]
  category: [categoria]
  version: [YYYY-MM-DDTHH:mm:ssZ]
  created: [YYYY-MM-DDTHH:mm:ssZ]
  updated: [YYYY-MM-DDTHH:mm:ssZ]
  sources:
    - type: [link|mcp|official-docs|knowbase]
      url: [URL se aplicável]
      consulted_at: [YYYY-MM-DDTHH:mm:ssZ]
      description: [Descrição da fonte]
  ---
  ```
  - **Para documentos atualizados:** manter `created` original e atualizar apenas `updated` e `version`

**5.3. Confirmação e Próximos Passos**
- Informar usuário sobre criação bem-sucedida
- Mostrar localização do arquivo criado
- Sugerir próximos passos:
  - Revisar conteúdo gerado
  - Adicionar informações específicas do projeto se necessário
  - Atualizar periodicamente conforme tema evolui

## Guidelines

### ✅ Boas Práticas

- ✅ Use múltiplas fontes, priorize documentação oficial e fontes confiáveis
- ✅ **Sempre pesquise versão mais recente disponível** (padrão quando não especificado)
- ✅ **Verifique versão do projeto e documente diferenças** se diferente da mais recente
- ✅ Detecte e processe links fornecidos pelo usuário
- ✅ Use MCPs (Context7) para documentações oficiais quando aplicável
- ✅ Consulte base de conhecimento existente em `docs/knowbase/**/*.md`
- ✅ Documente data/hora de consulta de todas as fontes
- ✅ Crie estrutura lógica adaptável ao tipo de tema
- ✅ Escreva conteúdo denso mas legível com exemplos práticos
- ✅ Use categorias apropriadas e siga convenção kebab-case

### ⚠️ Atenções Especiais

- ⚠️ **CRÍTICO**: Se projeto usa versão diferente da mais recente, documente claramente a diferença
- ⚠️ Verifique se informações não estão desatualizadas
- ⚠️ Valide informações contraditórias priorizando fontes oficiais
- ⚠️ Não ignore links fornecidos pelo usuário - sempre processe e documente
- ⚠️ Ao consultar base de conhecimento, evite duplicar conteúdo existente
- ⚠️ Não copie conteúdo diretamente - sintetize e adapte
- ⚠️ NUNCA indente triple backticks

### ❌ O Que Evitar

- ❌ Confiar em uma única fonte ou usar informações desatualizadas
- ❌ **Ignorar verificação de versão do projeto vs versão mais recente**
- ❌ Ignorar links ou referências fornecidas pelo usuário
- ❌ Criar documentos sem metadata de versão e data de atualização
- ❌ Duplicar conteúdo já existente na base de conhecimento sem verificar
- ❌ Usar informações sem documentar origem e data de consulta
- ❌ Criar estrutura muito rígida que não se adapta

## Exemplos

### Exemplo 1: Tecnologia com Verificação de Versão (React)

**Input:**
```
/docs/create-knowledge-base React - biblioteca JavaScript para interfaces de usuário
```

**Processo:**
1. Categoria inferida: `technologies/`
2. **Verificação de versão:**
   - Pesquisa versão mais recente: React 19.x (mais recente disponível)
   - Verifica `package.json`: encontra `"react": "^18.2.0"`
   - **Documenta diferença**: "⚠️ **Versão do Projeto**: 18.2.0 | **Versão Mais Recente**: 19.x"
3. Pesquisas executadas focadas na versão mais recente (19.x)
4. Arquivo criado: `docs/knowbase/technologies/react.md`

**Output esperado:**
- Documentação focada na versão mais recente (React 19.x)
- Seção destacada sobre diferenças entre versão do projeto (18.2.0) e mais recente
- Considerações de migração quando relevante
- Conceitos fundamentais, hooks, padrões de arquitetura

---

### Exemplo 2: Com Links e Fontes Atualizadas (React Query)

**Input:**
```
/docs/create-knowledge-base React Query - biblioteca de gerenciamento de estado assíncrono
Referências: https://tanstack.com/query/latest, https://github.com/TanStack/query
Biblioteca: @tanstack/react-query
```

**Processo:**
1. **Detecção de fontes:**
   - Links detectados: `https://tanstack.com/query/latest`, `https://github.com/TanStack/query`
   - Biblioteca detectada: `@tanstack/react-query`
   - Data/hora capturada: `2025-11-18T06:30:00Z`
2. **Verificação de versão:**
   - Pesquisa versão mais recente: React Query v5.x (mais recente)
   - Verifica `package.json`: encontra `"@tanstack/react-query": "^4.36.0"`
   - **Documenta diferença**: "⚠️ **Versão do Projeto**: 4.36.0 | **Versão Mais Recente**: 5.x"
3. **Consulta base de conhecimento:** busca em `docs/knowbase/**/*.md`, encontra documento existente
4. **Processamento:** acessa links fornecidos, usa MCP Context7 para documentação oficial (versão mais recente)
5. **Síntese:** consolida todas as fontes, identifica gaps (v5 não documentado)
6. Categoria inferida: `frameworks/`
7. Arquivo criado/atualizado: `docs/knowbase/frameworks/react-query.md`

**Output esperado:**
- Metadata completa:
  ```markdown
  ---
  title: React Query
  category: frameworks
  version: 2025-11-18T06:30:00Z
  created: 2025-11-18T06:30:00Z
  updated: 2025-11-18T06:30:00Z
  sources:
    - type: link
      url: https://tanstack.com/query/latest
      consulted_at: 2025-11-18T06:30:15Z
      description: Documentação oficial TanStack Query
    - type: link
      url: https://github.com/TanStack/query
      consulted_at: 2025-11-18T06:30:20Z
      description: Repositório GitHub oficial
    - type: mcp
      library: /tanstack/query
      consulted_at: 2025-11-18T06:30:25Z
      description: Documentação via Context7 MCP
    - type: knowbase
      path: docs/knowbase/frameworks/react-query.md
      consulted_at: 2025-11-18T06:30:10Z
      description: Base de conhecimento existente
  ---
  ```
- Conteúdo integrado de todas as fontes
- Informações sobre versão mais recente (v5)
- Referências documentadas com datas de consulta
- Sem duplicação de conteúdo já existente

## Checklist de Validação

### Estrutura
- [ ] Arquivo criado em `docs/knowbase/[categoria]/[nome].md`
- [ ] Categoria apropriada escolhida ou criada
- [ ] Nome do arquivo em kebab-case
- [ ] Estrutura lógica e navegável
- [ ] Hierarquia de headers correta (H1 → H2 → H3)

### Pesquisa
- [ ] Versão mais recente disponível foi pesquisada (padrão)
- [ ] Versão do projeto foi verificada e diferenças documentadas (se aplicável)
- [ ] Múltiplas fontes consultadas (oficiais priorizadas)
- [ ] Links fornecidos pelo usuário foram processados e documentados
- [ ] MCPs (Context7) foram utilizados quando aplicável
- [ ] Base de conhecimento existente foi consultada
- [ ] Data/hora de consulta de todas as fontes foi documentada

### Conteúdo
- [ ] Visão geral clara e concisa
- [ ] Conceitos fundamentais explicados
- [ ] Exemplos práticos incluídos quando relevante
- [ ] Quick start ou guia de início incluído
- [ ] Recursos e referências documentados
- [ ] Informações densas mas legíveis
- [ ] Sem informações contraditórias

### Formatação
- [ ] Markdown válido
- [ ] Code blocks com syntax highlighting quando aplicável
- [ ] Links funcionais e corretos
- [ ] Tabelas formatadas corretamente quando usadas
- [ ] Consistência de estilo mantida
- [ ] Triple backticks não indentados

### Qualidade
- [ ] Conteúdo relevante e útil
- [ ] Profundidade apropriada ao tema
- [ ] Sem duplicação desnecessária
- [ ] Estrutura adaptada ao tipo de tema
- [ ] Pronto para uso e referência
- [ ] **Metadata inclui versão e datas de criação/atualização**
- [ ] **Todas as fontes consultadas estão documentadas na metadata**
- [ ] **Conteúdo integra informações de links, MCPs e base de conhecimento**

## Comandos Relacionados

- `/docs/reverse-consolidate` - Sistema de engenharia reversa universal para análise de projetos
- `/docs/compliance-generate-technical-context` - Gerar documentação de contexto técnico a partir de templates
- `/docs/compliance-generate-business-context` - Gerar documentação de contexto de negócio a partir de templates

## Troubleshooting

### Problema: Pesquisas retornam resultados genéricos demais
**Solução**: Refinar termos de pesquisa com palavras-chave mais específicas, adicionar contexto técnico ou ano

### Problema: Informações contraditórias entre fontes
**Solução**: Priorizar documentação oficial, verificar datas de atualização, incluir ambas perspectivas com contexto

### Problema: Tema muito amplo para um único arquivo
**Solução**: Focar em aspectos fundamentais, criar estrutura modular, sugerir arquivos complementares se necessário

### Problema: Categoria não existe
**Solução**: Criar nova categoria seguindo padrão existente, documentar em estrutura de diretórios

### Problema: Arquivo duplicado detectado
**Solução**: Perguntar ao usuário se deseja atualizar existente ou criar novo, ler arquivo existente para contexto

## FAQ

**P: Posso especificar categoria manualmente?**  
R: Sim, inclua a categoria no argumento: `/docs/create-knowledge-base [tema] - categoria: [categoria]`

**P: O comando sempre pesquisa a versão mais recente?**  
R: Sim, por padrão sempre pesquisa a versão mais avançada e atual disponível. Se o projeto usar versão diferente, isso será claramente documentado no arquivo gerado.

**P: Como o comando detecta a versão do projeto?**  
R: Verifica arquivos de dependências (`package.json`, `requirements.txt`, `go.mod`, etc.) e código fonte para identificar versão em uso.

**P: Posso fornecer links ou referências?**  
R: Sim! Inclua URLs nos argumentos. O comando detectará, processará e documentará com data/hora de consulta.

**P: O comando consulta a base de conhecimento existente?**  
R: Sim, busca em `docs/knowbase/**/*.md` para evitar duplicação e integrar informações já documentadas.

**P: Como funciona a integração com MCPs?**  
R: Quando bibliotecas são mencionadas, usa MCP Context7 para buscar documentação oficial, sempre priorizando versão mais recente disponível.

---

## Resumo de Uso

**Sintaxe básica:**
```
/docs/create-knowledge-base [tema] - [descrição opcional]
```

**O que acontece:**
1. Analisa requisitos e determina categoria
2. Executa pesquisas estruturadas e adaptativas
3. Gera documentação densa e bem estruturada
4. Cria arquivo em `docs/knowbase/[categoria]/[tema].md`
5. Confirma criação com localização

**Output:**
- Arquivo único com conhecimento estruturado
- Pronto para referência e consulta
- Informações atualizadas e validadas
- Formato consistente com outros arquivos de knowbase

---

**Exemplo de uso básico:**
```
/docs/create-knowledge-base TypeScript - linguagem tipada para JavaScript
```

**Exemplo com links e referências:**
```
/docs/create-knowledge-base Next.js - framework React para produção
Referências: https://nextjs.org/docs, https://github.com/vercel/next.js
```

**Exemplo com biblioteca específica:**
```
/docs/create-knowledge-base React Query - biblioteca de gerenciamento de estado assíncrono
Biblioteca: @tanstack/react-query
```

**Nota:** O comando detecta automaticamente links, bibliotecas mencionadas e consulta a base de conhecimento existente, integrando todas as fontes no documento final com metadata completa de versão e datas de consulta.

