# Templates de Padrões de Compliance

Esta pasta contém templates de padrões internacionais de compliance e certificação.

## 📋 Templates Disponíveis

| Template | Padrão | Descrição |
|----------|--------|-----------|
| `compliance_iso27001_template.md` | ISO 27001 | Sistema de Gestão de Segurança da Informação (ISMS) |
| `compliance_iso22301_template.md` | ISO 22301 | Sistema de Gestão de Continuidade de Negócios (BCMS) |
| `compliance_soc2_template.md` | SOC 2 Type II | Trust Services Criteria (Segurança, Disponibilidade, Integridade, Confidencialidade) |
| `compliance_pmbok_template.md` | PMBOK Guide | Project Management Body of Knowledge |
| `compliance_context_template.md` | Framework Genérico | Arquitetura de Contexto de Compliance |

## 🎯 Uso

Estes templates são referenciados pelos agentes especializados em compliance:

- `@iso-27001-specialist` → `compliance_iso27001_template.md`
- `@iso-22301-specialist` → `compliance_iso22301_template.md`
- `@soc2-specialist` → `compliance_soc2_template.md`
- `@pmbok-specialist` → `compliance_pmbok_template.md`
- `@security-information-master` → Todos os templates acima

## 📁 Estrutura

```
.cursor/docs/templates/compliance/
├── standards/          # ← Você está aqui (templates de padrões)
│   ├── compliance_iso27001_template.md
│   ├── compliance_iso22301_template.md
│   ├── compliance_soc2_template.md
│   ├── compliance_pmbok_template.md
│   └── compliance_context_template.md
└── domains/            # Templates por domínio específico
    ├── security/
    ├── soc2/
    ├── privacy/
    └── ...
```

## ⚠️ Importante

- **NÃO** coloque templates em `.cursor/commands/` - eles aparecerão como comandos no menu
- Templates devem estar em `.cursor/docs/templates/` para serem referenciados pelos agentes
- Comandos executáveis devem estar em `.cursor/commands/`

## 🔄 Histórico

- **2025-01-XX**: Templates movidos de `commands/common/templates/` para `docs/templates/compliance/standards/` para evitar que apareçam como comandos no menu do Cursor.

