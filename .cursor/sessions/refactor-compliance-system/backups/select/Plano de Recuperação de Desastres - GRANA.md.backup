**Plano de Recuperação de Desastres (DRP) \- GRANA.AI**  

**Versão:** 1.0 

**Data:** 06 de outubro de 2025 

**1\. Introdução e Objetivos** 

Este documento fornece um plano estruturado para responder a um evento de  desastre que afete a infraestrutura da GRANA.AI hospedada na região us-east-1 da  AWS. Um desastre é definido como qualquer evento que cause uma interrupção  significativa dos serviços críticos. 

Os principais objetivos deste plano são: 

• **Minimizar a perda de dados:** Aderir ao Recovery Point Objective (RPO)  definido para cada serviço. 

• **Minimizar o tempo de inatividade:** Aderir ao Recovery Time Objective  (RTO) definido para cada serviço. 

• **Garantir uma recuperação ordenada e eficiente:** Fornecer passos claros  e testados para restaurar os serviços. 

**1.1. Escopo** 

Este plano cobre a recuperação dos seguintes serviços críticos na conta grana prd: 

• **Bancos de Dados:** RDS (foco em granaai-production) 

• **Aplicações em EC2:** keycloak, mattermost-n8n, granaai-openvpn-prd-us east-1 

• **Serviços em Contêineres:** Aplicações rodando em ECS e imagens no ECR. 

**2\. Papéis e Responsabilidades** 

A resposta a um desastre requer uma equipe coordenada. As seguintes funções  são essenciais:

| Papel  | Responsabilidades Principais Contato (Placeholder) |  |
| :---- | ----- | :---- |
| **Líder de Recuperação (DR Lead)** | Declara o desastre, coordena  todas as equipes, aprova os  passos críticos e comunica-se  com a liderança. | \[Nome do CTO/Head de  Engenharia\] |
| **Equipe de   Infraestrutura/Cloud** | Executa os passos técnicos de  recuperação (restore de  bancos, subida de instâncias),  valida a infraestrutura e   monitora o ambiente. | \[Nome do Líder   Técnico/SRE\] |
| **Equipe de   Comunicação** | Gerencia a comunicação  interna (status para as equipes) e externa (página de status,  notificações a clientes), se  aplicável. | \[Nome do Gerente de  Produto/Comunicação\] |

**3\. Critérios de Ativação** 

Este plano deve ser ativado pelo **Líder de Recuperação** se um ou mais dos  seguintes critérios forem atendidos: 

• **Indisponibilidade Regional:** Falha completa ou indisponibilidade  prolongada de um ou mais serviços da AWS na região us-east-1. 

• **Perda ou Corrupção de Dados Críticos:** Corrupção massiva ou perda de  dados no banco de dados granaai-production que não pode ser resolvida  por meios operacionais normais. 

• **Falha de Múltiplos Sistemas Críticos:** Indisponibilidade simultânea do  RDS e das principais aplicações em EC2/ECS. 

• **Incidente de Segurança Grave:** Um ataque que comprometa a integridade  e a disponibilidade da infraestrutura. 

**4\. Estratégia de Recuperação** 

• **Estratégia Geral: Backup e Restore na Mesma Região**. A recuperação  ocorrerá na região us-east-1, utilizando os backups gerenciados pelo AWS  Backup e os recursos nativos do RDS.  
• **Estratégia de Comunicação:** Um canal de comunicação de emergência  será estabelecido (ex: Slack \#disaster-recovery) para centralizar as  atualizações de status. 

**4.1. Ordem de Prioridade da Recuperação (Tiers)** 

1\. **Tier 0: Banco de Dados (RDS)** \- A fonte de dados é a prioridade máxima. 2\. **Tier 1: Aplicações Core (EC2/ECS)** \- Serviços essenciais para a operação. 

3\. **Tier 2: Serviços de Suporte (EC2)** \- Ferramentas de acesso e suporte como  VPN. 

**4.2. Passos Técnicos de Recuperação** 

**Tier 0: Recuperação do RDS (granaai-production)** 

• **RPO:** \~5 minutos (PITR) / 24 horas (Snapshot) | **RTO:** 30-60 minutos *Selecione o cenário apropriado:* 

• **Cenário A (Corrupção de Dados): Usar Point-in-Time Recovery (PITR)** 

1\. A **Equipe de Infraestrutura** identifica o momento exato antes da  corrupção dos dados. 

2\. No console do RDS, navegue até a instância granaai-production. 3\. Selecione **"Ações" \> "Restaurar para um ponto no tempo"**. 4\. Escolha a data e a hora identificadas no passo 1\. 

5\. Configure a nova instância (geralmente mantendo as mesmas  configurações) e inicie o processo. 

6\. Após a criação da nova instância, atualize as configurações de  conexão das aplicações para o novo endpoint do banco de dados. 

• **Cenário B (Falha Total da Instância): Usar Último Snapshot Válido** 

1\. A **Equipe de Infraestrutura** navega até o cofre granaai-rds-vault no  console do **AWS Backup**. 

2\. Localize o ponto de recuperação mais recente (diário, semanal, etc.)  para granaai-production. 

3\. Inicie um trabalho de restauração. 

4\. Configure a nova instância RDS e inicie o processo.  
5\. Atualize as configurações de conexão das aplicações para o novo  endpoint. 

**Tier 1 & 2: Recuperação das Instâncias EC2** 

• **RPO:** 24 horas | **RTO:** 1-2 horas 

1\. A **Equipe de Infraestrutura** navega até o cofre select-aws-backup-vault no  console do **AWS Backup**. 

2\. Identifique os pontos de recuperação mais recentes para as instâncias  necessárias (ex: i-0ecaac008f3bcc5f8 para keycloak). 

3\. Inicie um trabalho de restauração para cada instância, na ordem de  prioridade. 

4\. Durante a restauração, configure a VPC, sub-rede e grupos de segurança  corretos. 

5\. Após a criação das novas instâncias, valide o acesso e a funcionalidade. Se  os IPs mudaram, atualize os registros DNS internos ou externos, se  necessário. 

**Tier 1: Recuperação dos Serviços ECS** 

• **RPO:** N/A (Configuração versionada) | **RTO:** 5-15 minutos 

1\. A recuperação do ECS depende da restauração bem-sucedida de suas  dependências, principalmente o RDS. 

2\. A **Equipe de Infraestrutura** garante que o endpoint do banco de dados nas  configurações de ambiente das Task Definitions (ou no Parameter  Store/Secrets Manager) esteja apontando para a nova instância RDS  restaurada. 

3\. Redefina a contagem de tarefas desejadas para 0 e depois de volta para o  número original no serviço ECS para forçar uma nova implantação com a  configuração atualizada. 

4\. Se uma versão anterior da aplicação for necessária, selecione uma revisão  mais antiga da **Task Definition** ao atualizar o serviço. 

**5\. Procedimentos Pós-Recuperação**  
1\. **Validação Completa:** A **Equipe de Infraestrutura** realiza testes de ponta a  ponta para garantir que todas as aplicações estão funcionando como  esperado. 

2\. **Atualização de DNS:** Se IPs públicos mudaram, o **Líder de  Recuperação** garante que os registros DNS públicos sejam atualizados. 

3\. **Monitoramento Intensivo:** O ambiente recuperado deve ser monitorado de  perto por pelo menos 24 horas para identificar quaisquer anomalias. 

4\. **Análise Post-Mortem:** Após a estabilização do ambiente, o **Líder de  Recuperação** conduz uma reunião de post-mortem para documentar as  lições aprendidas e melhorar o DRP. 

**6\. Manutenção e Testes do Plano** 

• **Revisão:** Este DRP deve ser revisado e atualizado a cada **6 meses** ou  sempre que houver uma mudança significativa na arquitetura. 

• **Testes:** Um exercício de DR (DR Drill) deve ser conduzido **anualmente** para  validar os passos, testar os tempos de recuperação e treinar a equipe.