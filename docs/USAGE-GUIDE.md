# 📚 Guia Completo de Uso - Sistema de Compliance

Sistema de geração automática de documentação de compliance genérica e reutilizável para qualquer organização.

## 📖 Índice

1. [Visão Geral](#visão-geral)
2. [Instalação e Setup](#instalação-e-setup)
3. [Passo a Passo Completo](#passo-a-passo-completo)
4. [Modos de Execução](#modos-de-execução)
5. [Exemplos Práticos](#exemplos-práticos)
6. [Troubleshooting](#troubleshooting)
7. [Próximos Passos](#próximos-passos)

---

## 🎯 Visão Geral

O sistema consiste em **7 comandos Cursor** que trabalham juntos para:

1. ✅ **Coletar dados** da organização (questionário interativo)
2. ✅ **Gerar contextos** (business + técnico)
3. ✅ **Aplicar templates** de compliance (7 domínios)
4. ✅ **Validar e consolidar** documentação

**Resultado**: Estrutura completa de compliance em `docs/` pronta para auditorias, certificações e due diligence.

---

## 🔧 Instalação e Setup

### Pré-requisitos

- ✅ Cursor IDE instalado
- ✅ Git configurado
- ✅ Node.js 18+ (opcional, para processamento)

### Verificar Estrutura

```bash
# Verificar se os comandos estão no lugar
ls -la .cursor/commands/docs/compliance-*.md

# Verificar se os templates estão no lugar
ls -la .cursor/docs/templates/compliance/domains/
```

---

## 📋 Passo a Passo Completo

### Passo 1: Coletar Dados da Organização

**Objetivo**: Coletar informações essenciais sobre sua empresa

**Comando**:
```bash
/docs/compliance/collect-organization-info
```

**O que será perguntado**:

```
📝 QUESTIONÁRIO DE ORGANIZAÇÃO

🏢 INFORMAÇÕES BÁSICAS
  • Nome da Empresa: [Sua Empresa]
  • Domínio: [dominio.com]
  • Setor: [Fintech/SaaS/E-commerce/Outro]
  • Tamanho da Equipe: [1-10 / 11-50 / 51-200 / 200+]
  • Faturamento Anual: [$100k-1M / $1M-10M / $10M+]
  • Taxa de Crescimento: [0-50% / 50-100% / 100%+]

🏛️ ESTRUTURA ORGANIZACIONAL
  • CTO/Diretor de Tecnologia: [Nome e Email]
  • CISO/Diretor de Segurança: [Nome e Email]
  • Compliance Officer: [Nome e Email]
  • Email de Contato: [Email principal]

☁️ INFRAESTRUTURA TÉCNICA
  • Cloud Provider: [AWS / GCP / Azure / On-premises]
  • Serviço de Compute: [EC2 / App Engine / etc]
  • Banco de Dados: [RDS / Cloud SQL / etc]
  • Container Runtime: [Docker / Containerd]
  • Plataforma de Orquestração: [Kubernetes / ECS / etc]
  • CI/CD Platform: [GitHub Actions / GitLab CI / etc]

🔒 CONFORMIDADE
  • Regulações Aplicáveis: [LGPD / GDPR / SOC2 / etc]
  • Certificações: [ISO 27001 / SOC2 / etc]
  • Data Última Auditoria: [Data]

📊 DADOS E RISCOS
  • Tipos de Dados: [Dados pessoais / Financeiros / Saúde / etc]
  • Operações Críticas: [Pagamentos / Autenticação / API / etc]
```

**Resultado**:
```
✅ Configuração salva em: .compliance-config.json
```

**Arquivo criado**: `.compliance-config.json` (reutilizado pelos próximos comandos)

---

### Passo 2: Gerar Contexto de Negócio

**Objetivo**: Gerar documentação sobre perfil e contexto da empresa

**Comando**:
```bash
/docs/compliance/generate-business-context
```

**O que faz**:
- Lê dados de `.compliance-config.json`
- Substitui placeholders ({{COMPANY_NAME}}, etc)
- Gera 4 documentos em `docs/business-context/`

**Documentos gerados**:
```
docs/business-context/
├── README.md (índice)
├── company-profile.md (perfil da empresa)
├── industry-overview.md (visão do setor)
└── stakeholder-map.md (mapa de stakeholders)
```

**Tempo estimado**: 1-2 minutos

---

### Passo 3: Gerar Contexto Técnico

**Objetivo**: Gerar documentação sobre arquitetura e stack técnico

**Comando**:
```bash
/docs/compliance/generate-technical-context --analyze
```

**O que faz**:
- Lê dados de `.compliance-config.json`
- Flag `--analyze`: detecta stack do projeto automaticamente
- Substitui placeholders técnicos
- Gera 4 documentos em `docs/technical-context/`

**Documentos gerados**:
```
docs/technical-context/
├── README.md (índice)
├── ARCHITECTURE.md (arquitetura)
├── infrastructure-overview.md (visão de infraestrutura)
└── stack-summary.md (resumo de tecnologias)
```

**Tempo estimado**: 1-2 minutos

---

### Passo 4: Aplicar Templates de Compliance

**Objetivo**: Aplicar templates de compliance para domínios específicos

**Domínios Disponíveis**:
```
1. security ..................... Segurança da Informação (15 docs)
2. soc2 ......................... Conformidade SOC2 (12 docs)
3. privacy ...................... Proteção de Dados/LGPD (14 docs)
4. business-continuity ......... Continuidade de Negócios (8 docs)
5. ai-governance ............... Governança de IA (10 docs)
6. due-diligence ............... Avaliação de Riscos (6 docs)
7. governance .................. Estrutura de Compliance (20+ docs)
```

**Comando para cada domínio**:
```bash
# Segurança
/docs/compliance/apply-template-set domain=security

# SOC2
/docs/compliance/apply-template-set domain=soc2

# Proteção de Dados
/docs/compliance/apply-template-set domain=privacy

# ... (repetir para outros domínios conforme necessário)
```

**Tempo estimado por domínio**: 1-2 minutos

---

### Passo 5: Validar Estrutura

**Comando**:
```bash
# Listar tudo que foi gerado
find docs/ -name "*.md" | head -20

# Contar total de documentos
find docs/ -name "*.md" | wc -l
```

**Esperado**:
```
✅ docs/business-context/ ........... 4 docs
✅ docs/technical-context/ .......... 4 docs
✅ docs/security/ ................... 15 docs
✅ docs/soc2/ ....................... 12 docs
✅ docs/privacy/ .................... 14 docs

Total: 49+ documentos
```

---

## 🚀 Modos de Execução

### Modo 1: Completo (Interativo)

```bash
/docs/build-compliance-docs
```

**Fluxo**:
1. Coleta dados (se não existir `.compliance-config.json`)
2. Gera business context
3. Gera technical context
4. Pergunta: Quais domínios aplicar?
5. Aplica todos selecionados

**Tempo**: 10-15 minutos

---

### Modo 2: Específico (Um Domínio)

```bash
/docs/build-compliance-docs domain=security
```

Aplica apenas um domínio de compliance.

**Tempo**: 2-3 minutos

---

### Modo 3: Rápido

```bash
/docs/build-compliance-docs --quick
```

Questão mínima + templates padrão (security + soc2)

**Tempo**: 5 minutos

---

### Modo 4: Teste com Dataset Fictício

```bash
# Fintech Startup (alta criticidade)
/docs/build-compliance-docs --test-dataset=fintech

# SaaS B2B (média criticidade)
/docs/build-compliance-docs --test-dataset=saas-b2b
```

Usa dados pré-configurados sem perguntas. Perfeito para:
- Entender a estrutura
- Testar integração
- Ver exemplos de cada domínio

**Tempo**: 2-3 minutos

---

## 💡 Exemplos Práticos

### Exemplo 1: Fintech Completa

Você é uma startup fintech e quer documentação completa:

```bash
# Passo 1: Executar com dataset fintech
/docs/build-compliance-docs --test-dataset=fintech

# Resultado:
# ✅ 75+ documentos criados
# ✅ Contextos: business + technical
# ✅ Domínios: security, soc2, privacy, governance

# Passo 2: Revisar a estrutura
cd docs/
find . -type d | head -20

# Passo 3: Customizar com dados reais
# (Editar placeholders gerados)
```

---

### Exemplo 2: SaaS Específica para SOC2

Você é SaaS e precisa apenas de SOC2:

```bash
# Passo 1: Coletar dados
/docs/compliance/collect-organization-info

# Passo 2: Gerar contextos
/docs/compliance/generate-business-context
/docs/compliance/generate-technical-context --analyze

# Passo 3: Aplicar apenas SOC2
/docs/compliance/apply-template-set domain=soc2

# Resultado:
# ✅ 12 documentos SOC2 + contextos
# ✅ Pronto para auditoria SOC2
```

---

### Exemplo 3: Criar Comitês de Governança

```bash
# Criar comitê de IA
/docs/compliance/create-committee type=ia

# Criar comitê de Compliance
/docs/compliance/create-committee type=compliance

# Resultado:
# governance/comites/2-ia/ (7 documentos)
# governance/comites/1-compliance/ (6 documentos)
```

---

## 🔍 Troubleshooting

### Problema: "Config file not found"

```
❌ .compliance-config.json não existe
```

**Solução**:
```bash
/docs/compliance/collect-organization-info
```

Isso cria o arquivo necessário.

---

### Problema: "Templates not found"

```
❌ Templates de compliance não encontrados
```

**Solução**:
Verifique se a estrutura de templates está em:
```bash
ls -la .cursor/docs/templates/compliance/domains/
```

Se não existir, restaure do git:
```bash
git checkout .cursor/docs/templates/
```

---

### Problema: "Permission denied"

```
❌ Sem permissão para escrever em docs/
```

**Solução**:
```bash
chmod 755 docs/
```

---

## 📊 Próximos Passos

### 1. Revisar Documentação Gerada

```bash
# Abrir em editor
code docs/business-context/README.md
code docs/security/README.md
```

### 2. Customizar para Sua Organização

- ✏️ Editar nomes e datas
- ✏️ Adicionar detalhes específicos
- ✏️ Remover seções não aplicáveis

### 3. Integrar com Seu Fluxo

- 📋 Usar para auditorias
- 📋 Usar para certificações
- 📋 Usar para due diligence
- 📋 Usar para onboarding de segurança

### 4. Manter Atualizado

```bash
# Quando mudanças significativas:
/docs/compliance/collect-organization-info --reset
/docs/compliance/generate-business-context
/docs/compliance/generate-technical-context
```

---

## 🆘 Suporte

- 📖 Leia os README.md em cada domínio
- 🔗 Veja exemplos nos próprios comandos
- 💬 Revise os comentários na documentação gerada

---

**Você está pronto para usar o sistema! 🚀**
