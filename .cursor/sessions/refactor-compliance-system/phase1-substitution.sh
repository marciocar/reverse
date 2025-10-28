#!/bin/bash
set -e

# ==============================================================================
# PHASE 1: Generalização de Documentos - Substituição Segura
# ==============================================================================
# Script MVP para substituir referências Granaai por placeholders {{}}
# com backup automático e validação

COMPLIANCE_DIR="/home/marciocar/reverse/.cursor/commands/docs/compliance"
BACKUP_DIR="/home/marciocar/reverse/.cursor/sessions/refactor-compliance-system/backups"
LOG_FILE="/home/marciocar/reverse/.cursor/sessions/refactor-compliance-system/phase1.log"

# Criar diretórios necessários
mkdir -p "$BACKUP_DIR"

echo "🚀 FASE 1: GENERALIZAÇÃO DE DOCUMENTOS" > "$LOG_FILE"
echo "=======================================" >> "$LOG_FILE"
echo "Data: $(date)" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# ==============================================================================
# PASSO 1: Backup de todos os arquivos a serem modificados
# ==============================================================================
echo "📦 Passo 1: Criando backups..." | tee -a "$LOG_FILE"

AFFECTED_FILES=$(grep -r "granaai\|grana\.ai\|grana\.com" "$COMPLIANCE_DIR" --include="*.md" 2>/dev/null | cut -d: -f1 | sort -u)
FILE_COUNT=$(echo "$AFFECTED_FILES" | wc -l)

echo "   ✅ $FILE_COUNT arquivos serão afetados" | tee -a "$LOG_FILE"

for file in $AFFECTED_FILES; do
    # Criar estrutura de backup preservando path relativo
    rel_path="${file#$COMPLIANCE_DIR/}"
    backup_file="$BACKUP_DIR/$rel_path.backup.$(date +%s)"
    mkdir -p "$(dirname "$backup_file")"
    cp "$file" "$backup_file"
done

echo "   ✅ Backups criados em: $BACKUP_DIR" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

# ==============================================================================
# PASSO 2: Substituições por tipo (MVP - Tipos 1-3)
# ==============================================================================
echo "🔄 Passo 2: Executando substituições..." | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

# TIPO 1: Nome da Empresa (Granaai, GRANAAI, grana.ai em certos contextos)
echo "   Tipo 1: Nome da Empresa (Granaai → {{COMPANY_NAME}})" | tee -a "$LOG_FILE"
find "$COMPLIANCE_DIR" -name "*.md" -exec sed -i 's/\bGranaai\b/{{COMPANY_NAME}}/g' {} \;
find "$COMPLIANCE_DIR" -name "*.md" -exec sed -i 's/\bGRANAAI\b/{{COMPANY_NAME}}/g' {} \;
TIPO1_COUNT=$(grep -r "{{COMPANY_NAME}}" "$COMPLIANCE_DIR" --include="*.md" 2>/dev/null | wc -l)
echo "   ✅ Tipo 1: $TIPO1_COUNT substitui ções" | tee -a "$LOG_FILE"

# TIPO 2: Domínio (grana.ai → {{COMPANY_DOMAIN}})
echo "   Tipo 2: Domínio (grana.ai → {{COMPANY_DOMAIN}})" | tee -a "$LOG_FILE"
find "$COMPLIANCE_DIR" -name "*.md" -exec sed -i 's/grana\.ai/{{COMPANY_DOMAIN}}/g' {} \;
TIPO2_COUNT=$(grep -r "{{COMPANY_DOMAIN}}" "$COMPLIANCE_DIR" --include="*.md" 2>/dev/null | wc -l)
echo "   ✅ Tipo 2: $TIPO2_COUNT substituições" | tee -a "$LOG_FILE"

# TIPO 3: Emails - Security email
echo "   Tipo 3a: security@grana.ai → {{SECURITY_EMAIL}}" | tee -a "$LOG_FILE"
find "$COMPLIANCE_DIR" -name "*.md" -exec sed -i 's/security@grana\.ai/{{SECURITY_EMAIL}}/g' {} \;

echo "   Tipo 3b: compliance@grana.ai → {{COMPLIANCE_EMAIL}}" | tee -a "$LOG_FILE"
find "$COMPLIANCE_DIR" -name "*.md" -exec sed -i 's/compliance@grana\.ai/{{COMPLIANCE_EMAIL}}/g' {} \;

echo "   Tipo 3c: ciso@grana.ai → {{CISO_EMAIL}}" | tee -a "$LOG_FILE"
find "$COMPLIANCE_DIR" -name "*.md" -exec sed -i 's/ciso@grana\.ai/{{CISO_EMAIL}}/g' {} \;

echo "   Tipo 3d: cto@grana.ai → {{CTO_EMAIL}}" | tee -a "$LOG_FILE"
find "$COMPLIANCE_DIR" -name "*.md" -exec sed -i 's/cto@grana\.ai/{{CTO_EMAIL}}/g' {} \;

echo "   Tipo 3e: devops-lead@grana.ai → {{DEVOPS_EMAIL}}" | tee -a "$LOG_FILE"
find "$COMPLIANCE_DIR" -name "*.md" -exec sed -i 's/devops-lead@grana\.ai/{{DEVOPS_EMAIL}}/g' {} \;

echo "   Tipo 3f: hr@grana.ai → {{HR_EMAIL}}" | tee -a "$LOG_FILE"
find "$COMPLIANCE_DIR" -name "*.md" -exec sed -i 's/hr@grana\.ai/{{HR_EMAIL}}/g' {} \;

echo "   Tipo 3g: denuncia@grana.ai → {{WHISTLEBLOWING_EMAIL}}" | tee -a "$LOG_FILE"
find "$COMPLIANCE_DIR" -name "*.md" -exec sed -i 's/denuncia@grana\.ai/{{WHISTLEBLOWING_EMAIL}}/g' {} \;

echo "   Tipo 3h: contato@grana.ai → {{CONTACT_EMAIL}}" | tee -a "$LOG_FILE"
find "$COMPLIANCE_DIR" -name "*.md" -exec sed -i 's/contato@grana\.ai/{{CONTACT_EMAIL}}/g' {} \;

TIPO3_COUNT=$(grep -r "{{.*_EMAIL}}" "$COMPLIANCE_DIR" --include="*.md" 2>/dev/null | wc -l)
echo "   ✅ Tipo 3: $TIPO3_COUNT substituições (emails)" | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"

# ==============================================================================
# PASSO 3: Validação
# ==============================================================================
echo "✅ Passo 3: Validação Final..." | tee -a "$LOG_FILE"

# Verificar se ainda existem referências não substituídas
REMAINING=$(grep -r "granaai\|grana\.ai\|grana\.com" "$COMPLIANCE_DIR" --include="*.md" 2>/dev/null | grep -v "{{" | wc -l || true)
echo "   Referências não substituídas: $REMAINING" | tee -a "$LOG_FILE"

if [ "$REMAINING" -eq 0 ]; then
    echo "   ✅ SUCESSO: 0 referências Granaai encontradas!" | tee -a "$LOG_FILE"
else
    echo "   ⚠️  ATENÇÃO: Ainda existem $REMAINING referências" | tee -a "$LOG_FILE"
    echo "   Samples:" | tee -a "$LOG_FILE"
    grep -r "granaai\|grana\.ai\|grana\.com" "$COMPLIANCE_DIR" --include="*.md" 2>/dev/null | grep -v "{{" | head -5 | tee -a "$LOG_FILE"
fi

echo "" | tee -a "$LOG_FILE"
echo "📊 RESUMO FASE 1" | tee -a "$LOG_FILE"
echo "===============" | tee -a "$LOG_FILE"
echo "✅ Arquivos processados: $FILE_COUNT" | tee -a "$LOG_FILE"
echo "✅ Tipo 1 ({{COMPANY_NAME}}): $TIPO1_COUNT" | tee -a "$LOG_FILE"
echo "✅ Tipo 2 ({{COMPANY_DOMAIN}}): $TIPO2_COUNT" | tee -a "$LOG_FILE"
echo "✅ Tipo 3 ({{*_EMAIL}}): $TIPO3_COUNT" | tee -a "$LOG_FILE"
echo "✅ Backup location: $BACKUP_DIR" | tee -a "$LOG_FILE"
echo "✅ Log file: $LOG_FILE" | tee -a "$LOG_FILE"

echo ""
echo "Phase 1 Complete! Check log: $LOG_FILE"
