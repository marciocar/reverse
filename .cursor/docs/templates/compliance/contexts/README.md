# Templates de Contextos - Sistema de Compliance Genérico

Este diretório contém templates com placeholders {{VARIABLE}} para geração automática de documentação de contexto no sistema de compliance.

## 📁 Estrutura

```
contexts/
├── business-context/
│   ├── README.md
│   ├── company-profile.md
│   ├── industry-overview.md
│   └── stakeholder-map.md
└── technical-context/
    ├── README.md
    ├── ARCHITECTURE.md
    ├── infrastructure-overview.md
    └── stack-summary.md
```

## 🎯 Propósito

Estes templates são **GERADOS** automaticamente pela **Fase 4** (Questionário) do sistema de compliance refatorado.

### Fluxo de Utilização

1. **Fase 1-2**: Generalizar compliance + criar templates ← **VOCÊ ESTÁ AQUI**
2. **Fase 3**: Criar comandos de templates (sem dependência de dados)
3. **Fase 4**: ✨ **Questionário coleta dados → Gera arquivos REAIS em `docs/`**
4. **Fase 5**: Build command integra tudo

## 📝 Sobre os Placeholders

Todos os templates usam {{VARIABLE}} para máxima reutilização:

### Business Context Placeholders
- `{{COMPANY_NAME}}` - Nome da empresa
- `{{COMPANY_DOMAIN}}` - Domínio (company.com)
- `{{INDUSTRY}}` - Setor (Fintech, SaaS, etc)
- `{{TEAM_SIZE}}` - Tamanho da equipe
- `{{REVENUE}}` - Faturamento anual
- `{{GROWTH_RATE}}` - Taxa de crescimento
- `{{CTO_NAME}}`, `{{CISO_NAME}}`, `{{COMPLIANCE_OFFICER_NAME}}` - Roles

### Technical Context Placeholders
- `{{CLOUD_PROVIDER}}` - AWS, GCP, Azure
- `{{COMPUTE_SERVICE}}` - EC2, Compute Engine, etc
- `{{DATABASE_SERVICE}}` - RDS, Cloud SQL, etc
- `{{CONTAINER_RUNTIME}}` - Docker, Containerd
- `{{ORCHESTRATION_PLATFORM}}` - Kubernetes, ECS, etc
- `{{CI_CD_PLATFORM}}` - GitHub Actions, GitLab CI, etc

E muito mais! Ver seções dentro de cada template.

## 🔄 Processo Automático (Fase 4)

### Comando: `comply/generate-business-context`
```bash
Lê: .compliance-config.json
↓
Substitui {{PLACEHOLDERS}} com valores coletados
↓
Gera: docs/business-context/*.md (documentos reais)
```

### Comando: `comply/generate-technical-context`
```bash
Lê: .compliance-config.json + análise do código
↓
Substitui {{PLACEHOLDERS}} com valores detectados
↓
Gera: docs/technical-context/*.md (documentos reais)
```

## ✅ Status

- ✅ Templates criados com placeholders
- ✅ Estrutura centralizada em `.cursor/docs/templates/`
- ⏳ **Fase 4**: Comandos para gerar documentos reais
- ⏳ **Fase 5**: Integração com build-compliance-docs.md

---

**Nota**: Estes templates são **MODELOS** apenas. Os arquivos reais em `docs/` serão gerados automaticamente pela Fase 4 baseado em dados da organização.
