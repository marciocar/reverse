# Gerar Technical Context

Comando para gerar documentação de **Technical Context** automaticamente a partir dos templates e dados de infraestrutura coletados via questionário.

## Objetivo

Transformar templates genéricos de contexto técnico (em `.cursor/docs/templates/compliance/contexts/technical-context/`) em documentação **REAL** dentro de `docs/technical-context/`, substituindo todos os placeholders {{}} com dados da infraestrutura e stack técnico.

## Sintaxe

```bash
/docs/compliance/generate-technical-context
/docs/compliance/generate-technical-context --analyze
/docs/compliance/generate-technical-context --force
```

## Parâmetros e Flags

| Flag | Descrição |
|------|-----------|
| `--analyze` | Modo análise: detecta stack automaticamente (se possível) |
| `--review` | Modo interativo: confirma cada substituição |
| `--force` | Sobrescreve sem confirmar |
| `--dry-run` | Mostra o que seria gerado sem salvar |

## Pré-requisitos

- ✅ `.compliance-config.json` deve existir (criado por `collect-organization-info`)
- ✅ Templates em `.cursor/docs/templates/compliance/contexts/technical-context/`

## Fluxo de Execução

### 1. Validar Pré-requisitos
```
Verifica:
  ✓ Se .compliance-config.json existe
  ✓ Se templates existem
  ✗ Se faltam dados: lista quais
```

### 2. Carregar Dados de Infraestrutura
```
Lê .compliance-config.json:
  • Cloud Provider
  • Compute Service
  • Database Service
  • Container Runtime
  • Orchestration Platform
  • CI/CD Platform
```

### 3. Análise Opcional (--analyze)
```
Se --analyze ativado:
  ✓ Procura por arquivos package.json, requirements.txt, pom.xml, etc
  ✓ Detecta linguagens de programação usadas
  ✓ Identifica frameworks (Rails, Django, Node, etc)
  ✓ Descobre versões de runtime
  ✓ Popula dados de stack técnico
```

### 4. Carregar Templates
```
.cursor/docs/templates/compliance/contexts/technical-context/
  ✓ README.md
  ✓ ARCHITECTURE.md
  ✓ infrastructure-overview.md
  ✓ stack-summary.md
```

### 5. Substituir Placeholders

```
Infraestrutura:
  {{CLOUD_PROVIDER}} → "AWS"
  {{COMPUTE_SERVICE}} → "EC2"
  {{DATABASE_SERVICE}} → "RDS"
  {{CONTAINER_RUNTIME}} → "Docker"
  {{ORCHESTRATION_PLATFORM}} → "Kubernetes"
  {{CI_CD_PLATFORM}} → "GitHub Actions"

Stack Técnico (detectado):
  {{PROGRAMMING_LANGUAGES}} → "Python, JavaScript, Go"
  {{FRAMEWORKS}} → "Django, React, Node.js"
  {{MAIN_LANGUAGE}} → "Python"
  {{PRIMARY_FRAMEWORK}} → "Django"
  {{RUNTIME_VERSION}} → "3.11"
  {{NODE_VERSION}} → "18.x" (se aplicável)

Metadata:
  {{LAST_UPDATED}}
  {{ANALYSIS_DATE}}
  {{LAST_AUDITED}}
```

### 6. Gerar Documentos em `docs/technical-context/`

```
docs/technical-context/
├── README.md (índice)
├── ARCHITECTURE.md (arquitetura)
├── infrastructure-overview.md (visão geral)
└── stack-summary.md (resumo de stack)
```

### 7. Output e Confirmação

```
✅ Technical Context gerado com sucesso!

Documentos criados:
  • docs/technical-context/README.md
  • docs/technical-context/ARCHITECTURE.md
  • docs/technical-context/infrastructure-overview.md
  • docs/technical-context/stack-summary.md

Dados de infraestrutura integrados:
  • Cloud Provider: AWS
  • Compute: EC2
  • Database: RDS
  • Orchestration: Kubernetes

Análise técnica:
  • Linguagens: Python, JavaScript
  • Frameworks: Django, React
  
Próximos passos:
  1. Revisar docs/technical-context/
  2. Executar build-compliance-docs para orquestração completa
```

## Exemplos

### Exemplo 1: Geração Automática
```bash
/docs/compliance/generate-technical-context
```

**Output:**
```
🔄 Carregando configuração...
  ✓ .compliance-config.json carregado

🔄 Carregando dados de infraestrutura...
  • Cloud Provider: AWS
  • Database: RDS
  • Container Runtime: Docker
  • Orchestration: Kubernetes

🔄 Validando templates...
  ✓ 4 templates encontrados
  ✓ Estrutura validada

🔄 Processando substituições...
  ✓ ARCHITECTURE.md (12 placeholders substituídos)
  ✓ infrastructure-overview.md (8 placeholders substituídos)
  ✓ stack-summary.md (6 placeholders substituídos)
  ✓ README.md (2 placeholders substituídos)

📝 Gerando documentos...
  ✓ docs/technical-context/ARCHITECTURE.md (criado)
  ✓ docs/technical-context/infrastructure-overview.md (criado)
  ✓ docs/technical-context/stack-summary.md (criado)
  ✓ docs/technical-context/README.md (criado)

✅ Technical Context gerado com sucesso!
Total: 4 documentos
```

### Exemplo 2: Com Análise de Stack
```bash
/docs/compliance/generate-technical-context --analyze
```

**Output:**
```
🔄 Carregando configuração...
  ✓ .compliance-config.json carregado

🔄 Modo --analyze ativado
  Analisando estrutura do projeto...

📊 Stack Detectado:
  ✓ Linguagens: Python 3.11, JavaScript (ES2020)
  ✓ Frameworks: Django 4.2, React 18.2
  ✓ Databases: PostgreSQL 15, Redis 7.0
  ✓ Runtime: Python 3.11, Node.js 18.17
  ✓ CI/CD: GitHub Actions

🔄 Processando substituições com dados detectados...
  ✓ Substituições automáticas: 28
  ✓ Stack-summary.md enriquecido com análise

📝 Gerando documentos...
  ✓ docs/technical-context/ criados

✅ Technical Context gerado com análise!
```

### Exemplo 3: Modo Review
```bash
/docs/compliance/generate-technical-context --review
```

**Output:**
```
🔄 Modo Review ativado - confirme cada substituição

Processando: ARCHITECTURE.md

Placeholder: {{CLOUD_PROVIDER}}
  Substituir por: "AWS"
  [y/n] y

Placeholder: {{COMPUTE_SERVICE}}
  Substituir por: "EC2"
  [y/n] y

[... confirmações ...]

✅ Geração concluída com confirmações
```

## Exemplos de Saída Gerada

### ARCHITECTURE.md (gerado)
```markdown
# Arquitetura Técnica

## Visão Geral

Acme Corp utiliza uma arquitetura moderna baseada em cloud native, 
implantada em **AWS** com container orchestration via **Kubernetes**.

## Componentes Principais

### Infraestrutura Cloud
- **Provider**: AWS
- **Região Primária**: us-east-1
- **Compute**: EC2 instances
- **Container Runtime**: Docker

### Banco de Dados
- **Serviço**: RDS (Relational Database Service)
- **Tipo**: PostgreSQL 15
- **Multi-AZ**: Sim

### Plataforma de Orquestração
- **Plataforma**: Kubernetes
- **Gerenciado por**: AWS EKS
- **Versão**: 1.28

### CI/CD
- **Platform**: GitHub Actions
- **Pipeline**: Automatizado em cada commit
```

### stack-summary.md (gerado com --analyze)
```markdown
# Resumo da Stack Técnica

## Linguagens de Programação
- **Python**: 3.11 (backend principal)
- **JavaScript**: ES2020 (frontend)
- **SQL**: PostgreSQL 15

## Frameworks e Bibliotecas
### Backend
- Django 4.2 (web framework)
- Django REST Framework 3.14
- Celery (task queue)

### Frontend
- React 18.2
- Redux Toolkit
- TypeScript 5.x

## Databases
- **PostgreSQL**: 15.2 (dados transacionais)
- **Redis**: 7.0 (cache e sessions)
- **Elasticsearch**: 8.x (busca)

## Runtimes
- **Python**: 3.11.x
- **Node.js**: 18.17.x
- **Docker**: Latest stable

## Orchestração
- **Kubernetes**: 1.28
- **Provider**: AWS EKS
```

## Validações

- ✓ Valida se `.compliance-config.json` existe
- ✓ Valida se templates existem
- ✓ Valida se todos os placeholders podem ser substituídos
- ✓ Cria diretório se não existir
- ✓ Confirma antes de sobrescrever (exceto com --force)
- ✓ Se --analyze: detecta stack e valida

## Placeholders Suportados

Baseados em `.compliance-config.json` + Análise:

```
Infraestrutura:
  {{CLOUD_PROVIDER}}
  {{COMPUTE_SERVICE}}
  {{DATABASE_SERVICE}}
  {{CONTAINER_RUNTIME}}
  {{ORCHESTRATION_PLATFORM}}
  {{CI_CD_PLATFORM}}

Stack (detectado com --analyze):
  {{PROGRAMMING_LANGUAGES}}
  {{FRAMEWORKS}}
  {{MAIN_LANGUAGE}}
  {{PRIMARY_FRAMEWORK}}
  {{RUNTIME_VERSION}}
  {{DATABASE_ENGINES}}
  {{CACHE_SYSTEMS}}
  {{MESSAGE_BROKERS}}

Metadata:
  {{LAST_UPDATED}}
  {{ANALYSIS_DATE}}
  {{STACK_ANALYZED}} (true se --analyze)
```

## Dependências

- `.compliance-config.json` (criado por `collect-organization-info`)
- Templates em `.cursor/docs/templates/compliance/contexts/technical-context/`
- (Opcional) Arquivos de projeto para análise (package.json, requirements.txt, etc)

## Integrações

- **Fase 4a**: Requisita dados de `collect-organization-info`
- **Fase 4b**: Depende de `generate-business-context` (sequencial)
- **Fase 4c**: Gera docs reais em `docs/technical-context/` ← **VOCÊ ESTÁ AQUI**
- **Fase 5**: Integrado em `build-compliance-docs`

## Status MVP

- ✅ Geração automática de 4 documentos
- ✅ Substituição de placeholders infraestrutura
- ✅ Validação de pré-requisitos
- ✅ Modo --analyze (detecção de stack)
- ✅ Modo --review
- ✅ Modo --dry-run
- ⏳ Detecção automática mais profunda (fase futura)
- ⏳ Sugestões inteligentes de valores (fase futura)

---

**Nota**: Technical Context deve ser gerado após Business Context para fluxo completo de contexto da organização.
