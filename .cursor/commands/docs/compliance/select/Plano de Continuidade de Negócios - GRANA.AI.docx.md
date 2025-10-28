# **Plano de Continuidade de Negócios (BCP) – GRANA.AI**

Versão: 1.0

Data: 09 de outubro de 2025

Responsável:

## **1\. Objetivo**

O presente Plano de Continuidade de Negócios (BCP) tem como objetivo assegurar que as operações críticas da GRANA.AI possam continuar em níveis aceitáveis em caso de incidentes, falhas ou desastres que afetem a infraestrutura tecnológica ou processos operacionais que sustentam o contrato com a Serasa Experian. Este documento complementa os planos de Recuperação de Desastres (DRP) e Política de Backup e Restauração, detalhando as medidas preventivas, responsáveis e fluxos operacionais que garantem a resiliência e a disponibilidade dos serviços essenciais.

## **2\. Escopo**

O plano cobre os processos de negócio e operacionais diretamente ligados à continuidade do contrato, incluindo:

* • Disponibilidade da Aplicação GRANA.AI (produção – AWS ECS, RDS e EC2)  
* • Gestão de Incidentes e Comunicação com o Cliente (Serasa Experian)  
* • Atendimento técnico via GLPI (Suporte AWS / Sustentação Cloud)  
* • Acesso e Autenticação (Keycloak / VPN)  
* • Monitoramento e Alertas (Zabbix / CloudWatch / PRTG)  
* • Gestão de Mudanças e GMUDs programadas  
* • Rotina de Backups e Testes de Restauração

## **3\. Processos que Sustentam o Contrato**

| Processo | Descrição | Ferramenta / Sistema | Frequência | Responsável |
| :---- | :---- | :---- | :---- | :---- |
| Monitoramento de Disponibilidade | Acompanhamento contínuo de URLs, servidores e bancos de dados críticos. | Zabbix / CloudWatch | 24x7 | NOC / Sustentação Cloud |
| Abertura e Gestão de Chamados | Registro e tratamento de incidentes, requisições e comunicações com o cliente. | GLPI ITSM | Diário | Sustentação Cloud |
| Backups e Restauração de Dados | Execução e verificação de backups automáticos conforme RTO/RPO. | AWS Backup / RDS Snapshots | Diário / Semanal | CloudOps |
| Revisões de SLA e Indicadores | Análise dos SLAs de suporte, disponibilidade e performance. | Relatórios Mensais / Metabase | Mensal | Tech Lead AWS |
| Controle de Mudanças (GMUD) | Planejamento, aprovação e execução de alterações em produção. | ITSM / AWS CodePipeline | Conforme demanda | Sustentação / DevOps |
| Comunicação com Serasa Experian | Canal direto de escalonamento, atualizações e relatórios. | Email corporativo / Reuniões mensais | Sob demanda | Tech Lead AWS |
| Gestão de Acesso Seguro | Controle de VPN e autenticação SSO para ambientes produtivos. | Keycloak / OpenVPN | Contínuo | Segurança Cloud |

## 

## **4\. Estratégia de Continuidade**

1\. Prevenção:

• Monitoramento proativo dos sistemas 24x7.

• Backups diários e replicações automáticas no AWS Backup.

• Controle de acesso com autenticação multifator (MFA) e VPN segura.

2\. Resposta:

• Acionamento do plano de resposta a incidentes via GLPI.

• Comunicação imediata ao cliente (Serasa Experian) em até 30 minutos após confirmação de impacto.

• Prioridade máxima para restabelecimento de serviços críticos (Tier 0 e Tier 1).

3\. Recuperação:

• Ativação do DRP – Plano de Recuperação de Desastres.

• Restauração dos serviços a partir de snapshots e configurações versionadas (ECS/ECR).

• Validação pós-restauração e atualização de DNS, se necessário.

4\. Retorno à Normalidade:

• Comunicação de normalização ao cliente.

• Revisão de causa raiz e registro no post-mortem técnico.

• Atualização das métricas de SLA no relatório mensal.

## **5\. Comunicação e Escalonamento**

| Nível | Responsável | Função | Contato |
| :---- | :---- | :---- | :---- |
| 1º Nível | NOC / Sustentação Cloud | Monitoramento e resposta inicial | \[Canal interno Zabbix / Slack\] |
| 2º Nível | Tech Lead AWS | Validação técnica e comunicação com cliente | \[email corporativo\] |
| 3º Nível | Gerência Técnica / Diretoria | Aprovação de ações críticas e interface com Serasa | \[canal institucional\] |

## **6\. Testes e Revisões**

• Testes de Continuidade: executados anualmente, simulando indisponibilidades parciais e restauração completa do ambiente.

• Revisão do Plano: realizada a cada 6 meses ou quando houver mudanças significativas na arquitetura ou processos.

## **7\. Conclusão**

O presente plano confirma que a GRANA.AI dispõe de processos maduros, integrados e auditáveis para garantir a continuidade das operações e atendimento aos requisitos contratuais da Serasa Experian, mesmo em cenários de falhas ou incidentes críticos.