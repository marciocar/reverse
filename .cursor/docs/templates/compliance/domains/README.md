# Templates de Compliance - Domínios

Conjunto completo de templates **100% genéricos** para geração automática de documentação de compliance em qualquer organização.

## 📁 Estrutura

```
domains/
├── security/              (Segurança da Informação)
├── soc2/                  (Conformidade SOC 2)
├── privacy/               (Proteção de Dados - LGPD)
├── business-continuity/   (Continuidade de Negócios)
├── ai-governance/         (Governança de IA)
├── due-diligence/         (Avaliação de Riscos)
└── governance/            (Estrutura de Compliance)
```

## 🎯 Usando os Templates

### Aplicar um domínio completo

```bash
/docs/compliance/apply-template-set domain=security
```

Substitui todos os {{PLACEHOLDERS}} com dados de `.compliance-config.json` e gera `docs/security/`.

### Aplicar um tipo específico de governance

```bash
/docs/compliance/use-governance-template type=formularios
```

Copia templates de `governance/templates/formularios/` com substituições.

### Criar comitê (governance)

```bash
/docs/compliance/create-committee type=ia
/docs/compliance/create-committee type=compliance
```

## 📝 Placeholders Disponíveis

Todos os templates usam {{VARIABLE}} para máxima reutilização:

### Organizacional
```
{{COMPANY_NAME}}
{{COMPANY_DOMAIN}}
{{INDUSTRY}}
{{TEAM_SIZE}}
{{REVENUE}}
{{GROWTH_RATE}}
```

### Pessoas
```
{{CTO_NAME}}, {{CTO_EMAIL}}
{{CISO_NAME}}, {{CISO_EMAIL}}
{{COMPLIANCE_OFFICER_NAME}}, {{COMPLIANCE_OFFICER_EMAIL}}
```

### Infraestrutura
```
{{CLOUD_PROVIDER}}
{{COMPUTE_SERVICE}}
{{DATABASE_SERVICE}}
{{CONTAINER_RUNTIME}}
{{ORCHESTRATION_PLATFORM}}
{{CI_CD_PLATFORM}}
```

### Compliance
```
{{REGULATIONS}}
{{CERTIFICATIONS}}
{{TIPOS_DADOS}}
{{OPERACOES_CRITICAS}}
```

## ✅ Garantias de Qualidade

- ✅ **Sem referências a empresas**: Nenhuma menção a Granaai, Serasa ou outras empresas
- ✅ **100% genéricos**: Funcionam para startups e empresas grandes
- ✅ **PT-BR**: Documentação em português com termos técnicos em inglês
- ✅ **Reutilizáveis**: Templates prontos para qualquer organização

## 🔄 Fluxo de Uso

```
1. Coletar dados da organização
   /collect-organization-info
   ↓ Cria .compliance-config.json

2. Gerar contexto de negócio
   /generate-business-context
   ↓ Cria docs/business-context/

3. Gerar contexto técnico
   /generate-technical-context --analyze
   ↓ Cria docs/technical-context/

4. Aplicar templates de compliance
   /apply-template-set domain=security
   /apply-template-set domain=privacy
   ... (mais domínios conforme necessário)
   ↓ Cria docs/security/, docs/privacy/, etc

5. Orquestração completa
   build-compliance-docs
```

## 📊 Domínios Disponíveis

### 🔒 Security (~15 templates)
Segurança da informação, controle de acesso, criptografia, resposta a incidentes, backup.

**Arquivos**: politica, matriz-permissoes, plano-resposta, risco-assessment.

---

### ✓ SOC2 (~12 templates)
Conformidade com SOC 2 Type II (Security, Availability, Integrity, Confidentiality).

**Arquivos**: security-controls, availability-controls, trust-services-criteria.

---

### 👤 Privacy (~14 templates)
Proteção de dados (LGPD), consentimento, direitos do titular, DPIA.

**Arquivos**: data-mapping-inventory, politica-consentimento, etc.

---

### 🏢 Business-Continuity (~8 templates)
RTO/RPO, backup, testes de recuperação, matriz de criticidade.

**Arquivos**: plano-continuidade, plano-recuperacao, resilience-testing.

---

### 🤖 AI-Governance (~10 templates)
Políticas de desenvolvimento, avaliação de risco, bias detection, auditoria.

**Arquivos**: ai-governance-policy, matriz-risco, etc.

---

### 📋 Due-Diligence (~6 templates)
Matriz de risco, avaliação de fornecedores, relatórios de conformidade.

**Arquivos**: checklist, matriz-risco, relatorio-avaliacao.

---

### 📚 Governance (~20+ templates)
Políticas corporativas, comitês, código de conduta, treinamento, termos.

**Estrutura**:
```
governance/
├── README.md
├── aml-policy.md
├── anti-corruption-policy.md
├── code-of-conduct.md
├── conflict-of-interest-policy.md
├── internal-regulations.md
└── templates/
    ├── comites/
    │   ├── 1-compliance/
    │   └── 2-ia/
    ├── ai-governance/
    ├── calendarios/
    ├── checklists/
    ├── formularios/
    ├── termos/
    └── treinamento/
```

## 🔗 Integração

Todos os templates são integrados pelos 6 comandos:

1. **compliance-create-committee.md** - Criar comitês
2. **compliance-use-governance-template.md** - Aplicar tipos específicos
3. **compliance-apply-template-set.md** - Aplicar domínio completo
4. **compliance-collect-organization-info.md** - Coletar dados
5. **compliance-generate-business-context.md** - Gerar contexto
6. **compliance-generate-technical-context.md** - Gerar contexto técnico

## 📖 Convenções

- **PT-BR**: Texto em português
- **Termos técnicos**: Em inglês (AWS, LGPD, SOC2, etc)
- **Placeholders**: {{UPPERCASE_WITH_UNDERSCORES}}
- **Nomes de arquivos**: lowercase-com-hifen.md

## 🚀 MVP Status

- ✅ Todos os 7 domínios funcionais
- ✅ Templates 100% genéricos
- ✅ Sem referências a empresas
- ✅ Integração com sistema de comandos
- ✅ Pronto para produção

---

**Criado**: 28 de outubro de 2025  
**Status**: Pronto para produção

