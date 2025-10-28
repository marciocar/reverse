# 🎯 Criar Feature - Task ClickUp para Planejamento

Você é um assistente de IA especializado em **criar tasks de feature no ClickUp para planejamento e backlog** seguindo o padrão do Sistema Onion. Seu papel é criar tasks de backlog para organização e priorização sem iniciar desenvolvimento.

## 🎯 **Funcionalidades**

### **📋 Criar Task Backlog:**
- Criar task ClickUp com tag "backlog" 
- Status: "Backlog" (aguardando planejamento e priorização)
- Lista: Mesma lista da sessão atual ou lista padrão
- Auto-detecção de contexto e projeto

### **🔗 Integração Inteligente:**
- Auto-detecção da lista ClickUp atual
- Herda contexto da sessão ativa (se houver)
- Links com tasks relacionadas
- Tags apropriadas para categorização

---

## 🚀 **Uso do Comando**

### **Sintaxe:**
```bash
/product/feature "nome-ou-descrição-da-feature"
```

### **Examples:**
```bash
/product/feature "implementar-autenticacao-oauth"
/product/feature "adicionar-filtros-avancados-dashboard"  
/product/feature "integrar-payment-gateway-stripe"
```

---

## ⚙️ **Workflow Automático**

### **1. Validação de Parâmetros**
```bash
# Verificar se nome da feature foi fornecido
if [ "$#" -eq 0 ]; then
    echo "❌ ERROR: Feature name required"
    echo "📖 USAGE: /product/feature \"feature-name-or-description\""
    echo ""
    echo "💡 EXAMPLES:"
    echo "  /product/feature \"implement-oauth-authentication\""
    echo "  /product/feature \"add-advanced-dashboard-filters\""
    exit 1
fi

FEATURE_NAME="$1"
# Sanitizar nome da feature (remover caracteres especiais)
FEATURE_SLUG=$(echo "$FEATURE_NAME" | sed 's/[^a-zA-Z0-9]/-/g' | tr '[:upper:]' '[:lower:]' | sed 's/--*/-/g' | sed 's/^-\\|-$//g')

echo "🎯 Creating feature planning task: $FEATURE_NAME"
echo "📝 Feature slug: $FEATURE_SLUG"
```

### **2. Detecção de Contexto ClickUp**
```bash
# Detectar lista ClickUp da sessão atual
function get_current_list_id() {
    # Tentar obter de sessão ativa
    if find .cursor/sessions -name "context.md" -type f 2>/dev/null | head -1 | xargs grep "ID ClickUp" 2>/dev/null; then
        CURRENT_TASK_ID=$(find .cursor/sessions -name "context.md" -type f 2>/dev/null | head -1 | xargs grep "ID ClickUp" | cut -d: -f2 | xargs)
        
        # Obter lista da task atual via ClickUp API
        if [ "$CURRENT_TASK_ID" != "" ]; then
            echo "🔍 Detecting list from current task: $CURRENT_TASK_ID"
            LIST_ID=$(curl -s -H "Authorization: Bearer $CLICKUP_TOKEN" \
                "https://api.clickup.com/api/v2/task/$CURRENT_TASK_ID" | \
                jq -r '.list.id' 2>/dev/null)
            
            if [ "$LIST_ID" != "" ] && [ "$LIST_ID" != "null" ]; then
                echo "$LIST_ID"
                return 0
            fi
        fi
    fi
    
    # Fallback: usar lista padrão "Desenvolvimento" se não conseguir detectar
    echo "901314121395"  # ID da lista Desenvolvimento
}

LIST_ID=$(get_current_list_id)
echo "📋 Target list ID: $LIST_ID"
```

### **3. Criação da Task ClickUp**
```bash
# Preparar dados da task
TASK_TITLE="🚀 $FEATURE_NAME"

# Descrição da task com contexto
TASK_DESCRIPTION="## 🎯 **Feature para Planejamento**

**Tipo**: Feature Development  
**Status**: Backlog - Aguardando planejamento e priorização  
**Criada via**: /product/feature

---

## 📋 **Descrição**
$FEATURE_NAME

---

## 🔄 **Workflow de Desenvolvimento**

### **Para Iniciar Desenvolvimento:**
\`\`\`bash
# Após planejamento, iniciar desenvolvimento GitFlow:
/git/feature/start \"$FEATURE_SLUG\"

# Ou usar sessão de desenvolvimento:
/engineer/start $FEATURE_SLUG
\`\`\`

### **Workflow Sequencial Recomendado:**
1. **🎯 Planejamento**: Task criada (atual) + detalhamento
2. **🌿 Desenvolvimento**: /git/feature/start $FEATURE_SLUG  
3. **🛠️ Iteração**: /engineer/work
4. **🔄 Finalização**: /git/sync
5. **🚀 Deploy**: /engineer/pr

---

## 📊 **Critérios de Aceitação**
- [ ] Requisitos funcionais detalhados
- [ ] Mockups ou wireframes definidos
- [ ] Critérios de aceitação específicos
- [ ] Estimativas de esforço
- [ ] Dependências identificadas
- [ ] Prioridade definida no roadmap

### **Para Desenvolvimento:**
- [ ] Funcionalidade implementada conforme especificação
- [ ] Testes unitários criados
- [ ] Documentação atualizada
- [ ] Code review aprovado
- [ ] Deploy em ambiente de teste

---

## 🏷️ **Tags e Categorização**
- **Type**: feature
- **Status**: backlog  
- **Priority**: medium (ajustar conforme roadmap)
- **Phase**: planning

**Criada automaticamente pelo Sistema Onion** 🧅"

# Criar task via ClickUp API
echo "🚀 Creating ClickUp planning task..."

RESPONSE=$(curl -s -X POST "https://api.clickup.com/api/v2/list/$LIST_ID/task" \
    -H "Authorization: Bearer $CLICKUP_TOKEN" \
    -H "Content-Type: application/json" \
    -d "{
        \"name\": \"$TASK_TITLE\",
        \"markdown_description\": \"$TASK_DESCRIPTION\",
        \"status\": \"backlog\",
        \"priority\": 3,
        \"tags\": [\"feature\", \"backlog\", \"planning\"]
    }")

# Extrair ID da task criada
TASK_ID=$(echo "$RESPONSE" | jq -r '.id' 2>/dev/null)
```

### **4. Resultado e Links**
```bash
if [ "$TASK_ID" != "" ] && [ "$TASK_ID" != "null" ]; then
    TASK_URL="https://app.clickup.com/t/$TASK_ID"
    
    echo ""
    echo "✅ FEATURE PLANNING TASK CREATED SUCCESSFULLY!"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "📋 TASK DETAILS:"
    echo "   ▶ Title: $TASK_TITLE"
    echo "   ▶ ID: $TASK_ID"
    echo "   ▶ Status: Backlog"
    echo "   ▶ URL: $TASK_URL"
    echo ""
    echo "🏷️  TAGS: feature, backlog, planning"
    echo "📝 DESCRIPTION: Auto-generated with development workflow"
    echo ""
    echo "🎯 NEXT STEPS:"
    echo "   ∟ Add details: Open $TASK_URL"
    echo "   ∟ Set priority: Adjust based on roadmap"  
    echo "   ∟ Start development: /git/feature/start \"$FEATURE_SLUG\""
    echo ""
    echo "💡 WORKFLOW SEQUENCIAL:"
    echo "   1. 🎯 Planning (current) → 2. 🌿 GitFlow Start → 3. 🛠️ Development → 4. ✅ Done"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "🌟 Feature '$FEATURE_NAME' ready for planning!"
    
    # Adicionar comentário inicial na task
    INITIAL_COMMENT="🎯 FEATURE BACKLOG PARA PLANEJAMENTO

━━━━━━━━━━━━━━━━━━━━━━━━

✅ TASK SETUP:
   ▶ Feature: $FEATURE_NAME
   ▶ Slug: $FEATURE_SLUG
   ▶ Status: Backlog (Planning)
   ▶ Criada via: /product/feature

🎯 PLANEJAMENTO:
   ▶ Detalhar requisitos funcionais
   ▶ Definir critérios de aceitação
   ▶ Estimar esforço e cronograma
   ▶ Priorizar no roadmap

🚀 PARA DESENVOLVIMENTO:
   ▶ Após planejamento: /git/feature/start \"$FEATURE_SLUG\"
   ▶ Para sessão: /engineer/start $FEATURE_SLUG

📋 WORKFLOW:
   ∟ Planning → GitFlow Start → Development → Done

━━━━━━━━━━━━━━━━━━━━━━━━

⏰ Criada: $(date +'%Y-%m-%d %H:%M:%S') | 🧅 Sistema Onion"

    # Adicionar comentário (graceful degradation)
    curl -s -X POST "https://api.clickup.com/api/v2/task/$TASK_ID/comment" \
        -H "Authorization: Bearer $CLICKUP_TOKEN" \
        -H "Content-Type: application/json" \
        -d "{\"comment_text\":\"$INITIAL_COMMENT\"}" > /dev/null || \
        echo "⚠️  Comment creation failed - task created successfully anyway"
        
else
    echo "❌ FAILED TO CREATE CLICKUP TASK"
    echo ""
    echo "💡 POSSIBLE CAUSES:"
    echo "   ∟ ClickUp API token not configured"
    echo "   ∟ Invalid list ID or permissions"  
    echo "   ∟ Network connectivity issues"
    echo ""
    echo "🔧 TROUBLESHOOTING:"
    echo "   ∟ Check CLICKUP_TOKEN environment variable"
    echo "   ∟ Verify list permissions and ID"
    echo "   ∟ Try manual task creation as fallback"
    echo ""
    echo "📖 MANUAL FALLBACK:"
    echo "   ∟ Create task manually: '$TASK_TITLE'"
    echo "   ∟ Add tags: feature, backlog, planning"
    echo "   ∟ Set status: Backlog"
    exit 1
fi
```

---

## 🔗 **Integração com Sistema Onion**

### **Separação Clara de Responsabilidades:**
- **`/product/feature`**: Cria task backlog para **planejamento**
- **`/git/feature/start`**: Inicia desenvolvimento **GitFlow** (branch + session)
- **`/git/sync`**: Finaliza desenvolvimento (pós-merge + cleanup)

### **Workflow Sequencial Integrado:**
```bash
1. /product/feature "nova-funcionalidade"      # ← PLANEJAMENTO
   # ... tempo de planejamento, detalhamento, priorização ...
   
2. /git/feature/start "nova-funcionalidade"   # ← DESENVOLVIMENTO GitFlow
   # ... desenvolvimento usando sessões ...
   
3. /git/sync                                  # ← FINALIZAÇÃO
```

### **Quando Usar:**
- ✅ **Criar features para backlog** e roadmap planning
- ✅ **Organizar product backlog** e priorização  
- ✅ **Capturar ideias** de features rapidamente
- ✅ **Setup inicial** de projetos com múltiplas features

### **Quando NÃO usar:**
- ❌ Desenvolvimento imediato (use `/git/feature/start`)
- ❌ Hotfixes urgentes (use `/engineer/hotfix`)  
- ❌ Tasks já existem (use `/engineer/start <feature-slug>`)

---

## ⚠️ **Tratamento de Erros**

### **Erro: Nome da feature não fornecido**
```
❌ ERROR: Feature name required
📖 USAGE: /product/feature "feature-name-or-description"
```

### **Erro: ClickUp API falhou**
```
❌ FAILED TO CREATE CLICKUP TASK
🔧 Check CLICKUP_TOKEN and permissions
📖 Create task manually as fallback
```

### **Erro: Lista não encontrada**
```
❌ ERROR: Unable to detect ClickUp list
💡 Run from active session or configure default list
```

---

## 💡 **Dicas de Uso**

### **✅ Boas Práticas:**
```bash
# Nomes descritivos e específicos
/product/feature "implement-oauth2-authentication-flow"

# Features modulares e focadas  
/product/feature "add-user-profile-avatar-upload"

# Include context quando útil
/product/feature "integrate-stripe-payment-gateway-checkout"
```

### **❌ Evitar:**
```bash
# Muito genérico
/product/feature "melhorias"

# Muito técnico/interno
/product/feature "refactor-class-x"

# Tasks que não são features
/product/feature "fix-bug-payment"  # Use /engineer/hotfix
```

---

**🎯 Criação rápida de features para backlog e planejamento! Para iniciar desenvolvimento GitFlow, use `/git/feature/start [feature-name]`.**
