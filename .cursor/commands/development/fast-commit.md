# Prompt para Fast Commit: adiciona todas as mudanças e faz commit comentado
Use este comando para agilizar commits típicos no fluxo de trabalho do Sistema Onion.
Exemplo de uso:
```
.cursor git/fast-commit "feat: implement admin dashboard basic flow"
```
O comando realiza:
1. `git add .` — adiciona todas as mudanças na árvore do projeto
2. `git commit -m "<mensagem>"` — realiza o commit com a mensagem especificada

