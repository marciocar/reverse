
# Engineer Work

Estamos atualmente trabalhando em uma funcionalidade que está especificada na seguinte pasta:

<folder>
#$ARGUMENTS
</folder>

Para trabalhar nisso, você deve:

- Ler todos os arquivos markdown na pasta
- Revisar o arquivo plan.md e identificar qual Fase está atualmente em progresso
- Apresentar ao usuário um plano para abordar a próxima fase

## 🔄 **Auto-Update ClickUp**

Este comando **automaticamente atualiza** a task ClickUp durante desenvolvimento:

### **✅ Updates Automáticos A CADA FASE:**
- **Comentário de progresso** quando fase é completada
- **SUBTASK STATUS UPDATE** - Atualiza status da subtask correspondente para "done"
- **Atualização do plan.md** com status e decisões
- **Progresso % estimado** baseado nas fases concluídas
- **Timestamp de atividade** para tracking temporal

### **🔗 CRITICAL: Phase→Subtask Mapping**
**OBRIGATÓRIO**: Quando uma fase é completada, o sistema deve:
1. **Identificar subtask correspondente** via mapeamento estabelecido no context.md
2. **Atualizar status da subtask** para "done" automaticamente
3. **Documentar conclusão** com timestamp e métricas da fase

### **💬 Formato do Comentário de Progresso:**
```
🔧 PROGRESSO DE DESENVOLVIMENTO

━━━━━━━━━━━━━━━━━━━━━━━━

📋 FASE COMPLETADA:
   ▶ [Nome da Fase]
   ▶ Arquivos modificados: [N] arquivos
   ▶ Funcionalidades: [Lista implementada]
   ▶ Testes: [Testes adicionados/atualizados]

✅ DECISÕES TÉCNICAS:
   ∟ [Decisões importantes tomadas]
   ∟ [Patterns utilizados]
   ∟ [Bibliotecas adicionadas]

🚀 PRÓXIMA FASE:
   ▶ [Nome da próxima fase]
   ▶ Estimativa: [Tempo estimado]
   ▶ Bloqueadores: [Se houver]

📊 PROGRESSO GERAL: [X]% completo ([Y]/[Z] fases)

━━━━━━━━━━━━━━━━━━━━━━━━

⏰ Atualização: [TIMESTAMP] | 🎯 Próximo: [Próxima ação]
```

### **📋 Identificação da Task:**
1. **Context.md**: Lê task-id do arquivo de contexto da sessão
2. **Sessão ativa**: Detecta automaticamente a sessão em `.cursor/sessions/`
3. **🆕 PHASE-SUBTASK MAPPING**: Lê mapeamento de context.md para correlacionar fases→subtasks

### **🗺️ SUBTASK MAPPING STRUCTURE (context.md):**
```markdown
## 📋 Phase-Subtask Mapping
- **Phase 1**: "Template Consolidation" → Subtask ID: [subtask-id-1]
- **Phase 2**: "Feature Commands" → Subtask ID: [subtask-id-2] 
- **Phase 3**: "Release Commands" → Subtask ID: [subtask-id-3]
- **Phase 4**: "Hotfix Commands" → Subtask ID: [subtask-id-4]
```

### **⚡ AUTOMATIC EXECUTION:**
Quando uma fase é marcada como "Completada ✅" no plan.md, o sistema deve:
1. Ler o mapeamento do context.md
2. Identificar a subtask correspondente àquela fase
3. Usar ClickUp MCP para atualizar subtask status → "done"
4. Adicionar comentário de conclusão na subtask

## Importante:

Quando você desenvolver o código para a fase atual, use os sub-agentes de desenvolvimento, code-review e teste quando apropriado para preservar o máximo possível do seu contexto.
Toda vez que completar uma fase do plano:
- **AUTO-UPDATE**: Adicione comentário de progresso no ClickUp automaticamente
- Pause e peça ao usuário para validar seu código.
- Faça as mudanças necessárias até ser aprovado
- Atualize a fase correspondente no arquivo plan.md marcando o que foi feito e adicionando comentários úteis para o desenvolvedor que abordará as próximas fases, especialmente sobre questões, decisões, etc.
- Apenas inicie a próxima fase após o usuário concordar que você deve começar. Quando iniciar a próxima fase, atualize o arquivo plan.md marcando a nova fase como em progresso.

Agora, veja a fase atual de desenvolvimento e forneça um plano ao usuário sobre como abordá-la. 

