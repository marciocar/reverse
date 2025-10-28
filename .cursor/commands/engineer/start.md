
# Engineer Start

Este é o comando para iniciar o desenvolvimento de uma funcionalidade.

## Configuração
- Se não estivermos em uma feature branch, peça permissão para criar uma
- Se estivermos em uma feature branch que corresponde ao nome da funcionalidade, estamos prontos.
- Certifique-se de que existe uma pasta .cursor/sessions/<feature-slug>
- Peça ao usuário o input para esta sessão (você receberá um ou mais tasks do ClickUp para trabalhar)

## Análise

Analise as tasks, pais e filhos se necessário, e construa um entendimento inicial do que precisa ser desenvolvido. 

### **📋 Análise de Estrutura Híbrida:**
**IMPORTANTE**: O sistema agora suporta **checklists nativos** do ClickUp. Durante a análise:

1. **Leia a task principal** usando ClickUp MCP (`get_task` com `subtasks=true`)
2. **Verifique checklists nativos** em cada subtask para action items interativos
3. **Combine informações** de descrição markdown + checklists nativos
4. **Monitore progresso** baseado no status dos checklists (resolved/unresolved)
5. **Documente estrutura híbrida** no context.md

### **🔍 Questões de Análise:**
Pense cuidadosamente sobre o que é solicitado, certifique-se de entender exatamente:
    - Por que isso está sendo construído (contexto)
    - Qual é o resultado esperado para esta task? (objetivo)
    - Como deve ser construído, apenas direcionalmente, não em detalhes (abordagem)
    - Se requer o uso de novas APIs/ferramentas, você as entende?
    - Como deve ser testado?
    - Quais são as dependências?
    - Quais são as restrições?
    - **NOVO**: Qual é o status atual dos checklists nativos? (se existirem)

Após refletir sobre essas questões, formule as 3-5 clarificações mais importantes necessárias para completar a tarefa. Pergunte essas questões ao humano, enquanto também fornece seu entendimento e sugestões.

Depois de obter as respostas do humano, considere se precisa fazer mais perguntas. Se sim, faça mais perguntas ao humano.

Uma vez que tenha um bom entendimento do que está sendo construído, salve-o no arquivo .cursor/sessions/<feature-slug>/context.md e peça ao humano para revisar.

Se o humano concordar com seu entendimento, você pode prosseguir para o próximo passo. Caso contrário, continue iterando juntos até obter aprovação explícita para seguir em frente.

Se algo que você discutiu aqui afeta o que foi escrito nos requisitos, peça permissão ao humano para editar esses requisitos e fazer ajustes seja editando (mudanças estruturais) ou adicionando comentários (clarificações).

Se o requisito estiver em um card do ClickUp, edite o card do ClickUp.
Se o requisito for de um arquivo de texto, edite o arquivo de texto.

## Arquitetura

Dado seu entendimento do que será construído, você agora procederá ao desenvolvimento da arquitetura da funcionalidade. O documento de arquitetura deve mapear o que está sendo construído, os componentes, as dependências, os padrões, as tecnologias, as restrições, as suposições, os trade-offs, as alternativas, as consequências.

É aqui que você colocará seu chapéu de pensamento ultra e considerará o melhor caminho para construir a funcionalidade, considerando também os padrões e melhores práticas deste projeto.

Nesta seção, espera-se que você analise o código fonte relevante, entenda sua estrutura e propósito, e então construa uma arquitetura que se alinha com os padrões e melhores práticas do projeto.

Dicas:
   - Use mcp__RepoPrompt__search (se disponível) para encontrar arquivos específicos baseados nas respostas de descoberta
   - Use mcp__RepoPrompt__set_selection e read_selected_files (se disponível) para ler código relevante em batch
   - Mergulhe fundo em funcionalidades e padrões similares
   - Analise detalhes específicos de implementação
   - Use WebSearch e ou context7 para melhores práticas ou documentação de bibliotecas (se necessário)

Seu documento de arquitetura deve incluir:
    - Uma visão geral de alto nível do sistema (antes e depois da mudança)
    - Componentes afetados e suas relações, dependências
    - Padrões e melhores práticas que serão mantidos ou introduzidos
    - Dependências externas que serão usadas ou que precisam ser adicionadas ao projeto
    - Restrições e suposições
    - Trade-offs e alternativas
    - Consequências negativas (se houver) da implementação deste design
    - Lista dos principais arquivos a serem editados/criados

Se ajudar a construir um diagrama MERMAID, sinta-se livre para fazê-lo.

Se, a qualquer momento, você tiver dúvidas ou encontrar algo que contradiga o que entendeu anteriormente, peça esclarecimentos ao humano.

Uma vez que tenha um bom entendimento do que está sendo construído, salve-o no arquivo .cursor/sessions/<feature-slug>/architecture.md e peça ao humano para revisar.

Se o humano concordar com seu entendimento, você pode prosseguir para o próximo passo. Caso contrário, continue iterando juntos até obter aprovação explícita para seguir em frente.

Uma vez que o architecture.md esteja finalizado, informe ao humano que você está pronto para prosseguir para o próximo passo.

## 🔄 **Auto-Update ClickUp**

Este comando **automaticamente atualiza** a task ClickUp quando inicia:

### **✅ Updates Automáticos SEMPRE:**
- **Status → "In Progress"** quando sessão tem task-id válido
- **Comentário de início** com detalhes da arquitetura e plano
- **Tag 'in-development'** para tracking de progresso
- **Atualização do context.md** com informações arquiteturais

### **💬 Formato do Comentário Automático:**
```
🚀 DESENVOLVIMENTO INICIADO

━━━━━━━━━━━━━━━━━━━━━━━━

🏗️ SESSÃO ATIVADA:
   ▶ Branch: feature/[slug]
   ▶ Sessão: .cursor/sessions/[slug]/
   ▶ Arquitetura: Definida e validada

📋 PLANO DE IMPLEMENTAÇÃO:
   ∟ Fase 1: [Descrição]
   ∟ Fase 2: [Descrição]
   ∟ Fase N: [Descrição]

🎯 STACK TECNOLÓGICO:
   ∟ [Tecnologias definidas na arquitetura]

━━━━━━━━━━━━━━━━━━━━━━━━

⏰ Iniciado: [TIMESTAMP] | 🎯 Próximo: Implementar Fase 1
```

### **📋 Identificação da Task:**
1. **Context.md**: Lê task-id do arquivo `.cursor/sessions/[slug]/context.md`
2. **ClickUp MCP**: Usa `get_task` com `subtasks=true` para estrutura completa
3. **🆕 PHASE-SUBTASK MAPPING**: Cria mapeamento automático fase→subtask no context.md
4. **Checklists Nativos**: Lê e incorpora checklists nativos na análise
5. **Status Híbrido**: Combina informações de texto + checklists interativos
6. **Não encontrada**: Pergunta ao usuário se deve vincular a uma task específica

### **🗺️ OBRIGATÓRIO: Criar Phase-Subtask Mapping**
Quando subtasks existem, o sistema deve **automaticamente**:
1. **Detectar subtasks** da task principal via ClickUp MCP
2. **Correlacionar com fases** do plan.md (por ordem ou nome)
3. **Salvar mapeamento** no context.md para uso pelo `/engineer/work`
4. **Validar correlação** e alertar se houver mismatch

### **🔄 Monitoramento de Checklists:**
- **Leitura automática** de todos os checklists nativos das subtasks
- **Status tracking** de action items (resolved: true/false, unresolved count)
- **Progress reporting** baseado em completion de checklists
- **Documentação** da estrutura híbrida no context.md

## Pesquisa

Se você não tem certeza de como uma biblioteca específica funciona, você pode usar Context7 e Perplexity para buscar informações sobre ela. Então, não tente adivinhar.

<feature-slug>
#$ARGUMENTS
</feature-slug>
