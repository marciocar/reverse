# 📚 Sistema de Compliance - Documentação

Bem-vindo ao sistema de geração automática de documentação de compliance!

## 🎯 Começar Agora

### ⚡ Estou com pressa (5 minutos)
👉 Leia: **[QUICKSTART.md](QUICKSTART.md)**
- 3 cenários prontos
- Comandos simples
- Resultados rápidos

### 📖 Quero entender tudo (20 minutos)
👉 Leia: **[USAGE-GUIDE.md](USAGE-GUIDE.md)**
- Passo a passo completo
- Exemplos detalhados
- Troubleshooting

---

## 📦 O que é Este Sistema?

Sistema completo e genérico para gerar documentação de compliance em minutos:

✅ **7 Comandos Cursor** automatizados
✅ **68 Templates** genéricos e reutilizáveis
✅ **4 Modos** de execução (completo, rápido, teste, específico)
✅ **100% Customizável** com seus dados reais

---

## 🚀 3 Formas de Começar

### 1️⃣ Testar Sistema (2 minutos)

```bash
/docs/build-compliance-docs --test-dataset=fintech
```

Gera 75+ documentos com dados fictícios de uma fintech. Perfeito para ver como funciona.

### 2️⃣ Sua Empresa Rápido (5 minutos)

```bash
/docs/compliance/collect-organization-info
/docs/build-compliance-docs --quick
```

Responde questionário + gera 35+ documentos.

### 3️⃣ Apenas Um Domínio (2 minutos)

```bash
/docs/build-compliance-docs domain=security
```

Só segurança, só SOC2, só LGPD, etc.

---

## 📋 Documentos de Referência

| Documento | Descrição | Público |
|-----------|-----------|---------|
| **QUICKSTART.md** | Como começar rápido | Todos |
| **USAGE-GUIDE.md** | Guia completo e detalhado | Técnico |
| **.compliance-datasets.json** | 2 datasets fictícios para teste | Desenvolvedor |

---

## 🎯 Próximos Passos

1. **Leia um dos guias acima** (escolha QUICKSTART ou USAGE-GUIDE)
2. **Execute um comando** (teste com `--test-dataset=fintech`)
3. **Revise a documentação gerada** em `docs/`
4. **Customizar com seus dados** (remover placeholders `{{}}`)
5. **Usar para auditorias/certificações** 📋

---

## 📁 Estrutura de Saída

Quando você executa os comandos, a seguinte estrutura é criada:

```
docs/
├── business-context/
│   ├── README.md
│   ├── company-profile.md
│   ├── industry-overview.md
│   └── stakeholder-map.md
│
├── technical-context/
│   ├── README.md
│   ├── ARCHITECTURE.md
│   ├── infrastructure-overview.md
│   └── stack-summary.md
│
├── security/
│   ├── README.md
│   ├── information-security-policy.md
│   ├── incident-response.md
│   └── ... (15 docs total)
│
├── soc2/
│   ├── README.md
│   ├── soc2-controls-overview.md
│   └── ... (12 docs total)
│
├── privacy/
│   ├── README.md
│   ├── data-protection-policy.md
│   └── ... (14 docs total)
│
└── ... (outros domínios)
```

---

## 💡 Casos de Uso

| Caso | Comando |
|------|---------|
| Iniciar startup e precisa de compliance | `--quick` |
| Preparar para auditoria SOC2 | `domain=soc2` |
| Implementar LGPD | `domain=privacy` |
| Criar comitês de governança | `create-committee type=ia` |
| Testar e entender sistema | `--test-dataset=fintech` |
| Documentação completa | Sem flags (interativo) |

---

## 🆘 Precisa de Ajuda?

### Problema: Comando não encontrado
```bash
# Verificar se comandos existem
ls -la .cursor/commands/docs/compliance-*.md
```

### Problema: Config file not found
```bash
# Criar arquivo de configuração
/docs/compliance/collect-organization-info
```

### Problema: Templates not found
```bash
# Restaurar templates
git checkout .cursor/docs/templates/
```

Para mais, leia a seção **Troubleshooting** em [USAGE-GUIDE.md](USAGE-GUIDE.md)

---

## 📊 Sumário do Sistema

| Item | Quantidade |
|------|-----------|
| Comandos Cursor | 7 |
| Templates Compliance | 68 |
| Domínios Cobertos | 7 |
| Documentos por Domínio | 6-20 |
| Datasets de Teste | 2 |
| Contextos Automatizados | 2 (business + technical) |

---

## 🎓 Leia os Guias

```bash
# Rápido (5 min)
cat QUICKSTART.md

# Completo (20 min)
cat USAGE-GUIDE.md

# Ou abra no seu editor
code QUICKSTART.md
code USAGE-GUIDE.md
```

---

## 🚀 Você Está Pronto!

Escolha seu caminho:

👉 **Estou com pressa**: [QUICKSTART.md](QUICKSTART.md)
👉 **Quero aprender**: [USAGE-GUIDE.md](USAGE-GUIDE.md)

---

**Boa sorte! 🍀**
