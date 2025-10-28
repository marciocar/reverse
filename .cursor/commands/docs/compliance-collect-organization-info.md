# Coletar Informações da Organização

Comando interativo para coletar dados essenciais da organização que serão usados na geração automática de documentação de compliance e contextos.

## Objetivo

Através de um questionário interativo e estruturado, coletar informações sobre:
- **Perfil da Empresa**: Nome, domínio, setor, tamanho
- **Infraestrutura Técnica**: Cloud, arquitetura, databases
- **Pessoas-Chave**: CTOs, CISOs, Officers
- **Conformidade**: Regulações aplicáveis, certificações
- **Riscos**: Dados sensíveis, operações críticas

Salva as respostas em `.compliance-config.json` para reutilização automática.

## Sintaxe

```bash
/docs/compliance/collect-organization-info
/docs/compliance/collect-organization-info --quick
/docs/compliance/collect-organization-info --reset
```

## Parâmetros e Flags

| Flag | Descrição |
|------|-----------|
| `--quick` | Modo rápido (questões essenciais apenas) |
| `--reset` | Limpa config anterior e começa do zero |
| `--dry-run` | Mostra que seria salvo sem salvar |

## Fluxo de Execução

### 1. Verificar Config Existente
```
Procura por: .compliance-config.json
  ✓ Se existe: oferece opções (atualizar, usar, reset)
  ✗ Se não existe: começa novo questionnaire
```

### 2. Questões por Categoria

#### 📋 Informações Básicas
```
🏢 Nome da Empresa: [Acme Corp]
🌐 Domínio Principal: [acme.com]
📊 Setor: [Fintech / SaaS / E-commerce / Outro]
👥 Tamanho da Equipe: [1-10 / 11-50 / 51-200 / 200+]
💰 Faturamento Anual (USD): [100k-1M / 1M-10M / 10M+]
📈 Taxa de Crescimento Anual: [0-50% / 50-100% / 100%+]
```

#### 🏛️ Estrutura Organizacional
```
👔 CTO/Diretor de Tecnologia: [nome/email]
🔐 CISO/Diretor de Segurança: [nome/email]
⚖️ Compliance Officer: [nome/email]
📧 Email de Contato Principal: [email]
```

#### ☁️ Infraestrutura Técnica
```
☁️ Cloud Provider Principal: [AWS / GCP / Azure / On-premises / Híbrido]
🖥️ Serviço de Compute: [EC2 / App Engine / App Service / Outro]
🗄️ Banco de Dados: [RDS / Cloud SQL / DynamoDB / PostgreSQL / Outro]
🐳 Runtime de Container: [Docker / Containerd / Outro]
🎯 Plataforma de Orquestração: [Kubernetes / ECS / GKE / Outro]
🔄 CI/CD Platform: [GitHub Actions / GitLab CI / Jenkins / Outro]
```

#### 🔒 Conformidade
```
Quais regulações se aplicam? (selecionar múltiplas)
  ☑️ LGPD (Brasil)
  ☑️ GDPR (UE)
  ☑️ HIPAA (Saúde)
  ☑️ PCI-DSS (Pagamentos)
  ☑️ SOC 2 (SaaS/Cloud)
  ☑️ ISO 27001 (Segurança)
  ☑️ Outra: ___

Certificações ativas: [listagem]
Data última auditoria: [data]
```

#### 📊 Dados e Riscos
```
Tipos de dados processados: (múltipla escolha)
  ☑️ Dados pessoais
  ☑️ Dados financeiros
  ☑️ Dados médicos
  ☑️ Dados governamentais
  ☑️ IP/Trade secrets

Operações críticas: (múltipla escolha)
  ☑️ Processamento de pagamentos
  ☑️ Autenticação de usuários
  ☑️ API crítica
  ☑️ Dashboard de análise
  ☑️ Processamento em background
```

### 3. Gerar `.compliance-config.json`

```json
{
  "organizacao": {
    "nome": "Acme Corp",
    "dominio": "acme.com",
    "setor": "Fintech",
    "tamanho_equipe": "51-200",
    "faturamento_anual_usd": "1M-10M",
    "taxa_crescimento_anual": "50-100%",
    "ultima_atualizacao": "2025-10-28"
  },
  "pessoas": {
    "cto_nome": "João Silva",
    "cto_email": "joao@acme.com",
    "ciso_nome": "Maria Santos",
    "ciso_email": "maria@acme.com",
    "compliance_officer_nome": "Carlos Oliveira",
    "compliance_officer_email": "carlos@acme.com",
    "email_contato_principal": "compliance@acme.com"
  },
  "infraestrutura": {
    "cloud_provider": "AWS",
    "compute_service": "EC2",
    "database_service": "RDS",
    "container_runtime": "Docker",
    "orchestration_platform": "Kubernetes",
    "ci_cd_platform": "GitHub Actions"
  },
  "conformidade": {
    "regulacoes": ["LGPD", "SOC2"],
    "certificacoes_ativas": ["SOC2 Type II", "ISO 27001"],
    "data_ultima_auditoria": "2025-03-15"
  },
  "dados_riscos": {
    "tipos_dados": ["dados_pessoais", "dados_financeiros"],
    "operacoes_criticas": ["processamento_pagamentos", "autenticacao"]
  }
}
```

### 4. Salvar e Confirmar

```
✅ Configuração salva em: .compliance-config.json

Sumário:
  • Empresa: Acme Corp
  • Setor: Fintech
  • Equipe: 51-200 pessoas
  • Cloud: AWS
  • Regulações: LGPD, SOC2

Próximos passos:
  1. Usar `/docs/compliance/generate-business-context` para gerar docs de contexto
  2. Usar `/docs/compliance/apply-template-set` para aplicar templates
  3. Executar `build-compliance-docs` para orquestração completa
```

## Exemplos

### Exemplo 1: Modo Interativo Completo
```bash
/docs/compliance/collect-organization-info
```

**Output:**
```
📝 QUESTIONÁRIO DE ORGANIZAÇÃO - COMPLIANCE

Este questionário coleta informações essenciais para gerar 
documentação de compliance personalizada.

Tempo estimado: 5-10 minutos

─────────────────────────────────────────

🏢 INFORMAÇÕES BÁSICAS

Nome da Empresa: Acme Corp
Domínio Principal: acme.com
Setor: Fintech
Tamanho da Equipe: 51-200
Faturamento Anual (USD): 1M-10M
Taxa de Crescimento Anual: 50-100%

─────────────────────────────────────────

🏛️ ESTRUTURA ORGANIZACIONAL

CTO/Diretor de Tecnologia: João Silva <joao@acme.com>
CISO/Diretor de Segurança: Maria Santos <maria@acme.com>
Compliance Officer: Carlos Oliveira <carlos@acme.com>
Email de Contato Principal: compliance@acme.com

[... mais seções ...]

✅ Configuração salva!
```

### Exemplo 2: Modo Rápido
```bash
/docs/compliance/collect-organization-info --quick
```

**Output:**
```
📝 QUESTIONÁRIO RÁPIDO (Essencial)

Nome da Empresa: [?]
Domínio: [?]
Cloud Provider: [?]
Regulações: [?]

✅ Config mínima salva
```

### Exemplo 3: Reset
```bash
/docs/compliance/collect-organization-info --reset
```

**Output:**
```
⚠️ Você está prestes a limpar .compliance-config.json

Deseja continuar? [y/n] y

✅ Config anterior removida
📝 Iniciando novo questionário...
```

## Estrutura de Saída

### Arquivo Gerado: `.compliance-config.json`

Localização: Raiz do projeto
Formato: JSON estruturado
Uso: Lido automaticamente pelos comandos de geração

### Variáveis Geradas (para placeholders)

```
{{COMPANY_NAME}}
{{COMPANY_DOMAIN}}
{{INDUSTRY}}
{{TEAM_SIZE}}
{{REVENUE}}
{{GROWTH_RATE}}
{{CTO_NAME}}, {{CTO_EMAIL}}
{{CISO_NAME}}, {{CISO_EMAIL}}
{{COMPLIANCE_OFFICER_NAME}}, {{COMPLIANCE_OFFICER_EMAIL}}
{{CLOUD_PROVIDER}}
{{COMPUTE_SERVICE}}
{{DATABASE_SERVICE}}
{{REGULATIONS}} (joinado por ", ")
{{CERTIFICATIONS}} (joinado por ", ")
```

## Validações

- ✓ Valida formato de email
- ✓ Valida URLs de domínio
- ✓ Oferece sugestões para seleções
- ✓ Permite valores custom
- ✓ Confirma antes de sobrescrever config

## Dependências

- Nenhuma dependência externa
- Apenas leitura/escrita de `.compliance-config.json`

## Integrações

- **Fase 4a**: Coleta dados
- **Fase 4b**: Lido por `generate-business-context`
- **Fase 4c**: Lido por `generate-technical-context`
- **Fase 5**: Lido por `build-compliance-docs`

## Status MVP

- ✅ 5 categorias de questões
- ✅ Questões essenciais cobertas
- ✅ Modo rápido disponível
- ✅ Reset de config
- ⏳ Validações avançadas (fase futura)
- ⏳ Import/export (fase futura)
