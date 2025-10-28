# ⚡ Quick Start - 5 Minutos

Para quando você quer **RÁPIDO** documentação de compliance.

## 🎯 Cenário 1: Testar Sistema (2 min)

Quer ver como funciona sem perguntas?

```bash
# Executar com dados fictícios de Fintech
/docs/build-compliance-docs --test-dataset=fintech

# ✅ Resultado: 75+ documentos em docs/
```

**Explorar**:
```bash
# Listar o que foi gerado
ls -la docs/
cat docs/business-context/README.md
cat docs/security/README.md
```

---

## 🎯 Cenário 2: Sua Própria Empresa (5 min)

Quer gerar documentação para VOCÊ?

### Passo 1: Coletar dados (2 min)
```bash
/docs/compliance/collect-organization-info
```
Responda o questionário → `.compliance-config.json` criado

### Passo 2: Gerar tudo (3 min)
```bash
/docs/build-compliance-docs --quick
```

**✅ Pronto!** 35+ documentos em `docs/`

---

## 🎯 Cenário 3: Apenas Um Domínio (2 min)

Quer APENAS SOC2? APENAS Segurança?

```bash
# Segurança
/docs/build-compliance-docs domain=security

# SOC2
/docs/build-compliance-docs domain=soc2

# Proteção de Dados (LGPD)
/docs/build-compliance-docs domain=privacy

# Comitê de IA
/docs/compliance/create-committee type=ia
```

---

## 📋 Mapeamento Rápido

| Você quer... | Execute... | Tempo |
|--------------|-----------|-------|
| Testar | `--test-dataset=fintech` | 2 min |
| Rápido | `--quick` | 5 min |
| SOC2 | `domain=soc2` | 2 min |
| Segurança | `domain=security` | 2 min |
| LGPD | `domain=privacy` | 2 min |
| Tudo | Sem flags (interactive) | 15 min |

---

## 🚀 Usar Depois

Depois de gerar:

```bash
# Revisar
cd docs/
cat business-context/company-profile.md
cat security/information-security-policy.md

# Editar
# (Remover placeholders {{}} com seus dados)

# Usar para
# • Auditorias
# • Certificações
# • Due Diligence
# • Compliance interno
```

---

## 🆘 Problema?

```bash
# Se errro "config not found"
/docs/compliance/collect-organization-info

# Se erro "templates not found"
git checkout .cursor/docs/templates/

# Se erro "permission denied"
chmod 755 docs/
```

---

**Pronto? Vá para USAGE-GUIDE.md para instruções completas!** 📚
