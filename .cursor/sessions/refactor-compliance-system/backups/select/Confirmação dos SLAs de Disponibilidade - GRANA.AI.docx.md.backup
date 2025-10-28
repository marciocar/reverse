# **Confirmação dos SLAs de Disponibilidade – GRANA.AI**

Versão: 1.1

Data: 09 de outubro de 2025

Responsável: Equipe de Sustentação Cloud – Select Soluções

## **1\. Objetivo**

Este documento confirma os SLAs (Service Level Agreements) vigentes para o contrato de serviços da GRANA.AI, garantindo alinhamento com os requisitos de disponibilidade e desempenho exigidos pela Serasa Experian. Os tempos e níveis de serviço aqui descritos abrangem a infraestrutura AWS (conta grana-prd) e o suporte técnico especializado, assegurando a continuidade operacional da aplicação.

## **2\. Disponibilidade dos Serviços**

| Categoria | Descrição | SLA de Disponibilidade |
| :---- | :---- | :---- |
| Infraestrutura AWS (EC2, RDS, ECS) | Serviços core da aplicação em produção | 99,9% |
| Armazenamento e Backup (S3, AWS Backup) | Backup diário e restauração conforme RPO/RTO definidos | 99,9% |
| Acesso e Autenticação (Keycloak, OpenVPN) | Componentes de autenticação e rede | 99,5% |
| Suporte Técnico | Atendimento via portal e monitoramento contínuo | Seg-Sex, 08h às 18h (Horário comercial) |

## **3\. Acordos de Nível de Serviço (SLA de Suporte Técnico)**

Os tempos máximos de resposta e solução seguem conforme o tipo de chamado e prioridade:

| SLA | Tipo de SLA | Tipo de Chamado | Tempo (hh:mm) |
| :---- | :---- | :---- | :---- |
| FIRST TIME RESPONSE | Primeira Resposta | Incidente / Requisição | 00:30 |
| Prioridade Muito Alta | Tempo de Solução | Incidente | 04:00 |
| Prioridade Alta | Tempo de Solução | Incidente | 08:00 |
| Prioridade Média | Tempo de Solução | Incidente | 16:00 |
| Prioridade Baixa | Tempo de Solução | Incidente | 32:00 |
| Prioridade Muito Baixa | Tempo de Solução | Incidente | 64:00 |
| Prioridade Muito Alta | Tempo de Solução | Requisição | 12:00 |
| Prioridade Alta | Tempo de Solução | Requisição | 24:00 |
| Prioridade Média | Tempo de Solução | Requisição | 48:00 |
| Prioridade Baixa | Tempo de Solução | Requisição | 72:00 |
| Prioridade Muito Baixa | Tempo de Solução | Requisição | 96:00 |

## **4\. Monitoramento e Conformidade**

O cumprimento dos SLAs é acompanhado mensalmente pelo sistema GLPI e por métricas de monitoramento em tempo real no Zabbix e AWS CloudWatch. Os relatórios de desempenho e disponibilidade são arquivados e revisados trimestralmente.

## **5\. Confirmação de Aderência**

Confirmamos que os níveis de serviço estabelecidos atendem plenamente aos requisitos contratuais de disponibilidade, resposta e recuperação, conforme solicitado pela Serasa Experian, garantindo resiliência e rastreabilidade de todas as métricas de suporte.

## **6\. Evidência de Disponibilidade Monitorada (Zabbix / CloudWatch)**

Com base no Relatório de SLA – AWS – GRANAAI-PRD (01 a 30 de setembro de 2025):

| Serviço / Componente | Uptime (%) | Indisponibilidade Total | Fonte |
| :---- | :---- | :---- | :---- |
| app.grana.ai (URL principal) | 99,94% | 24 min (4 eventos em 08/09/2025) | Zabbix |
| mattermost-n8n | 100,00% | 0 min | Zabbix |
| granaai-openvpn-prd-us-east-1 | 100,00% | 0 min | Zabbix |
| keycloak | 100,00% | 0 min | Zabbix |
| Média Global de Disponibilidade (set/2025) | 99,98% | \- | Consolidado |

Evidência anexa: Relatório de SLA – AWS – GRANAAI-PRD (09/10/2025)