# Formulários Eletrônicos de Compliance

## 📋 Estrutura dos Formulários

Esta pasta contém as estruturas markdown dos formulários que devem ser implementados no **Google Forms** (ou sistema similar).

## 📝 Formulários Disponíveis

1. **Declaração Anual de Conflito de Interesses** - Obrigatória para 100% dos colaboradores (janeiro)
2. **Declaração Pontual de Conflito de Interesses** - Quando surgir nova situação (5 dias úteis)
3. **Formulário KYC Pessoa Jurídica** - Onboarding de clientes
4. **Matriz de Risco PLD/FT** - Avaliação de risco de clientes

## 🔗 Implementação no Google Forms

### **Passo a Passo:**

1. Acesse [Google Forms](https://forms.google.com)
2. Crie novo formulário
3. Use a estrutura markdown como referência para criar perguntas
4. Configure:
   - Respostas em planilha (Google Sheets)
   - Notificações por e-mail
   - Restrição para domínio @{{COMPANY_DOMAIN}} (quando aplicável)
5. Compartilhe link com colaboradores

### **Configurações Recomendadas:**

-  Coletar endereço de e-mail
-  Limitar a 1 resposta (quando aplicável)
-  Enviar cópia da resposta ao respondente
-  Notificar proprietário ({{COMPLIANCE_EMAIL}})
-  Respostas obrigatórias marcadas com *

## 📊 Gestão de Respostas

- **Armazenamento**: Google Sheets vinculado
- **Backup**: Download mensal em CSV
- **Análise**: Comitê de Compliance (trimestral)
- **Retenção**: 10 anos

---

**{{COMPANY_NAME}} © 2025**
